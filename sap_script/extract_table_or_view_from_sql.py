import re
import os
import sys
from optparse import OptionParser

class TableOrViewSimpleExtractorFromSql():

    def __init__(self):
        self.objects = []
        self.queries = []

    def add_query_from_file(self, file_path):
        if file_path[0] == '/':
            file_full_path = file_path
        else:
            file_full_path = os.path.join(os.getcwd(), file_path)

        f = open(file_full_path, 'r')
        queries = f.readlines()
        for q in queries:
            self.add_query(q)

    def add_query(self, query):
        self.queries.append(query)

    def extract(self, query_str):

        delimiter_regex = ' '
        query_splitted = re.split(delimiter_regex, query_str)

        found = False
        for token in query_splitted:
            if found:
                if len(token) == 0:
                    continue

                if token[0] == '(':
                    found = False
                    continue

                self.objects.append(token.replace('\\\"',''))
                found = False

            if token.upper() == 'FROM' or token.upper() == 'JOIN':
                found = True

    def extractAll(self):
        for query in self.queries:
            self.extract(query)

        self.objects = list(set(self.objects))

    def printQueries(self, token= "\n"):
        print token.join(self.queries)

    def printObjects(self, token = "\n"):
        print token.join(self.objects)

if __name__ == "__main__":

    parser = OptionParser()
    parser.add_option("-f", "--file", dest="file", help="file_path")
    parser.add_option("-s", "--sql", dest="sql", help="sql_string")
    parser.add_option("-q", "--show_queries", action="store_true", dest="show_queries", help="show queries")

    e = TableOrViewSimpleExtractorFromSql()

    (options, args) = parser.parse_args()
    if options.file is not None:
        e.add_query_from_file(options.file)

    if options.sql is not None:
        e.add_query(options.sql)

    if options.show_queries:
        print "== query lists =="
        e.printQueries()
        print "== end of query lists =="
        sys.exit()

    e.extractAll()
    e.printObjects()
