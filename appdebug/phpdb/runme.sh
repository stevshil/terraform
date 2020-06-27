#!/bin/bash

docker built -t phpdb .
docker run -itd --name phpdb -p3306:3306 -e MYSQL_ROOT_PASSWORD=secret123 phpdb
