#!/bin/bash

# $1 - what you want to accomplish
# $2 - a custom message on failure
require_clean_work_tree () {
    git rev-parse --verify HEAD >/dev/null || exit 1
    git update-index -q --ignore-submodules --refresh
    err=0

    if ! git diff-files --quiet --ignore-submodules
    then
        echo >&2 "Cannot $1: You have unstaged changes."
        err=1
    fi

    if ! git diff-index --cached --quiet --ignore-submodules HEAD --
    then
        if [ $err = 0 ]
        then
            echo >&2 "Cannot $1: Your index contains uncommitted changes."
        else
            echo >&2 "Additionally, your index contains uncommitted changes."
        fi
        err=1
    fi

    if [ $err = 1 ]
    then
        test -n "$2" && echo >&2 "$2"
        exit 1
    fi
}

require_clean_work_tree deploy "Deploy Failed, try dev_push or clean up your space"


composer install
rsync -rltvR --exclude=.git/ --exclude=.idea/ --delete-excluded vendor/ $1
rsync -rltv --exclude=.git/ --exclude=.idea/ --exclude=vendor/ --delete src/ $1
