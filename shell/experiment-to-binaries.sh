#!/bin/sh

# Move all Intellicage .experiment files to binaries folder
# To be used in top-level of Intellicage Archive

for d in */ ; do
    ARCHIVE_EXPERIMENTS=${PWD}/"${d}"Experiments
    BINARIES_EXPERIMENTS=../../binaries/"${PWD#${PWD%/*/*}/}"/"${d}"Experiments
    
    ls "${ARCHIVE_EXPERIMENTS}"
    
    mkdir -p "${BINARIES_EXPERIMENTS}" 
    mv "${ARCHIVE_EXPERIMENTS}"/*experiment "${BINARIES_EXPERIMENTS}"
    ln -sr "${BINARIES_EXPERIMENTS}"/*experiment "${ARCHIVE_EXPERIMENTS}"
done
