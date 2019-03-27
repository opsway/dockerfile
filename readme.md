# dockerfile

Extended syntax `dockerfile` based on `Buildkit`. It's already integrated in `Docker` versions `18.09`  and above.

## Usage

Add `Dockerfile`

```dockerfile
# syntax = opsway/dockerfile
FROM alpine:3.9.2

RUN github.com/opsway/apk/leveldb
RUN github.com/opsway/apk/reindexer
```
Build image

```bash
DOCKER_BUILDKIT=1 docker build .
```
