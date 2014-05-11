#!/usr/bin/env bash

DATE=`tail -1 ~/.provision/provision.log | cut -d" " -f1`
COMMIT=`tail -1 ~/.provision/provision.log | cut -d" " -f3`

echo "PROVISIONED last $DATE (commit $COMMIT)"
