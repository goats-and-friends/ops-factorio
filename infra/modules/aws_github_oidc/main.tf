/*
Copyright 2022 Goats and Friends.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at:

https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

provider "aws" {
  region = var.region
}

module "aws_oidc_github" {
  source  = "unfunco/oidc-github/aws"
  version = "0.4.0"

  enabled = var.enabled

  attach_admin_policy           = var.attach_admin_policy
  attach_read_only_policy       = var.attach_read_only_policy
  force_detach_policies         = var.force_detach_policies
  github_thumbprint             = var.github_thumbprint
  iam_policy_name               = var.iam_policy_name
  iam_policy_path               = var.iam_policy_path
  iam_role_name                 = var.iam_role_name
  iam_role_path                 = var.iam_role_path
  iam_role_permissions_boundary = var.iam_role_permissions_boundary
  iam_role_policy_arns          = var.iam_role_policy_arns
  github_organisation           = var.github_organisation
  github_repositories           = var.github_repositories
  max_session_duration          = var.max_session_duration
  tags                          = var.tags
}
