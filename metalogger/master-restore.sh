#!/bin/bash
set -x
if [ -f /var/lib/mfs/metadata_ml.mfs.back -a ! -f /var/lib/mfs/metadata.mfs ];
then
    mfsmetarestore -a
    if [ $? -ne 0 ]; then
        echo "FAILED to invoke the mfsmetarestore operation, check logs.";
        echo "Unable to start mfsmaster service.";
        exit 1;
    fi;
fi
mfsmaster start

