from rope.base.pynames import ImportedName, AssignedName
import sys
import os
import inspect
import imp
from zipfile import ZipFile
sys.path.insert(0, os.path.join("..", "libs", "rope.zip"))
from rope.base import ast
from rope.base import pycore, evaluate, pyobjects, project, resources
from rope.base.pyobjectsdef import PyModule, PyPackage
from rope.base.pyscopes import GlobalScope


# Forked from  rope.contrib.finderrors ._BadAccessFinder
class SyntaxChecker(object):

    def __init__(self, pymodule):
        self.pymodule = pymodule
        self.scope = pymodule.get_scope()
        self.errors = []
        self.module_cache = {}

    def _Import(self, node):
        for child in node.names:
            mod_name, alias = child.name, child.asname
            if mod_name not in self.module_cache:
                if not self._find_module(mod_name):
                    node.id = mod_name
                    self._add_error(node, "Unresolved module import")

    def _Name(self, node):
        if isinstance(node.ctx, (ast.Store, ast.Param)):
            return
        scope = self.scope.get_inner_scope_for_line(node.lineno)
        pyname = scope.lookup(node.id)
        if pyname is None:
            self._add_error(node, 'Unresolved variable')
        elif self._is_defined_after(scope, pyname, node.lineno):
            self._add_error(node, 'Defined later')

    def _Assign(self, node):
        scope = self.scope.get_inner_scope_for_line(node.lineno)
        if not isinstance(scope, GlobalScope):
            if len(node.targets) == 1:
                var_name = node.targets[0].id
                print "local var", var_name

    def _Attribute(self, node):
        if not isinstance(node.ctx, ast.Store):
            scope = self.scope.get_inner_scope_for_line(node.lineno)
            pyname = evaluate.eval_node(scope, node.value)
            if pyname is not None and\
               pyname.get_object() != pyobjects.get_unknown():
                if node.attr not in pyname.get_object():
                    self._add_error(node, 'Unresolved attribute')
        ast.walk(node.value, self)

    def _add_error(self, node, msg):
        if isinstance(node, ast.Attribute):
            name = node.attr
        else:
            name = node.id
        if name != 'None':
            error = Error(node.lineno, msg + ' ' + name)
            self.errors.append(error)

    def _is_defined_after(self, scope, pyname, lineno):
        location = pyname.get_definition_location()
        if location is not None and location[1] is not None:
            if location[0] == self.pymodule and\
               lineno <= location[1] <= scope.get_end():
                return True

    def _find_module(self, mod_name):
        # TODO: does not work as expected in virtual environments (different
        # sys.path)
        exists = self.module_cache.get(mod_name, None)
        if exists is None:
            try:
                found = imp.find_module(mod_name)
                (file_, filename, (suffix, mode, type)) = found
                exists = True
            except ImportError:
                exists = False
            self.module_cache[mod_name] = exists
        return exists


class Error(object):

    def __init__(self, lineno, error):
        self.lineno = lineno
        self.error = error

    def __str__(self):
        return '%s: %s' % (self.lineno, self.error)


class Project(object):

    def __init__(self, root=None):
        if root is None:
            prj = project.NoProject()
            prj.root = None  # os.path.dirname(filename)
        else:
            prj = project.Project(root)
        self.prj = prj
        self.pyc = pycore.PyCore(prj)

    def stdlib_path(self):
        path = os.path.dirname(inspect.getsourcefile(inspect))
        if path not in sys.path:
            print >>sys.stderr, "Warning: inspect-module not in sys.path. Could not find determine stdlib path properly"
        return path

    # TODO: add zipped packages

    def modules(self, path):
        if os.path.isdir(path):
            for name in os.listdir(path):
                filename = os.path.join(path, name)
                lname = name.lower()
                if os.path.isdir(filename) and "-" not in name:
                    if os.path.exists(os.path.join(filename, "__init__.py")):
                        # skip check that __init__.py is not a directory
                        yield "pkg", filename, name
                elif lname.endswith((".py", ".pyw")):
                    yield "mod", filename, os.path.splitext(name)[0]
                elif lname.endswith(".zip"):
                    yield "zip", filename, name
                elif lname.endswith(".egg"):
                    yield "egg", filename, name
                elif lname.endswith((".so", ".dll")):
                    yield "clib", filename, os.path.splitext(name)[0]

    def clibraries(self, path):
        for name in os.listdir(path):
            filename = os.path.join(path, name)
            if not os.path.isdir(filename):
                if name.lower().endswith((".dll", ".so")):
                    yield "lib", filename, os.path.splitext(name)[0]

    def std_clibraries(self):
        path = self.stdlib_path()
        dynload_path = os.path.join(path, "lib-dynload")
        return self.clibraries(dynload_path)

    def package_tree(self, top):
        for dirpath, dirnames, filenames in os.walk(top):
            if not os.path.exists(os.path.join(dirpath, "__init__.py")):
                continue
            for name in filenames:
                if name.lower().endswith((".py", ".pyw")):
                    yield os.path.join(dirpath, name)

    def zip_contents(self, filename):
        zf = ZipFile(filename)
        for name in zf.namelist():
            if name.lower().endswith((".py", ".pyw")):
                yield name, zf.open(name)
        zf.close()

    def parse_file(self, filename):
        resource = resources.File(self.prj, filename)
        if resource.is_folder():
            pyobject = PyPackage(self.pyc, resource, force_errors=False)
        else:
            pyobject = PyModule(self.pyc, resource=resource,
                                force_errors=False)
        return pyobject

    def parse_source(self, source):
        pyobject = self.pyc.get_string_module(source)
        return pyobject

    def outline(self, pyobject):
        #ast = pyobject.ast_node
        for item in self.parse_scope(pyobject.get_scope(), True):
            yield item

    def parse_scope(self, scope, include_vars=False):
        kind = scope.get_kind()
        pyobject = scope.pyobject
        if kind == "Function":
            parent = scope.parent
            if parent.get_kind() != "Module":
                parent_scope = parent.pyobject.get_name()
            else:
                parent_scope = ""
            fname = pyobject.get_name()
            line = pyobject.get_ast().lineno
            yield "func", parent_scope, fname, line
            if include_vars:
                for param in scope.pyobject.get_parameters().keys():
                    yield ("arg", "", param, line)
                for name, var in scope.get_names().items():
                    if isinstance(var, ImportedName):
                        yield "import-local", "", var.imported_name, var.imported_module.module_name
                    elif isinstance(var, AssignedName):
                        def_mod, def_line = var.get_definition_location()
                        print "***", var, name, dir(def_mod.get_ast())
                        raise SystemExit

        elif kind == "Class":
            parent = scope.parent
            if parent.get_kind() != "Module":
                parent_scope = parent.pyobject.get_name()
            else:
                parent_scope = ""
            cname = pyobject.get_name()
            line = pyobject.get_ast().lineno
            yield "class", parent_scope, cname, line
        elif kind == "Module":
            if include_vars:
                for name, var in scope.get_defined_names().items():
                    if isinstance(var, ImportedName):
                        yield "import", "", var.imported_name, var.imported_module.module_name
                    pyobject = getattr(var, "pyobject", None)
                    if pyobject:
                        ast = getattr(pyobject, "get_ast", None)
                        if ast:
                            yield "global", "", name, ast().lineno
        for child in scope.get_scopes():
            yield self.parse_scope(child, include_vars)

    def flat_outline(self, pyobject):
        queue = [self.outline(pyobject)]
        for item in queue:
            if isinstance(item, tuple):
                yield item
            else:
                for child in item:
                    queue.append(child)

    def find_errors(self, pymodule):
        from rope.base import ast
        checker = SyntaxChecker(pymodule)
        ast.walk(pymodule.get_ast(), checker)
        return checker.errors


_prj = None


def parse(filename):
    global _prj
    if _prj is None:
        _prj = Project()
    pyobject = _prj.parse_file(filename)
    return _prj.flat_outline(pyobject)


def test_find_errors():
    p = Project()
    src = "import baz\nfrom foo import bar\nimport string as s\nprint a\nb = 123\n"
    src += "def test(arg):\n\tb = 456\n"
    pyobject = p.parse_source(src)
    for err in p.find_errors(pyobject):
        print err


def test_outline():
    p = Project()
    pyobject = p.parse_file(__file__.rstrip("oc"))
    for item in p.flat_outline(pyobject):
        print item


def test_parse():
    p = Project()
    std = p.stdlib_path()
    print std
    mods = list(p.modules(std))
    print mods
    fn = mods[-1][1]
    print fn
    for item in p.parse(fn):
        print item


def test():
    from rope.base import pynames
    p = Project()
    pobj = p.parse_file(__file__.rstrip("oc"))
    for key, value in pobj.get_attributes().items():
        if isinstance(value, pynames.ImportedName):
            def_name, def_line = value.get_definition_location()
            print value.imported_name, "from", value.imported_module.module_name


if __name__ == "__main__":
    # test_find_errors()
    test_outline()
    # test()
