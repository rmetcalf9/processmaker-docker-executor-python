#!/bin/bash

python3 ./main.py
RES=$?
if [[ ${RES} -ne 0 ]]; then
  echo "Python run failed"
  exit ${RES}
fi

exit 0
