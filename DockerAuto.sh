#!/bin/bash

docker rm $(docker ps -a -f status=exited -q)

docker image rm encoding_checker:latest

docker build -t encoding_checker:latest .

# docker run -it -v ~/DockerEncodingChecker:/root/DockerEncodingChecker encoding_checker /bin/bash

clear

docker run -v ~/DockerEncodingChecker:/root/DockerEncodingChecker encoding_checker