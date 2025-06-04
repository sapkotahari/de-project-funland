resource "aws_secretsmanager_secret" "totesys_db_secret" {
  name = "totesys_db_secrets"
}

resource "aws_secretsmanager_secret_version" "totesys_db_secret_version" {
  secret_id     = aws_secretsmanager_secret.totesys_db_secret.id
  secret_string = jsonencode({
    totesys_user = var.TOTESYS_USER
    totesys_password = var.TOTESYS_PASSWORD
    totesys_database = var.TOTESYS_DATABASE
    totesys_host = var.TOTESYS_HOST
    totesys_port= var.TOTESYS_PORT
    
    })
}

data "aws_secretsmanager_secret_version" "totesysy_db_secret_data" {
  secret_id       = aws_secretsmanager_secret.totesys_db_secret.id
  version_id      = aws_secretsmanager_secret_version.totesys_db_secret_version.version_id
  version_stage = "AWSCURRENT"
}

resource "aws_secretsmanager_secret" "warehouse_secrets" {
  name = "warehouse_secrets"
}

resource "aws_secretsmanager_secret_version" "warehouse_db_secret_version" {
  secret_id     = aws_secretsmanager_secret.warehouse_secrets.id
  secret_string = jsonencode({
    totesys_user = var.DATA_WAREHOUSE_USER
    totesys_password = var.DATA_WAREHOUSE_PASSWORD
    totesys_database = var.DATA_WAREHOUSE_DATABASE
    totesys_host = var.DATA_WAREHOUSE_HOST
    totesys_port= var.DATA_WAREHOUSE_PORT
    })
}

data "aws_secretsmanager_secret_version" "warehouse_db_secret_data" {
  secret_id       = aws_secretsmanager_secret.warehouse_secrets.id
  version_id      = aws_secretsmanager_secret_version.warehouse_db_secret_version.version_id
  version_stage = "AWSCURRENT"
}

resource "aws_secretsmanager_secret" "email" {
  name = "notificable-email-address"
}

resource "aws_secretsmanager_secret_version" "email_version" {
  secret_id = aws_secretsmanager_secret.email.id
  secret_string = jsonencode({
    email = var.EMAIL
  })
}

# output "totesys_user" {
#   value = data.aws_secretsmanager_secret_version.db_secret_data.json.totesys_user
# }

# output "totesys_password" {
#   value = data.aws_secretsmanager_secret_version.db_secret_data.json.totesys_password
# }

# output "totesys_database" {
#   value = data.aws_secretsmanager_secret_version.db_secret_data.json.totesys_database
# }

# output "totesys_host" {
#   value = data.aws_secretsmanager_secret_version.db_secret_data.json.totesys_host
# }

# output "totesys_port" {
#   value = data.aws_secretsmanager_secret_version.db_secret_data.json.totesys_port
# }

# output "s3_ingestion_bucket" {
#   value = data.aws_secretsmanager_secret_version.db_secret_data.json.s3_ingestion_bucket
# }




