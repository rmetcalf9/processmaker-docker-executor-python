# Trying to emulate a docker executor that can be used in processmaker

Looking at https://github.com/ProcessMaker/docker-executor-java/blob/develop/README.md for inspiration



### Command line use

docker run --rm -it \
  processmaker4/executor-processmaker-python-4:v1.0.0 \
  /bin/bash
echo {} > data.json
echo {} > config.json
echo 'print("Hello World")' > Script.py
./run.sh
cat output.json


#-v <path to local data.json>:/opt/executor/data.json \#
#  -v <path to local config.json>:/opt/executor/config.json \
#  -v <path to local Script.java>:/opt/executor/Script.java \
#  -v <path to local output.json>:/opt/executor/output.json \
#  processmaker4/docker-executor-java \
#  /opt/executor/run.sh
