import os
import sys
sys.path.insert(0, os.path.join("..", "libs", "whoosh.zip"))
from whoosh.index import open_dir, create_in
import models
import parser


# TODO: create two indexes: global and local
# TODO: add zipped packages
class Indexer(object):

    def __init__(self, path):
        if not os.path.exists(path):
            os.makedirs(path)
        try:
            self._ix = open_dir(path)
            multisegment = False
        except:
            self._ix = create_in(path, models.name_schema)
            multisegment = True
        self._writer = self._ix.writer(
            procs=4, limitmb=128, multisegment=multisegment)

        #stem_ana = self._writer.schema["name"].format.analyzer
        # stem_ana.cachesize = -1 # Set the cachesize to -1 to indicate unbounded caching
        # stem_ana.clear()  # Reset the analyzer to pick up the changed
        # attribute

    def close(self):
        self._writer.commit()

    def _add(self, **kwargs):
        for key, value in kwargs.items():
            if isinstance(value, str):
                kwargs[key] = unicode(value)
        self._writer.add_document(**kwargs)
        # self._writer.commit()

    def remove_filename(self, filename):
        # TODO: remove documents where file does not exist anymore
        self._writer.delete_by_term("filename", filename)

    def add_filename(self, filename, module_name):
        try:
            items = list(parser.parse(filename))
        except Exception, exc:
            print filename, exc
            return
        self.remove_filename(filename)
        for entry in items:
            kind, scope, name, lineno = entry
            self._add(kind=kind, name=name, line=lineno,
                      filename=filename, scope=module_name + "." + scope)
        self._add(kind="module", name=module_name, line=0, filename=filename)

    def add_path(self, path):
        for kind, filename, module_name in parser.modules(path):
            yield filename
            if kind == "mod":
                self.add_filename(filename, module_name)
            else:  # kind == "pkg"
                base = os.path.basename(filename)
                for pkg_filename in parser.tree(filename):
                    pkg_mod = pkg_filename[len(filename) + 1:].rstrip(".py")
                    pkg = os.path.join(base, pkg_mod).replace("/", ".")
                    self.add_filename(pkg_filename, pkg)

    def add_all(self):
        for path in sys.path:
            for entry in self.add_path(path):
                yield entry

    def add_stdlib(self):
        for entry in self.add_path(parser.stdlib_path()):
            yield entry


if __name__ == "__main__":
    idx = Indexer("index")
    for found in idx.add_all():
        print found
    idx.close()
