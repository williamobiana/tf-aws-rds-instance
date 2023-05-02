# AWS x Terraform Module

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

## Overview
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_id"></a> [client_id](#input_client_id) | Client ID - use dsol for internal resources. Used in all name prefixes. | `string` | n/a | yes |
| <a name="input_db_name"></a> [db_name](#input_db_name) | The name of the default database that will be created. | `string` | n/a | yes |
| <a name="input_deployment_id"></a> [deployment_id](#input_deployment_id) | The deployment/application ID to be used across stack resources. | `string` | n/a | yes |
| <a name="input_engine"></a> [engine](#input_engine) | The engine that will be used for the RDS. | `string` | n/a | yes |
| <a name="input_engine_version"></a> [engine_version](#input_engine_version) | The engine version that will be used for the RDS. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input_name) | Name that will be applied across all resources. | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input_owner) | Technical owner of the resources. | `string` | n/a | yes |
| <a name="input_port"></a> [port](#input_port) | The port that will be enabled for connecting to the RDS. | `string` | n/a | yes |
| <a name="input_username"></a> [username](#input_username) | The username for the RDS master user. | `string` | n/a | yes |
| <a name="input_vpc_subnet_ids"></a> [vpc_subnet_ids](#input_vpc_subnet_ids) | List of VPC subnets IDs where RDS ENIs will be created. | `list(string)` | n/a | yes |
| <a name="input_allocated_storage"></a> [allocated_storage](#input_allocated_storage) | The allocated in storage in GB that will be provisioned. | `number` | `10` | no |
| <a name="input_backup_retention_period"></a> [backup_retention_period](#input_backup_retention_period) | The retention period in days for daily DB backups. | `number` | `5` | no |
| <a name="input_environment"></a> [environment](#input_environment) | Deployment environment, defaults to terraform.workspace. Used in all name prefixes. | `string` | `null` | no |
| <a name="input_instance_class"></a> [instance_class](#input_instance_class) | The class of DB instance that will be created. | `string` | `"db.t3.micro"` | no |
| <a name="input_multi_az"></a> [multi_az](#input_multi_az) | If `true` then the DB will be replicated across AZs for redundancy. | `bool` | `false` | no |
| <a name="input_password"></a> [password](#input_password) | The password for the RDS master user. Will be stored in AWS Secrets Manager. If `null` then a password will be created for you. | `string` | `null` | no |
| <a name="input_publicly_accessible"></a> [publicly_accessible](#input_publicly_accessible) | Whether the RDS is reachable via the public internet. | `bool` | `false` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc_security_group_ids](#input_vpc_security_group_ids) | List of VPC Security Group IDs that will be assigned to the RDS. If `null` then a Security Group will be created for you. | `list(string)` | `null` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_address"></a> [address](#output_address) | The address of the RDS. |
| <a name="output_arn"></a> [arn](#output_arn) | The ARN of the RDS. |
| <a name="output_id"></a> [id](#output_id) | The ID of the RDS. |
| <a name="output_password_secret_arn"></a> [password_secret_arn](#output_password_secret_arn) | The ARN of the Secrets Manager Secret for the RDS master password. |
| <a name="output_security_group_ids"></a> [security_group_ids](#output_security_group_ids) | The IDs of the RDS Security Groups. |
## Resources

| Name | Type |
|------|------|
| [aws_db_instance.db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_secretsmanager_secret.password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [aws_security_group.db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
## Modules

No modules.
## Usage

```hcl

```

## Documentation
We use a library called `terraform-docs` for automatically generating documentation for the variables, outputs, resources, and sub-modules defined within a Terraform module.   
The output from `terraform-docs` is wrapped between `HEADER.md` and `FOOTER.md` files which include custom module documentation and usage guidelines.

To ensure our documentation remains up-to-date, it is important that each time changes are made to a module the docs are updated by cd'ing into the module directory and running the following command:  

`terraform-docs --config docs/terraform-docs.yml markdown --escape=false . > README.md`
