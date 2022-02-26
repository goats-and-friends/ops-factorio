#!/bin/sh

# Copyright 2022 Goats and Friends.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at:
#
# https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#
# bootstrap.sh
# ============
#
# Requirements:
#   - aws-cli ~> 2.4.6
#   - terraform ~> 1.1
#
# Environment variables:
#   - AWS_REGION: Region for the tf state bucket (default us-east-1)
#
# Initializes terraform using a backend configuration pulled from the
# AWS CLI. Assumes your state S3 bucket named:
#
#     tf-state-bucket-${AWS_ACCOUNT_ID}-${AWS_REGION}
#

set -x
set -e

AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output=text)
AWS_REGION=${AWS_REGION:=us-east-1}

TF_STATE_BUCKET_NAME="tf-state-bucket-${AWS_ACCOUNT_ID}-${AWS_REGION}"
echo "==> Bootstrapping using state S3 bucket ${TF_STATE_BUCKET_NAME}"

terraform init \
    -backend-config="bucket=${TF_STATE_BUCKET_NAME}" \
    -backend-config="region=${AWS_REGION}"
