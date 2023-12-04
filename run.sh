#!/bin/bash

./build.sh
GEN_RUN_RES=$?
if [[ ${GEN_RUN_RES} -ne 0 ]]; then
  echo "Generating build images errored - ${GEN_RUN_RES}"
  exit ${GEN_RUN_RES}
fi

source ./_repo_vars.sh
echo "Running project ${PROJECT_NAME}"

#docker run --rm -it \
#  -e "PYTHONPYCACHEPREFIX=/tmp/__python_cache_dir__" \
#  -v $(pwd):/maindir \
#  -w /maindir \
#  ${BUILD_IMAGE_NAME_AND_TAG} python3 ./src/main.py
#DOCKER_RUN_RES=$?
#if [[ ${DOCKER_RUN_RES} -ne 0 ]]; then
#  echo "Running app errored - ${DOCKER_RUN_RES}"
#  exit ${DOCKER_RUN_RE}
#fi

echo "{\"exampleconfig\": \"Config\"}" > ./src/config.json
echo "{\"exampledata\": \"Data\"}" > ./src/data.json
cp ./sample_script.py ./src/Script.py

CURDIR=$(pwd)
cd src
python3 ./main.py
RES=$?
cd ${CURDIR}

if [[ ${RES} -ne 0 ]]; then
  exit ${RES}
fi

echo "Run complete - output was"
cat ./src/output.json

exit 0
