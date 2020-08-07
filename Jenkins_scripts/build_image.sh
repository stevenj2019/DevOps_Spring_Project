#!/bin/bash
export BUILD_NUMBER=${1}
docker-compose build 
docker-compose push 
