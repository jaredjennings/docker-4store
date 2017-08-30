#!/bin/sh
docker build -t jaredjennings/4store:build . -f Dockerfile.build
docker create --name extract jaredjennings/4store:build
rm -rf ./app
docker cp extract:/output ./app
docker rm -f extract
docker build --no-cache -t jaredjennings/4store:latest .
