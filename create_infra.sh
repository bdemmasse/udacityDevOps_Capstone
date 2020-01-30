#!/usr/bin/env bash

aws cloudformation create-stack --stack-name capstone_project --template-body file://server.yml \
--parameters file://server-parameters.json --region=eu-west-1