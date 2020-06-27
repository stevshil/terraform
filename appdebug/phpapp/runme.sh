#!/bin/bash

docker build -t phpapp .
docker run -itd --name phpapp -P -e DBHOST=$1 phpapp
