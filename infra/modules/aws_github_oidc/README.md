# Module: aws_github_oidc

This module provides the Goats and Friends opinionated default parameters for
the `unfunco/aws_oidc_github/aws` module.

<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name                                                                             | Source                  | Version |
| -------------------------------------------------------------------------------- | ----------------------- | ------- |
| <a name="module_aws_oidc_github"></a> [aws_oidc_github](#module_aws_oidc_github) | unfunco/oidc-github/aws | 0.4.0   |

## Resources

No resources.

## Inputs

| Name                                                                                                                     | Description                                                              | Type           | Default                                      | Required |
| ------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------ | -------------- | -------------------------------------------- | :------: |
| <a name="input_attach_admin_policy"></a> [attach_admin_policy](#input_attach_admin_policy)                               | Flag to enable/disable the attachment of the AdministratorAccess policy. | `bool`         | `false`                                      |    no    |
| <a name="input_attach_read_only_policy"></a> [attach_read_only_policy](#input_attach_read_only_policy)                   | Flag to enable/disable the attachment of the ReadOnly policy.            | `bool`         | `true`                                       |    no    |
| <a name="input_enabled"></a> [enabled](#input_enabled)                                                                   | Flag to enable/disable the creation of resources.                        | `bool`         | `true`                                       |    no    |
| <a name="input_force_detach_policies"></a> [force_detach_policies](#input_force_detach_policies)                         | Flag to force detachment of policies attached to the IAM role.           | `string`       | `false`                                      |    no    |
| <a name="input_github_organisation"></a> [github_organisation](#input_github_organisation)                               | GitHub organisation name.                                                | `string`       | n/a                                          |   yes    |
| <a name="input_github_repositories"></a> [github_repositories](#input_github_repositories)                               | List of GitHub repository names.                                         | `list(string)` | n/a                                          |   yes    |
| <a name="input_github_thumbprint"></a> [github_thumbprint](#input_github_thumbprint)                                     | GitHub OpenID TLS certificate thumbprint.                                | `string`       | `"6938fd4d98bab03faadb97b34396831e3780aea1"` |    no    |
| <a name="input_iam_policy_name"></a> [iam_policy_name](#input_iam_policy_name)                                           | Name of the IAM policy to be assumed by GitHub.                          | `string`       | `"github"`                                   |    no    |
| <a name="input_iam_policy_path"></a> [iam_policy_path](#input_iam_policy_path)                                           | Path to the IAM policy.                                                  | `string`       | `"/"`                                        |    no    |
| <a name="input_iam_role_name"></a> [iam_role_name](#input_iam_role_name)                                                 | Name of the IAM role.                                                    | `string`       | `"github"`                                   |    no    |
| <a name="input_iam_role_path"></a> [iam_role_path](#input_iam_role_path)                                                 | Path to the IAM role.                                                    | `string`       | `"/"`                                        |    no    |
| <a name="input_iam_role_permissions_boundary"></a> [iam_role_permissions_boundary](#input_iam_role_permissions_boundary) | ARN of the permissions boundary to be used by the IAM role.              | `string`       | `""`                                         |    no    |
| <a name="input_iam_role_policy_arns"></a> [iam_role_policy_arns](#input_iam_role_policy_arns)                            | List of IAM policy ARNs to attach to the IAM role.                       | `list(string)` | `[]`                                         |    no    |
| <a name="input_max_session_duration"></a> [max_session_duration](#input_max_session_duration)                            | Maximum session duration in seconds.                                     | `number`       | `3600`                                       |    no    |
| <a name="input_region"></a> [region](#input_region)                                                                      | AWS region in which to apply resources.                                  | `string`       | n/a                                          |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                                                            | Map of tags to be applied to all resources.                              | `object({})`   | `{}`                                         |    no    |

## Outputs

| Name                                                                    | Description          |
| ----------------------------------------------------------------------- | -------------------- |
| <a name="output_iam_role_arn"></a> [iam_role_arn](#output_iam_role_arn) | ARN of the IAM role. |

<!-- END_TF_DOCS -->
