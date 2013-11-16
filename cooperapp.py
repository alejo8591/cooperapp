import cgi
# -*- coding: utf-8 -*
import cgi
import urllib

from google.appengine.api import users
from google.appengine.ext import ndb

from google.appengine.ext.webapp import template

import endpoints_proto_datastore

import endpoints

import os

import webapp2

from api.api import CooperApi

class MainPage(webapp2.RequestHandler):
    # render index.html
    def get(self):
        template_values = {
            'title' : "CooperApp"
        }

        path = os.path.join(os.path.dirname(__file__), 'index.html')
        self.response.out.write(template.render(path, template_values))

application = webapp2.WSGIApplication([
    ('/', MainPage),
], debug=True)

endpointsapp = endpoints.api_server([CooperApi], restricted=False)
