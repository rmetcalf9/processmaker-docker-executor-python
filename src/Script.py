import os

users_api_instance = pmsdk.UsersApi(pmsdk.ApiClient(configuration))
user = users_api_instance.get_user_by_id(1)


output = {
    "sample_script_output": True,
    "env": dict(os.environ),
    "data": data,
    "config": config,
    "pmsdk_user_fillname": user.fullname
}
