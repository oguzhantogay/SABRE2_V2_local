from search import Search


class QuickFixer(object):

    def __init__(self, source):
        self.source = source
        self._search = None

    def search(self, qs):
        if self._search is None:
            self._search = Search()
        return self._search(qs)

    def is_constant(self, ident):
        return ident.upper() == ident and "." not in ident

    def is_call(self, expr):
        popen = expr.find("(")
        if popen == -1:
            return False
        pclose = expr.find(")", popen)
        prefix = expr[:popen]

    def add_constant(self, source, name, val):
        pass

    def add_import(source, name, from_list=None):
        pass

    def add_function(source, name, params):
        pass

    def add_method(self, name, params):
        pass
