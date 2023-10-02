#!/usr/bin/env bash
# This script is _destructive_! It runs gomplate and then replaces
# all contents of the current directory with the template output.

gomplate --verbose
rc="$?"
if [ $rc -ne 0 ]; then
    exit $rc
fi

git stash push -m "gomplate input data backup" -- skeleton-data.yaml

ls -A | grep -xv "out" | grep -xv ".git" | xargs rm -rf && \
    mv -vf out/{.,}* . ; \
    rm -r out
