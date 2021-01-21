#!/bin/bash

set -o pipefail
if [ -z "$REPORT" ]
then
      trufflehog3 --no-history -r /rules.yml --line-number $@ ${TARGETS} | sed -E -e 's/(.*[0-9])([ ]{1})(.*:) .*/Line:\t\1\nMatch:\t\3 *************/'
else
      trufflehog3 --line-number --no-history -r /rules.yml -f yaml $@ ${TARGETS} | /yaml2junit.py
fi