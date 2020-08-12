#!/bin/bash

# build image
docker build -t pwn_env1804 .
# run image
docker run --rm -it -v `pwd`:/root/challenge  --name pwn_env_1804  pwn_env1804 /bin/bash
