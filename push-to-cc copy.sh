#!/usr/bin/env bash
# Scans a CloudFormation template file
# Requires "jq" (https://stedolan.github.io/jq/) to be installed

# Cloud Conformity API Key
# api_key=$CC_KEY # "Your Cloud Conformity API Key"
# Path to CloudFormation template file Yaml or JSON file
file_path="S3-bucket.yml"
# Region in which Cloud Conformity serves your organisation
region="us-west-2"

contents=$(cat ${file_path} | jq '.' -MRs)
payload="{\"data\":{\"attributes\":{\"type\":\"cloudformation-template\",\"contents\":${contents}}}}"

echo Request:
echo ${payload} | jq '.' -M

echo Response:
curl -s -X POST \
     -H $CC_KEY \
     -H "Content-Type: application/vnd.api+json" \
     https://${region}-api.cloudconformity.com/v1/template-scanner/scan \
     --data-binary "${payload}" | jq '.' -M