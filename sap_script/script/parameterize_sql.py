import re
import os
import sys
from optparse import OptionParser

class SqlParameterization():

    def __init__(self):
        self.queries = []
        self.results = []

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

    def parameterize(self, query_str):

        pattern_str = r'\"?DS_ID\"?\s*=\s*\'(.*?)\''
        pattern = re.compile(pattern_str)

        params = []
        pos = []
        for m in pattern.finditer(query_str):
            # print 'query_str = %s <Match: %r, groups=%r>' % (query_str, m.group(), m.groups())
            # print 'm.start(1): ' + str(m.start(1)) + ' m.end(1): ' + str(m.end(1))
            params.append(m.group(1))
            pos.append((m.start(1), m.end(1)))

        pos.reverse()
        for (start, end) in pos:
            query_str = query_str[0:start-1] + '?' + query_str[end+1:]

        query_str = query_str.rstrip('\r\n')

        # print "query_str: " + query_str + ", params: " + ','.join(params)
        self.results.append([query_str, params])

    def paramterizeAll(self):
        for query in self.queries:
            self.parameterize(query)

    def printQueries(self, token= "\n"):
        print token.join(self.queries)

    def printObjects(self, token = "\n"):
        print token.join(self.objects)

    def writeResultsToFile(self, file_name):
        f = open(file_name, 'w')
        for r in self.results:
            res_str = r[0] + self.paramToString(r[1])
            print res_str
            f.write(res_str + '\n')

    def paramToString(self, param):
        return ' /*$$params$$' + '$$'.join(str(e) for e in param) + '*/'

if __name__ == "__main__":

    parser = OptionParser()
    parser.add_option("-f", "--file", dest="file", help="file_path")
    parser.add_option("-s", "--sql", dest="sql", help="sql_string")
    parser.add_option("-q", "--show_queries", action="store_true", dest="show_queries", help="show queries")
    parser.add_option("-o", "--out_file", dest="out_file", help="output filename")

    e = SqlParameterization()

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

    e.paramterizeAll()

    if options.out_file is not None:
        e.writeResultsToFile(options.out_file)
