#!/bin/bash
sudo apt-get update -y
sudo apt-get install docker.io -y
sudo docker run -p ${nginx-port}:8228 -v /var/log/nginx/:/var/log/nginx --name appelo-test alexsup1312/appello-test:v1