import endpoints
from google.appengine.ext import ndb
from protorpc import remote

#from endpoints_proto_datastore.ndb import EndpointsModel

from models.Cooperapp import User

@endpoints.api(name='cooperappuser', version='v1', description='API for Users Model')
class CooperappUser(remote.Service):
	@User.query_method(query_fields=('username',), path='user/{username}', http_method='GET', name='user.get')
	def UserGet(self, query):
		return query

	@User.query_method(query_fields=('username', 'email',), path='username', name='username.list')
	def UserList(self, query):
		return query

	@User.method(path='user', http_method='POST', name='user.insert')
	def MyModelInsert(self, user):
		user.put()
		return user