#!/bin/bash

if [ -n ${AWS_ACCESS_KEY} ] 
then
  if [ -z ${AWS_SECRET_KEY} ]
  then 
    echo "You need an AWS_SECRET_KEY. Exiting..."
    exit 1
  fi
  echo "[default]" > /root/.aws/credentials
  echo "aws_access_key_id = ${AWS_ACCESS_KEY}" >> /root/.aws/credentials
  echo "aws_secret_access_key = ${AWS_SECRET_KEY}" >> /root/.aws/credentials
fi
if [ -n ${AWS_REGION} ]
then
  sed -i 's/us-west-2/'${AWS_REGION}'/g' /root/.aws/config
fi
exec "$@"
