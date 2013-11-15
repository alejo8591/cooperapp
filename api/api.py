import endpoints
from google.appengine.ext import ndb
from protorpc import remote

#from endpoints_proto_datastore.ndb import EndpointsModel

from models.Cooperapp import User

@endpoints.api(name='cooperappuser', version='v1', description='API for Users Model')
class CooperappUser(remote.Service):
    @User.method(path='user/{username}', http_method="GET", name='user.get')
    def UserGet(self, user):
    	if not user.from_datastore:
    		raise endpoints.NotFoundException('Usuario no existe.')
    	return user

    @User.query_method(path='user', name='user.list')
    def UserList(self, query):
    	return query