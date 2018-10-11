#!/bin/bash
SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE:-$0}"); pwd)
cd $SCRIPT_DIR
cat <<EOF
https://medium.com/@diogok/on-golang-static-binaries-cross-compiling-and-plugins-1aed33499671
- ldflags '-w' just disables debug letting the file be smaller.
- ldflags '-extldflags "-static"' for glibc (CGO ?)
- ldflags '-s' small?
- disabled CGO , which you may not need depending on the libs and things you do
  - Disabling CGO also removes the need for the cross-compile dependencies.
- forced a rebuild with -a
- tagged netgo to make sure we use built-in net package and not the system’s one

CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -tags netgo -installsuffix netgo -ldflags '-s -w -extldflags "-static" -linkmode external'
EOF
docker run -v $PWD/home:/root -v $PWD/go:/go -v $PWD/src:/src/$(basename $PWD) -w /src/$(basename $PWD) --rm -it golang bash
