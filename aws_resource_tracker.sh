#!/bin/bash

# Author: Jitendra
# Date: 17-Dec-2024
# verssion: v1
# About: This script will report the AWS resource usage
# contact: jitendramaddula@gmail.com


set -x

# AWS S3
# AWS EC2
# AWS Lamda
# Aws IAM Users

# list S3 buckets
echo "###List of S3 buckets###" >  resourceTracker
if [ "$(aws s3 ls)" != "" ]; then
        aws s3 ls >>resourceTracker
else
        echo "There are no S3  buckets" >> resourceTracker
fi



# list EC2 instances
echo "###List of EC2  buckets###" >>  resourceTracker
if [ "$(aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId')" != "" ]; then
        aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> resourceTracker
else
        echo "There are no EC2  buckets" >> resourceTracker
fi




# list lambda
echo "###List of Lambda Functions###" >>  resourceTracker
if [ "$(aws lambda list-functions | jq '.Functions[].FunctionName')" != "" ]; then
        aws lambda list-functions | jq '.Functions[].FunctionName' >> resourceTracker
else
        echo "There are no Lambda Functions" >> resourceTracker
fi

# list  IAM users
echo "###List of IAM Users###" >> resourceTracker
if [ "$(aws iam list-users | jq '.Users[].UserName')" != "" ]; then
        aws iam list-users | jq '.Users[].UserName'  >> resourceTracker
else
        echo "There are no IAM users" >> resourceTracker
fi