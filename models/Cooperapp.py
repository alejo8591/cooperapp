# -*- coding: utf-8 -*
from google.appengine.ext import ndb

from endpoints_proto_datastore.ndb import EndpointsModel

"""

	Create data test

	import os
	import pprint

	from google.appengine.api import memcache
	from google.appengine.api import mail
	from google.appengine.api import urlfetch
	from google.appengine.ext import db

	from models.Cooperapp import User

	pprint.pprint(os.environ.copy())

	user = User(username = "80912070",
		email = "alejo8591@gmail.com",
		name = "Alejandro Romero")

	user.put()

"""

class User(EndpointsModel):
	"""Model for Users"""
	username = ndb.StringProperty(verbose_name="Documento de Identidad")
	email = ndb.StringProperty(verbose_name="Correo Electronico")
	name = ndb.StringProperty(verbose_name="Nombre del Usuario")
	phone = ndb.StringProperty(verbose_name="Telefono Móvil")
	address = ndb.StringProperty(verbose_name="Dirección del Usuario")
	bank = ndb.StringProperty(verbose_name="Nombre del Banco donde tiene la cuenta")
	bankCount = ndb.StringProperty(verbose_name="Número de cuenta")
	

class Cooperative(EndpointsModel):
    """Models for Cooperatives."""
    name = ndb.StringProperty(verbose_name="Nombre de la Cooperativa")
    codeConfecoop = ndb.IntegerProperty(verbose_name="Codigo Confecoop")
    nit = ndb.StringProperty(verbose_name="Nit de la Cooperativa")
    acronym = ndb.StringProperty(verbose_name="Siglas de la Cooperativa")
    phone = ndb.StringProperty(verbose_name="Teléfono de la Cooperativa")
    address = ndb.StringProperty(verbose_name="Direccion Principal de la conpañia")
    ubication = ndb.GeoPtProperty()
    bank = ndb.StringProperty()
    bankCount = ndb.StringProperty()


class Transaction(EndpointsModel):
	"""Model Transaction between Users and Cooperatives"""
	user = ndb.StructuredProperty(User)
	Cooperative = ndb.StructuredProperty(Cooperative)
	datetime = ndb.DateTimeProperty(auto_now_add=True)