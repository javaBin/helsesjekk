#!/usr/bin/env bash

pid="$(mongo --quiet --eval 'db.serverStatus().pid;' 2>details/MONGO.log)"
status=$?

if [ $status -gt 0 ]; then
    echo "MONGO is down"
else
    echo "MONGO is up (pid $pid)"
fi

exit $status
