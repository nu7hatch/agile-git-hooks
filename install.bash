#!/bin/bash

repo_url="git://github.com/nu7hatch/agile-git-hooks.git"
temp_dir="/tmp/agile-git-hooks"

exec < /dev/tty

echo "WARNING! This operation may destroy your already configured hooks!"
read -p "Do you want to proceed the installation? (y/N) " answer

if [ "$answer" != "y" ] && [ "$answer" != "Y" ]; then
    echo
    echo "Aborting..."
    exit 1
fi

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
