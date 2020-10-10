#!/bin/bash

#Get servers list
set -f
string=$DEPLOY_SERVER
array=(${string//,/ })

for i in "${!array[@]}"; do
  echo "Deploying information to EC2 and Gitlab"
  echo "Deploy project on server ${array[i]}"
  ssh ubuntu@${array[i]} "cd  /var/www/html && sudo git pull origin master"
done
