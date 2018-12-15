#!/usr/bin/env bash

# Copyright 2018 Emir Turkes
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Implementation derived from Stack Overflow
# https://stackoverflow.com/questions/59895/getting-the-source-directory-of-a-bash-script-from-within
# Question asked by: Jiaaro https://stackoverflow.com/users/2908/jiaaro
# Answer given by: Dave Dopson https://stackoverflow.com/users/407731/dave-dopson

# Get the location of this script regardless of where it is called from
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null && pwd )"
