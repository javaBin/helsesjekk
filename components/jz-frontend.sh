#!/usr/bin/env bash

status=$(curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:80)

if [ $status -gt 399 ]; then
    echo "FRONTEND answered with status $status"
    exit 1
else
    echo "FRONTEND is up"
fi
