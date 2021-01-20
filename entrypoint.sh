#!/bin/bash

set -o pipefail
if [ -z "$REPORT" ]
then
      trufflehog3  -r /rules.yaml -f yaml $@ ${TARGETS}
else
      trufflehog3  -r /rules.yaml -f yaml $@ ${TARGETS} | /yaml2junit.py
fi