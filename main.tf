
# DB

resource "aws_db_instance" "db" {
  allocated_storage           = var.allocated_storage
  allow_major_version_upgrade = false
  availability_zone           = var.multi_az == true ? null : data.aws_subnet.subnet.availability_zone
  backup_retention_period     = var.backup_retention_period
  backup_window               = "02:00-04:00"
  db_name                     = var.db_name
  db_subnet_group_name        = aws_db_subnet_group.subnets.name
  engine                      = var.engine
  engine_version              = var.engine_version
  identifier_prefix           = "${local.prefix}-${var.name}"
  instance_class              = var.instance_class
  maintenance_window          = "Sat:00:00-Sat:02:00"
  multi_az                    = var.multi_az
  username                    = var.username
  password                    = var.password != null ? var.password : random_password.password.result
  port                        = var.port
  publicly_accessible         = var.publicly_accessible
  skip_final_snapshot         = true
  storage_encrypted           = true
  vpc_security_group_ids      = var.vpc_security_group_ids != null ? var.vpc_security_group_ids : [aws_security_group.db[0].id]

  tags = merge(
    local.default_tags,
    { Name = "${local.prefix}-${var.name}" }
  )
}

# Subnets and Optional SG

resource "aws_db_subnet_group" "subnets" {
  name       = "${local.prefix}-${var.name}"
  subnet_ids = var.vpc_subnet_ids

  tags = merge(
    local.default_tags,
    { Name = "${local.prefix}-${var.name}" }
  )
}

resource "aws_security_group" "db" {
  count       = var.vpc_security_group_ids != null ? 0 : 1

  name        = "${local.prefix}-${var.name}-rds-sg"
  description = "SG for ${var.name} RDS."
  vpc_id      = data.aws_subnet.subnet.vpc_id

  tags = merge(
    local.default_tags,
    { Name = "${local.prefix}-${var.name}-rds-sg" }
  )
}

# Auto-generated Password

resource "random_password" "password" {
  length = 20
}

resource "aws_secretsmanager_secret" "password" {
  name                    = "${local.prefix}-${var.name}-db-password"
  recovery_window_in_days = 0
  tags = merge(
    local.default_tags,
    { "Name" : "${local.prefix}-${var.name}-db-password" }
  )
}

resource "aws_secretsmanager_secret_version" "password" {
  secret_id     = aws_secretsmanager_secret.password.id
  secret_string = var.password != null ? var.password : random_password.password.result
  lifecycle {
    ignore_changes = [secret_string]
  }
}
