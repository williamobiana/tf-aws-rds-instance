
output "address" {
  description = "The address of the RDS."
  value       = aws_db_instance.db.address
}

output "arn" {
  description = "The ARN of the RDS."
  value       = aws_db_instance.db.arn
}

output "id" {
  description = "The ID of the RDS."
  value       = aws_db_instance.db.id
}

output "password_secret_arn" {
  description = "The ARN of the Secrets Manager Secret for the RDS master password."
  value = aws_secretsmanager_secret.password.arn
}

output "security_group_ids" {
  description = "The IDs of the RDS Security Groups."
  value       = var.vpc_security_group_ids == null ? var.vpc_security_group_ids : [aws_security_group.db[0].id]
}
