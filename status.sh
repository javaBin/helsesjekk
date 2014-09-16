#!/usr/bin/env bash

green() { echo -e "\033[32m$1\033[0m"; }
red() { echo -e "\033[31m$1\033[0m"; }

gather_local() {
    for script in components/*.*; do
        if [ -x ${script} ]; then
            #component=`basename ${script} | cut -d'.' --complement -f2- | tr '[:lower:]' '[:upper:]'`
            component=`basename ${script} | rev | cut -d"." -f2- | rev | tr '[:lower:]' '[:upper:]'`
            msg=`./${script}`
            status=$?
            if [ $status -gt 0 ]; then
                red "${component}"
            else
                green "${component}"
            fi
            if [[ -n ${msg} ]]; then
                echo "${msg}" | sed 's/^/  /'
            fi
        fi
    done
    unset component msg status script
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

    echo "Fetching status from ${host}"
    ssh ${host} "cd helsesjekk && ./status.sh"
    exit $?
}

update_from_git() {
    echo "Checking for script updates..."
    git remote update >/dev/null
    behind=`git status --untracked-files=no | grep 'Your branch is behind'`

    if [[ -n ${behind} ]]; then
        echo "Repository is behind, updating from GitHub..."
        git pull -q
    else
        echo "Already up to date."
    fi
}

update_from_git
if [ "$1" ]; then
    gather_remote $1
else
    echo
    gather_local
fi

# TODO
# make checks for
#
#   - postfix
#   - cake-redux
