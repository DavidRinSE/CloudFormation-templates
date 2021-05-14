#!/usr/bin/env bash

STACK_NAME=$1

if [ -z "$1" ]
  then
    echo "No STACK_NAME argument supplied"
    exit 1
fi

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Creating stack..."
STACK_ID=$( \
  aws cloudformation create-stack \
  --stack-name ${STACK_NAME} \
  --template-body file://${DIR}/HelloBucket.yml \
  --capabilities CAPABILITY_IAM \
)

echo "Waiting on ${STACK_ID} create completion..."
aws cloudformation wait stack-create-complete --stack-name ${STACK_ID}
aws cloudformation describe-stacks --stack-name ${STACK_ID}