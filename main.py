from BaseHTTPServer import BaseHTTPRequestHandler, HTTPServer
from urlparse import parse_qs
import SocketServer
import os
import base64
import json
counter = 0


class S(BaseHTTPRequestHandler):
    def _set_headers(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()

    def do_POST(self):
        global counter

        if not '?type=url' in self.path:
            filename = self.path[1:]
            if not filename:
                filename = 'output' + str(counter)
                counter = counter + 1

            filename = "output/" + filename
            filepath = '/'.join(filename.split("/")[:-1])
        else:
            filepath = "output/urls/"
            filename = "output/urls/" + self.path[1:].replace('/','_')

        if not os.path.exists(filepath):
            os.makedirs(filepath)
        
        data = self.rfile.read(int(self.headers.getheader('content-length')))
        with open(filename, 'wb') as f:
            try:
                x = json.loads(data)
                f.write(base64.b64decode(x))
            except Exception as err:
                f.write(data)
        self._set_headers()
        self.wfile.write("<html><body><h1>POST!</h1></body></html>")

def run(server_class=HTTPServer, handler_class=S, port=7878):
    server_address = ('0.0.0.0', port)
    httpd = server_class(server_address, handler_class)
    print 'Starting server'
    httpd.serve_forever()

run()    
