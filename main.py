#!/usr/bin/env python
#
# Copyright 2010 Gabriel Handford
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

import os
import logging
import sys

sys.path = [ os.path.join(os.path.dirname(__file__), "lib") ] + sys.path

from google.appengine.ext import webapp
from google.appengine.ext.webapp import util

from mako.template import Template
from mako.lookup import TemplateLookup


class MainHandler(webapp.RequestHandler):

  def docs(self):
    view_path = os.path.join(os.path.dirname(__file__), "views")
    template_lookup = TemplateLookup(directories=[view_path], output_encoding='utf-8')
    template = template_lookup.get_template('index.mako')
    self.response.out.write(template.render())

  def respond(self):
    status_code = int(self.request.get('status', 0))
    content = self.request.get('content', None)
    headers = dict()
    headers['Content-Type'] = self.request.get('content_type', 'text/plain')
    # Location header only available in 3xx
    if status_code in xrange(300, 400):
      headers['Location'] = self.request.get('location', None)

    if status_code == 0:
      self.docs()
      return

    self.response.set_status(status_code)
    for header_key, header_value in headers.iteritems():
      if header_value:
        self.response.headers[header_key] = header_value

    if content is not None:
      self.response.out.write(content)

  def get(self):
    return self.respond()

  def post(self):
    return self.respond()



def main():
  application = webapp.WSGIApplication([('/.*', MainHandler)],
                                       debug=True)
  util.run_wsgi_app(application)


if __name__ == '__main__':
  main()
