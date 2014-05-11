#!/usr/bin/env bash

pid="$(mongo --quiet --eval 'db.serverStatus().pid;' 2>details/MONGO.log)"
status=$?

if [ $status -gt 0 ]; then
    echo "Unable to connect"
else
    echo "Running with pid $pid"
fi

exit $status
