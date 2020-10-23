#!/bin/bash

# Scans a CloudFormation template file
# Requires "jq" (https://stedolan.github.io/jq/) to be installed

# Path to CloudFormation template file Yaml or JSON file
file_path="S3-bucket.yml"

contents=$(cat ${file_path} | jq '.' -MRs)

# If you want to not send a file, you can get replace/ rid of the $contents variable and change to your own String e.g. export payload=" { \"data\": { \"attributes\": { \"type\": \"cloudformation-template\", \"contents\": \"---\\nAWSTemplateFormatVersion: '2010-09-09'\\nResources:\\n  S3Bucket:\\n    Type: AWS::S3::Bucket\\n    Properties:\\n      AccessControl: PublicRead\" } }} "

export payload="{\"data\":{\"attributes\":{\"type\":\"cloudformation-template\",\"contents\":${contents}}}}"

# If you want to compile using gcc delete the # - Watch out for the links, you have to include the -lcurl
# gcc Template_Scanner.c -lcurl -o Template_Scanner

./Template_Scanner  | jq