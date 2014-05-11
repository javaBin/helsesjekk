#!/usr/bin/env bash

green() { echo -e "\033[32m$1\033[0m"; }
red() { echo -e "\033[31m$1\033[0m"; }

gather_locally() {
    for script in components/*.sh; do
        if [ -x $script ]; then
            msg=`./$script`
            status=$?
            if [ $status -gt 0 ]; then
                red "$msg"
            else
                green "$msg"
            fi
        fi
    done
    unset script
}

gather_remote() {
    if [[ $1 == "test" ]]; then
        host="javabin@test.2014.javazone.no"
    elif [[ $1 == "prod" ]]; then
        host="javabin@2014.javazone.no"
    else
        echo "Unknown host '$1'. Leave blank to gather locally."
        exit 1
    fi

    echo "Status for: $host"
    ssh $host "cd helsesjekk && ./status.sh"
    exit $?    
}

if [ "$1" ]; then
    gather_remote $1
else
    gather_locally
fi

# TODO

# ems
# postfix
# cake-redux
