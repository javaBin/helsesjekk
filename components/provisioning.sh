#!/usr/bin/env bash

LOG="$HOME/.provision/provision.log"

if [[ ! -f "$LOG" ]]; then
    echo "Could not find log at $LOG"
    exit 1
else
    DATE=`tail -1 $LOG | cut -d" " -f1`
    COMMIT=`tail -1 $LOG | cut -d" " -f3`
    echo "Last provisioned: $DATE"
    echo "Commit: $COMMIT"    
fi
