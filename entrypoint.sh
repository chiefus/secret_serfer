#!/bin/bash

trufflehog3 --no-history -r /rules.yaml -f yaml /github/workspace | /yaml2junit.py