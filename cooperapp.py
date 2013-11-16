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
    """
        def get(self):
            greetings_query = Greeting.all().order('-date')
            greetings = greetings_query.fetch(10)

            if users.get_current_user():
                url = users.create_logout_url(self.request.uri)
                url_linktext = 'Logout'
            else:
                url = users.create_loginw_url(self.request.uri)
                url_linktext = 'Login'

            template_values = {
                'greetings': greetings,
                'url': url,
                'url_linktext': url_linktext,
                }
        path = os.path.join(os.path.dirname(__file__), 'index.html')
        self.response.out.write(template.render(path, template_values))
    """
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
