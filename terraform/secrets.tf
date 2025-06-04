resource "aws_secretsmanager_secret" "db_secret" {
  name = "my_db_secrets"
}

resource "aws_secretsmanager_secret_version" "db_secret_version" {
  secret_id     = aws_secretsmanager_secret.db_secret.id
  secret_string = jsonencode({
    totesys_user = var.TOTESYS_USER
    totesys_password = var.TOTESYS_PASSWORD
    totesys_database = var.TOTESYS_DATABASE
    totesys_host = var.TOTESYS_HOST
    totesys_port= var.TOTESYS_PORT
    
    })
}


data "aws_secretsmanager_secret_version" "db_secret_data" {
  secret_id       = aws_secretsmanager_secret.db_secret.id
  version_id      = aws_secretsmanager_secret_version.db_secret_version.version_id
  version_stage = "AWSCURRENT"
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




