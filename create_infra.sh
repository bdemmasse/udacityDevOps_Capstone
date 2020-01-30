#!/usr/bin/env bash

UUID="$(uuidgen)"

aws cloudformation create-stack --stack-name capstone_project$UUID --template-body file://server.yml \
--parameters file://server-parameters.json --region=eu-west-1