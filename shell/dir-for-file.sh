#!/bin/sh

# Create a directory for each file in current working directory and place each file in
# the newly created directory
# Currently hardcoded for .tex file extension

for x in ./*.tex; do
    mkdir "${x%.*}" && mv "$x" "${x%.*}"
done
