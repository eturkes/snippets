#!/usr/bin/env bash

# Implementation derived from Stack Overflow
# https://stackoverflow.com/questions/59895/getting-the-source-directory-of-a-bash-script-from-within
# Question asked by: Jiaaro https://stackoverflow.com/users/2908/jiaaro
# Answer given by: Dave Dopson https://stackoverflow.com/users/407731/dave-dopson

# Get the location of this script regardless of where it is called from
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null && pwd )"
