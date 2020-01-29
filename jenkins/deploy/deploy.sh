#!/bin/bash

#Copia el jar

cp -r build/ jenkins/build/

curl -O https://bootstrap.pypa.io/get-pip.py && \
python get-pip.py --user && \
export PATH=~/.local/bin:$PATH 

echo "**********************"
pip install awscli --upgrade --user && \
echo "wich aws wich aws wich aws"
which aws
echo "**********************"

aws configure set aws_access_key_id $aws_access_key_id
aws configure set aws_secret_access_key $aws_secret_access_key
aws configure set default.region us-east-2

echo "######################"
echo "***** deployment *****"
echo "######################"

cd jenkins/build/ && aws s3 cp build s3://hangmanfront.dev.endava.com/ --recursive