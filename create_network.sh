#!/usr/bin/env bash

UUID="$(uuidgen)"

aws cloudformation create-stack --stack-name capstone_project$UUID --template-body file://network.yml \
--parameters file://network_parameters.json