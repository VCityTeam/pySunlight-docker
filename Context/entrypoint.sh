#!/bin/sh
set -e

CMD="python3.9 src/main.py -i /inputs -o /outputs -log ${LOG_LEVEL} -f ${FORMAT}"

if [ -n "${END_DATE}" ] && [ -n "${START_DATE}" ]; then
  CMD="$CMD -s ${START_DATE} -e ${END_DATE}"
else
  CMD="$CMD --single-timestamp ${TIMESTAMP}"
fi

if [ -n "${OPTIONAL_ARGS}" ]; then
  CMD="$CMD ${OPTIONAL_ARGS}"
fi

exec $CMD