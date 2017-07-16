import sys
import os
sys.path.insert(0, os.path.join("..", "libs", "whoosh.zip"))

from whoosh.fields import Schema, TEXT, ID, KEYWORD, NUMERIC
from whoosh.analysis import NgramWordAnalyzer

# for fulltext search in comments and doc-strings
comments_schema = Schema(
    filename=ID(stored=True),
    comments=TEXT)


analyzer = NgramWordAnalyzer()
name_field = TEXT(analyzer=analyzer, phrase=False)


# for name search
name_schema = Schema(
    filename=ID(stored=True),
    name=TEXT(stored=True),
    kind=KEYWORD(stored=True),
    scope=KEYWORD(stored=True),
    line=NUMERIC(stored=True)
)


usage_schema = Schema(
    definition_location=TEXT(stored=True),
    usage_location=TEXT(stored=True)
)
