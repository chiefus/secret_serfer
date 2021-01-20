#!/bin/bash

set -o pipefail
if [ -z "$REPORT" ]
then
      trufflehog3 --no-history -r /rules.yml -f yaml $@ ${TARGETS}
else
      trufflehog3 --line-number --no-history -r /rules.yml -f yaml $@ ${TARGETS} | /yaml2junit.py
fi