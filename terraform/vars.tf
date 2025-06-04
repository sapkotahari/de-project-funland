
variable "ingestion_bucket_prefix" {
  type    = string
  default = "funland-ingestion-bucket-"
}


variable "processed_bucket_prefix" {
  type    = string
  default = "funland-processed-bucket-"
}

variable "lambda_extract" {
  type    = string
  default = "extract-lambda"
}

variable "lambda_transform" {
  type    = string
  default = "transform-lambda"
}

variable "lambda_load" {
  type    = string
  default = "load-lambda"
}

variable "python_runtime" {
  type    = string
  default = "python3.13"
}

variable "step_function" {
  type = string
  default = "funland-etl"
}

variable "scheduler" {
  type = string
  default = "funland-etl-schedule"  
}

variable "EMAIL" {
  description = "Email address to receive Lambda failure notifications"
  type        = string
}

variable "aws_region" {
  type    = string
  default = "eu-west-2"
}

# ------------------------------

variable "TOTESYS_HOST" {
  type=string
}

variable "TOTESYS_PORT" {
  type=number
}

variable "TOTESYS_DATABASE" {
  description = "Totesys DB name"
  type=string
}

variable "TOTESYS_USER" {
  description = "Totesys DB user"
  type=string
}

variable "TOTESYS_PASSWORD" {
  type=string
}

# -------------------------

variable "DATA_WAREHOUSE_HOST" {
  type=string
}

variable "DATA_WAREHOUSE_PORT" {
  type=number
}

variable "DATA_WAREHOUSE_DATABASE" {
  description = "Warehouse DB name"
  type=string
}

variable "DATA_WAREHOUSE_USER" {
  description = "Warehouse DB user"
  type=string
}

variable "DATA_WAREHOUSE_PASSWORD" {
  type=string
}