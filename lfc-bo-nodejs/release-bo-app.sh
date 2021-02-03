#!/bin/bash

#echo $1
#echo $2
#APP_VERSION#

sed "s^#APP_VERSION#^$1^g" views/index-template.pug > views/index.pug

docker build . -t bo-nodejs:latest

docker tag bo-nodejs:latest images.mobiguider.cloud/bo-nodejs

docker push images.mobiguider.cloud/bo-nodejs

git add *

git commit -m "BO Node JS App version release v $1"

git push


