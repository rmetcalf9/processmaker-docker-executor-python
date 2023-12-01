#!/bin/bash

FILE_TO_UPDATE=./src/DockerExecutorPythonServiceProvider.php
INP_VER=${1}

echo "Start of pre deploy. Will update ${FILE_TO_UPDATE} with ${INP_VER}"

if [[ ! -f ${FILE_TO_UPDATE} ]]; then
  echo "ERROR File not found"
  exit 1
fi


sed -i "s/    const version = \x27[a-zA-Z0-9.]*\x27/    const version = \x27${INP_VER}\x27/g" ${FILE_TO_UPDATE}

echo "pre deploy Done"

exit 0
