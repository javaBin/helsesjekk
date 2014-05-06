#!/usr/bin/env bash

green() { echo -e "\033[32m$1\033[0m"; }
red() { echo -e "\033[31m$1\033[0m"; }

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
