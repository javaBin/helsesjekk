#!/usr/bin/env bash

LOG="$HOME/.provision/provision.log"

if [[ ! -f "$LOG" ]]; then
    echo "PROVISION log not found"
    exit 1
else
    DATE=`tail -1 $LOG | cut -d" " -f1`
    COMMIT=`tail -1 $LOG | cut -d" " -f3`
    echo "PROVISIONED last $DATE (commit $COMMIT)"    
fi
