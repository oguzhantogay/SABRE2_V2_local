from pprint import pformat
from inspect import isfunction, isbuiltin, getargspec, isclass, ismethod


class StubCreator(object):

    def __init__(self):
        self.out = []
        self.indent = " " * 4

    def emit(self, code, depth=0):
        self.out.append("%s%s" % (self.indent * depth, code))

    def emit_doc(self, doc, depth):
        if doc:
            if "\n" in doc:
                doc = "\n".join(self.indent + l for l in doc.splitlines())[
                    len(self.indent):]
                self.emit("'''%s'''" % doc, depth)
            else:
                self.emit(pformat(doc), depth)
            self.emit("")

    def __str__(self):
        return "\n".join(self.out)

    def create_stub(self, root, depth=0):
        doc = getattr(root, "__doc__")
        if doc:
            self.emit_doc(doc, depth)
        name_list = dir(root)
        for name in name_list:
            if name == "__doc__":
                continue
            try:
                value = getattr(root, name)
            except AttributeError, e:
                continue
            if isinstance(value, int) or isinstance(value, float) or \
               isinstance(value, basestring) or value is None:
                self.emit("%s = %r" % (name, value), depth)
            elif callable(value):
                if isfunction(value) or isbuiltin(value):
                    self.create_function_stub(name, value, depth)
                elif isclass(value):
                    self.create_class_stub(name, value, depth)
            else:
                pass  # print "*", name, type(value), callable(value)

    def create_class_stub(self, name, cls, depth):
        self.emit("")
        if cls.__name__ != name:
            self.emit("%s = %s # class alias" % (name, cls.__name__), depth)
        else:
            bases = cls.__bases__
            if bases:
                bases = "(%s)" % ", ".join(b.__name__ for b in bases)
            self.emit("class %s%s:" % (name, bases))
            if not self.create_stub(cls, depth + 1):
                self.emit("pass", depth + 1)

    def func_args(self, func):
        try:
            args, varargs, keywords, defaults = getargspec(func)
            defaults = dict(zip(args[-len(defaults):], defaults))
            if varargs:
                args.append("*" + varargs)
            for i, a in enumerate(args):
                try:
                    d = defaults[a]
                    args[i] = "%s=%r" % (a, d)
                except KeyError, e:
                    pass
            return ", ".join(args)
        except TypeError, e:
            doc = getattr(func, "__doc__", None)
            if doc:
                l = func.__doc__.splitlines()[0].strip()
                args, sep, result = l.partition("->")
                return "self, " + args.split("(", 1)[1].rsplit(")", 1)[0]
            return "*args"

    def create_function_stub(self, name, func, depth):
        self.emit("")
        if func.__name__ != name:
            self.emit("%s = %s # function alias" %
                      (name, func.__name__), depth)
        else:
            args = self.func_args(func)
            self.emit("def %s(%s):" % (name, args), depth)
            doc = getattr(func, "__doc__", "")
            if doc:
                self.emit_doc(doc, depth + 1)
            else:
                self.emit("pass", depth + 1)
                self.emit("")
        self.emit("")

    def create_stub_from_module(self, module_name):
        mod = __import__(module_name, {}, {}, [])
        for part in module_name.split(".")[1:]:
            mod = getattr(mod, part)
        doc = getattr(mod, "__doc__")
        if doc:
            self.emit_doc(doc)
        self.create_stub(mod)


c = StubCreator()
c.create_stub_from_module("PyQt4.QtGui")
print c
