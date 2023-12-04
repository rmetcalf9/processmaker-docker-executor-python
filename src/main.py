import sys
import importlib.util
import importlib.abc
import json
import os

input_script_file = "./Script.py"
output_file = "./output.json"

class StringLoader(importlib.abc.SourceLoader):
    def __init__(self, data):
        self.data = data

    def get_source(self, fullname):
        return self.data

    def get_data(self, path):
        return self.data.encode("utf-8")

    def get_filename(self, fullname):
        return "<not a real path>/" + fullname + ".py"

script_text = ""
with open(input_script_file) as script_file:
    script_text = script_file.read()

script_text = "from scriptContext import getContext\n(data, config, pmsdk, configuration) = getContext()\n" + script_text

loader = StringLoader(script_text)

spec = importlib.util.spec_from_loader("script_module", loader, origin="built-in")

module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)

sys.modules["script_module"] = module
from script_module import output
outputDict = output

with open(output_file, 'w') as fout:
    json_dumps_str = json.dumps(outputDict, indent=4)
    print(json_dumps_str, file=fout)
