#!/bin/bash

repo_url="git://github.com/nu7hatch/agile-git-hooks.git"
temp_dir="/tmp/agile-git-hooks"

if [ -d "$(pwd)/.git" ]; then
    rm -rf $temp_dir
    git clone $repo_url $temp_dir
    cp $temp_dir/hooks/* .git/hooks

    echo
    echo "Hooks has been successfully installed!"

    rm -rf $temp_dir
else
    echo "ERROR: Not a git repository."
    exit 1
fi
