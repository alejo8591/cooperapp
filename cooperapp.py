import cgi
# -*- coding: utf-8 -*
import cgi
import urllib

from google.appengine.api import users
from google.appengine.ext import ndb

from models import Cooperapp


import webapp2


class MainPage(webapp2.RequestHandler):
    def get(self):
        self.response.write('<!DOCTYPE html><html><head><body><h1>Hola mundo</h1></body></html>')

application = webapp2.WSGIApplication([
    ('/', MainPage),
], debug=True)
