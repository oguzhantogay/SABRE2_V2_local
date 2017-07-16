import sys
import inspect
import linecache


class Parameters(object):
    
    __slots__ = ("types", "rtype", "exc")

    def __init__(self):
        self.types = None
        self.rtype = None
        self.exc = None

    def __repr__(self):
        return repr(self.__dict__)


class Function(object):

    __slots__ = ("callers", "defined_at", "parameters")
    
    def __init__(self):
        self.callers = []
        self.defined_at = None
        self.parameters = {}

    def __repr__(self):
        return repr(self.__dict__)


class Method(Function):
    pass


class Class(object):
    
    __slots__ = ("methods", "bases")

    def __init__(self):
        self.methods = {}
        self.bases = []

        
class Module(object):
    
    __slots__ = ("classes", "funcs")
    
    def __init__(self):
        self.classes = {None: {None: {}}}
        self.funcs = {}


class Tracer(object):

    def __init__(self):
        self.modules = {}
        self.current_call = []

    def enable(self):
        sys.settrace(self.trace_it)

    def disable(self):
        sys.settrace(None)

    def trace_it(self, frame, event, arg):
        # http://docs.python.org/library/inspect.html
        if event == "line":
            lineno = frame.f_lineno
            filename = frame.f_globals["__file__"]
            if filename == "<stdin>":
                filename = "__file__"
            if (filename.endswith(".pyc") or filename.endswith(".pyo")):
                filename = filename[:-1]
            name = frame.f_globals["__name__"]
            line = linecache.getline(filename, lineno)
            # print "LINE %s:%d: %s" % (name, lineno, line.rstrip())
        elif event in ("call", "c_call"):
            arginfo = inspect.getargvalues(frame)
            if arginfo.args and arginfo.args[0] == "self":
                # assume method
                # XXX: better check for bound method?
                self.trace_method(frame, arginfo)
            else:
                # assume function
                self.trace_function(frame, arginfo)
        elif event in ("return", "c_return"):
            self.trace_return(frame, arg)
        elif event in ("exception", "c_exception"):
            self.trace_exception(frame, arg)
        else:
            print "EVENT is", event
        return self.trace_it
    
    def trace_exception(self, frame, arg):
        (exception, exc_value, exc_traceback) = arg
        params = self.current_call.pop()
        if params is not None:
            params.exc = exception.__name__

    def trace_return(self, frame, result):
        params = self.current_call.pop()
        if params is not None:
            params.rtype = type(result).__name__

    def trace_function(self, frame, arginfo):
        line = frame.f_lineno
        module_name = frame.f_globals.get("__name__", "__cext__")
        func_name = frame.f_code.co_name
        print "*", func_name, arginfo
        arg_names, arg_values = arginfo.args, arginfo.locals
        module = self.modules.get(module_name)
        if module is None:
            module = self.modules[module_name] = Module()
        arg_types = []
        for arg in arg_names:
            aval = arg_values[arg]
            arg_types.append(type(aval).__name__)
        arg_names = tuple(arg_names)
        arg_types = tuple(arg_types)
        pkey = (arg_names, arg_types)
        func = module.funcs.get(func_name)
        if func is None:
            func = module.funcs[func_name] = Function()
        params = func.parameters.get(pkey)
        if params is None:
            params = func.parameters[pkey] = Parameters()
            func.defined_at = line
        print "#", pkey, arg_values
        func.callers.append(frame.f_back.f_lineno)
        self.current_call.append(params)

    def trace_method(self, frame, arginfo):
        line = frame.f_lineno
        arg_names, arg_values = arginfo.args, arginfo.locals
        obj = arginfo.locals["self"]
        module_name = frame.f_globals.get("__name__", "__cext__")
        #cls_name = "%s.%s" % (module, obj.__class__.__name__)
        cls_name = obj.__class__.__name__
        method_name = frame.f_code.co_name  # deprecated? use __name__ instead?
        arg_types = []
        for arg in arg_names:
            aval = arg_values[arg]
            arg_types.append(type(aval).__name__)
        module = self.modules.get(module_name)
        if module is None:
            module = self.modules[module_name] = Module()
        cls = module.classes.get(cls_name)
        if cls is None:
            cls = module.classes[cls_name] = Class()
        arg_names = tuple(arg_names[1:])
        arg_types = tuple(arg_types[1:])
        pkey = (arg_names, arg_types)
        method = cls.methods.get(method_name)
        if method is None:
            method = cls.methods[method_name] = Method()
        params = method.parameters.get(pkey)
        if params is None:
            params = method.parameters[pkey] = Parameters()
            method.defined_at = line
        method.callers.append(frame.f_back.f_lineno)
        self.current_call.append(params)


def test_func(param):
#    print param
    return param


class TestObj(object):

    def __init__(self):
        pass

    def test_method(self, mp=123):
        return mp * 2
    
    def test_err(self):
        raise RuntimeError()
    
    def test_inner(self, a):
        def twice(b):
            return b * 2
        return twice(a)

def test_func(foo=None):
    return foo

def main():
    import os
    os.path.join("etc", "passwd")
    foo = "bar"
    test_func(1)
    o = TestObj()
    o.test_method(4)
    o.test_method(mp=5.6)
    o.test_inner("a")
    test_func()

    try:
        o.test_err()
    except:
        pass

t = Tracer()
t.enable()
main()
t.disable()
import pprint
for mod_name, module in t.modules.items():
    for cls_name, cls in module.classes.items():
        if cls_name is None:
            continue
        print "class", mod_name, ".", cls_name, cls.bases
        for method_name, method in cls.methods.items():
            print "\t# line %s" % method.defined_at
            for (arg_names, arg_types), param in method.parameters.items():
                print "\tdef", method_name, zip(arg_names, arg_types), "->", param.rtype
                if param.exc:
                    print "\t  throws", param.exc

    for func_name, func in module.funcs.items():
        print "# line %s" % func.defined_at
        for (arg_names, arg_types), param in func.parameters.items():
            print "def", mod_name, ".", func_name, zip(arg_names, arg_types), "->", param.rtype
            if param.exc:
                print "  throws", param.exc
