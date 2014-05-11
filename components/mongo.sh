#!/usr/bin/env bash

pid="$(mongo --quiet --eval 'db.serverStatus().pid;' 2>details/MONGO.log)"
status=$?

if [ $status -gt 0 ]; then
    echo "MONGO is down"
else
    echo "MONGO running with pid $pid"
fi

exit $status
