#!/bin/bash

# This script was based on the script in the official Cloud Conformity repo: https://github.com/cloudconformity/documentation-api/blob/master/examples/bash/template-scanner/scan.sh 

# Set the necesessary Variables and execute the scan CloudFormation template
# Requires "jq" (https://stedolan.github.io/jq/) to be installed

# Path to CloudFormation template file Yaml or JSON file
file_path="S3-bucket.yml"

# Region in which Cloud Conformity serves your organisation
region="us-west-2"

contents=$(cat ${file_path} | jq '.' -MRs)

# If you want to not send a file, you can get replace/ rid of the $contents variable and change to your own String e.g. export payload=" { \"data\": { \"attributes\": { \"type\": \"cloudformation-template\", \"contents\": \"---\\nAWSTemplateFormatVersion: '2010-09-09'\\nResources:\\n  S3Bucket:\\n    Type: AWS::S3::Bucket\\n    Properties:\\n      AccessControl: PublicRead\" } }} "
export payload="{\"data\":{\"attributes\":{\"type\":\"cloudformation-template\",\"contents\":${contents}}}}"

# URL to access the resource
export url="https://${region}-api.cloudconformity.com/v1/template-scanner/scan"

# If you want to compile using gcc delete the # - Watch out for the links, you have to include the -lcurl
# gcc Template_Scanner.c -lcurl -o Template_Scanner

./Template_Scanner  | jq



# Below are some jq examples:

# cat Template_Result.json (Or any file name that has the result from the Template_Scanner executable) | jq '.data[]'
# cat Template_Result.json | jq '.data[].type'
# cat Template_Result.json | jq '.data[].status'
# cat Template_Result.json | jq '.data[].attributes.status'
# cat Template_Result.json | jq '.data[].attributes'
# cat Template_Result.json | jq '.data[].attributes && .data[].attributes.message'
# cat Template_Result.json | jq '.data[].attributes | .data[].attributes.message'
# cat Template_Result.json | jq '.data[].attributes | .message'
# cat Template_Result.json | jq '.data[].attributes | select(.message == "FAILURE")'
# cat Template_Result.json | jq '.data[]| select(.message == "FAILURE")'
# cat Template_Result.json | jq '.data[] | select(.message == "FAILURE")'
# cat Template_Result.json | jq '.data[].attributes.message' 
# cat Template_Result.json | jq '.data[].attributes.status'
# cat Template_Result.json | jq '.data[].attributes | select(.status=="FAILURE")'
# cat Template_Result.json | jq '.data[].attributes | select(.status=="FAILURE") | {message:.message} '
# cat Template_Result.json | jq '.data[].attributes | select(.status=="FAILURE") | {region:.region} '
# cat Template_Result.json | jq '.data[].attributes | select(.status=="FAILURE") | {message:.message, region:.region} '
# cat Template_Result.json | jq '.data[].attributes | select(.status=="FAILURE") | {message:.message, region:.region, categories:.categories} '
# cat Template_Result.json | jq '.data[].attributes | select(.status=="FAILURE") | {resource:.resource, message:.message, region:.region, categories:.categories} '
# cat Template_Result.json | jq '.data[].attributes | select(.status=="FAILURE") | {resource:.resource, message:.message, region:.region, categories:.categories} ' > t.json
# cat Template_Result.json | jq . > t.json