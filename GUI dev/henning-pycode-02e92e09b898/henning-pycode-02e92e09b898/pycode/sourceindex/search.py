import sys
sys.path.insert(0, "whoosh.zip")

from whoosh.qparser import QueryParser
from whoosh.index import open_dir


class Search(object):

    def __init__(self, path):
        self._ix = open_dir(path)

    def search(self, qs):
        with self._ix.searcher() as searcher:
            query = QueryParser("name", self._ix.schema).parse(qs)
            results = searcher.search(query, limit=100)
            for hit in results:
                yield hit


if __name__ == "__main__":
    import sys
    s = Search("index")
    qs = " ".join(sys.argv[1:]) or "line:130 OR template"
    for num, hit in enumerate(s.search(qs)):
        print num + 1, hit
