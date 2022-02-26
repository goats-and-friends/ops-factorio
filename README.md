# ops-factorio

Infrastructure code repository for Goats and Friends Factorio server.

## Architecture

Goats and Friends Factorio was designed to maximize reliability and minimize
total cost of ownership, including time upgrading infrastructure code. The

## Bootstrapping

This repo provides all infrastructure code to bootstrap from a new AWS account.
This section aims to be a guide for full disaster recovery. These steps have
only ever been run once: at the beginning of the lifecycle of Goats and Friends
Factorio.

### Create a temporary admin user

Log in to the AWS Console with the **root** email address. Create an IAM user
named `admin` attached to the policy `AdministratorAccess`, and provision
credentials for the AWS API. Configure your local AWS CLI to use these
credentials.

### Bootstrap terraform

We bootstrap Terraform with CloudFormation to avoid ever having any local state.
By convention, we store the primary bucket in `us-east-1` and the replication
bucket in `us-east-2`.

```bash
pushd infra/bootstrap
export TF_BACKUP_REGION=us-east-2
export TF_REGION=us-east-1
aws cloudformation create-stack --region ${TF_BACKUP_REGION} --stack-name terraform-state-replication-bucket --template-body file://state-backend-s3-replication.yml --capabilities CAPABILITY_IAM
aws cloudformation create-stack --region ${TF_REGION} --stack-name terraform-state-backend --template-body file://state-backend-s3.yml --capabilities CAPABILITY_IAM --parameters "ParameterKey=ReplicationBucketRegion,ParameterValue=${TF_BACKUP_REGION}"
popd
```

### Provision the GitHub OIDC

This step provisions the necessary AWS resources to enable CI/CD through GitHub
Actions.

Start by changing directory to the `shared` environment and initializing
terraform. Set the `aws_region` Terraform variable to your intended target
region (assuming the same as the S3 bucket). Create a Terraform plan for the
OIDC provider and necessary IAM roles.

```bash
pushd infra/environments/shared
./bootstrap.sh
export TF_VAR_aws_region=${TF_REGION}
terraform plan -out=tfplan
```

Now inspect the plan before applying:

```bash
terraform apply tfplan
popd
```

## License

Copyright 2022 Goats and Friends. All rights reserved the terms of the [Apache
License, Version 2.0][license].

[tf-cloudformation]: https://github.com/tiborhercz/tf-state-backend-s3-cloudformation
[license]: LICENSE.md
