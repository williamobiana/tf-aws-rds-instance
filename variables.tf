
variable "client_id" {
  description = "Client ID - use dsol for internal resources. Used in all name prefixes."
  type        = string
}

variable "deployment_id" {
  description = "The deployment/application ID to be used across stack resources."
  type = string
}

variable "environment" {
  type        = string
  description = "Deployment environment, defaults to terraform.workspace. Used in all name prefixes."
  default     = null
}

variable "owner" {
  description = "Technical owner of the resources."
  type  = string
}


variable "allocated_storage" {
  description = "The allocated in storage in GB that will be provisioned."
  default = 10
  type    = number
}

variable "backup_retention_period" {
  description = "The retention period in days for daily DB backups."
  default = 5
  type    = number
}

variable "db_name" {
  description = "The name of the default database that will be created."
  type        = string
}

variable "engine" {
  description = "The engine that will be used for the RDS."
  type    = string
}

variable "engine_version" {
  description = "The engine version that will be used for the RDS."
  type    = string
}

variable "instance_class" {
  description = "The class of DB instance that will be created."
  default = "db.t3.micro"
  type    = string
}

variable "multi_az" {
  description = "If `true` then the DB will be replicated across AZs for redundancy."
  default = false
  type    = bool
}

variable "name" {
  description = "Name that will be applied across all resources."
  type        = string
}

variable "password" {
  description = "The password for the RDS master user. Will be stored in AWS Secrets Manager. If `null` then a password will be created for you."
  default     = null
  type        = string
}

variable "port" {
  description = "The port that will be enabled for connecting to the RDS."
  type        = string
}

variable "publicly_accessible" {
  description = "Whether the RDS is reachable via the public internet."
  default     = false
  type        = bool
}

variable "username" {
  description = "The username for the RDS master user."
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of VPC Security Group IDs that will be assigned to the RDS. If `null` then a Security Group will be created for you."
  default     = null
  type        = list(string)
}

variable "vpc_subnet_ids" {
  description = "List of VPC subnets IDs where RDS ENIs will be created."
  type        = list(string)
}
