#!/bin/bash

docker rm -f code
docker build -t code-server .
docker run --rm --name code -it -p 18080:8080 -p 18081:22 \
    --user 501 \
    -v /Users/jeonghan/Coding/build_code_ssh/config.yaml:/home/coder/.config/code-server/config.yaml \
    -v /Users/jeonghan/.ssh/authorized_keys:/home/coder/.ssh/authorized_keys:ro \
    code-server 
