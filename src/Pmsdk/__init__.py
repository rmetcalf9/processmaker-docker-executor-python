from .usersApi import UsersApi
from .apiClient import ApiClient

class Pmsdk():
    UsersApi = None
    ApiClient = None
    def __init__(self):
        self.UsersApi = UsersApi
        self.ApiClient = ApiClient
