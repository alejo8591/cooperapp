import endpoints
from google.appengine.ext import ndb
from protorpc import remote
from models.Cooperapp import User, Cooperative

@endpoints.api(name='cooperapi', version='v1', description='API for Users Model')
class CooperApi(remote.Service):	
	""" Services for User Model """
	@User.query_method(query_fields=('username',), path='user/{username}', http_method='GET', name='user.get')
	def UserGet(self, query):
		return query

	@User.query_method(query_fields=('username', 'email',), path='username', name='user.list')
	def UserList(self, query):
		return query

	@User.method(path='user', http_method='POST', name='user.insert')
	def UserModelInsert(self, user):
		user.put()
		return user

	""" Services for Cooperative Model """
	@Cooperative.method(path='cooperative', http_method='POST', name='cooperative.insert')
	def CooperativeModelInsert(self, cooperative):
		cooperative.put()
		return cooperative

	@Cooperative.query_method(query_fields=('name',), path='cooperative', name='cooperative.list')
	def CooperativeList(self, query):
		return query