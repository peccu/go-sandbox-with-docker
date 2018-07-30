#!/bin/bash
SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE:-$0}"); pwd)
cd $SCRIPT_DIR
docker run -v $PWD/home:/root -v $PWD/go:/go -v $PWD/src:/src --rm -it golang:1.8 bash
