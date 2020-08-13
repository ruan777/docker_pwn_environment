#!/bin/bash

# build image
docker build -t pwn_env2004 .
# run image
docker run --rm -it -v `pwd`:/root/challenge  --name pwn_env_2004  pwn_env2004 
