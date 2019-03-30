# dockerfile

Extended syntax `dockerfile` based on `Buildkit`. It's already integrated in `Docker` versions `18.09`  and above.

## Usage `draft`

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

## MWP `concept`

Add `Dockerfile`

```bash
mkdir test; cd $_

bash <(curl -sSL https://raw.githubusercontent.com/opsway/dockerfile/master/dockerfile.sh) \
alpine:3.9.2 \
https://raw.githubusercontent.com/opsway/dockerfile/master/apk/snappy.sh \
https://raw.githubusercontent.com/opsway/dockerfile/master/apk/leveldb.sh \
https://raw.githubusercontent.com/opsway/dockerfile/master/apk/reindexer.sh \
| tee Dockerfile
```

Build image

```bash
docker build --tag opsway/dockerfile-sample .

docker history opsway/dockerfile-sample:latest
```

```text
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
2925b51a685c        2 days ago          /bin/sh -c set -xe ;apk add --update ;apk ad…   28.9MB              
c50637b6191d        2 days ago          /bin/sh -c set -xe ;apk add --update ;apk ad…   982kB               
5f7ec0512b19        2 days ago          /bin/sh -c set -xe ;apk add --update ;apk ad…   806kB               
5cb3aa00f899        3 weeks ago         /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B                  
<missing>           3 weeks ago         /bin/sh -c #(nop) ADD file:88875982b0512a9d0…   5.53MB  
```
