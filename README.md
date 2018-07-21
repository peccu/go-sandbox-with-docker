# go-sandbox-with-docker

Launch golang docker container with volume mounted CWD directory.

- volume configuration
  - `./go` into `/go` ($GOPATH in container)
    - for access fetched libraries
  - `./src` into `/src`
    - for your code

# Requirements
- docker

# Usage

```
$ git clone https://github.com/peccu/go-sandbox-with-docker.git
$ cd go-sandbox-with-docker
$ ./bash.sh
root@4cd986e6941f:/go#
```

If you run `bash.sh` from another directory, it mounts `go` and `src` in `bash.sh`'s directory.

So you can use multiple sandbox by copy or symlink `bash.sh`.
