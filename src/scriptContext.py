import json
from Pmsdk import Pmsdk

def getContext():
    data_file = "./data.json"
    config_file = "./config.json"

    with open(data_file) as json_file :
      data = json.load(json_file)
    with open(config_file) as json_file :
      config = json.load(json_file)

    pmsdk = Pmsdk()
    configuration = {}

    return (data, config, pmsdk, configuration)
