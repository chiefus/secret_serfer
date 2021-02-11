#!/bin/bash

set -o pipefail
cp /rules.yml /modified_rules.yml

for RULE in $(echo "${EXCLUDE_RULES}")
do
      sed -i "/$RULE/d" /modified_rules.yml
done

if [ -z "$REPORT" ]
then
      if [ "${SUPPRESS_OUTPUT}" == "true" ]
      then
            trufflehog3 --line-number --no-history -r /modified_rules.yml -o /dev/null "$@" "${TARGETS}" --skip-paths '.git/'
      else
            trufflehog3 --no-history -r /modified_rules.yml --line-number "$@" "${TARGETS}" --skip-paths '.git/' | sed -r 's/\x1b\[0m// ;s/^([0-9]+)([ ]+).*/Line: \1/'
      fi 
else
      trufflehog3 --line-number --no-history -r /modified_rules.yml -f yaml "$@" "${TARGETS}" --skip-paths '.git/' | /yaml2junit.py
fi