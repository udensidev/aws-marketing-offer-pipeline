variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "kinesis_stream_name" {
  description = "The name of the Kinesis Data Stream"
  type        = string
}

variable "dynamodb_table_one_name" {
  description = "Name of the first DynamoDB table (with Streams enabled)"
  type        = string
}

variable "dynamodb_table_two_name" {
  description = "Name of the second DynamoDB table"
  type        = string
}

variable "glue_database_name" {
  description = "Name of the Glue database"
  type        = string
}

variable "glue_crawler_name" {
  description = "Name of the Glue crawler"
  type        = string
}

variable "glue_target_s3_path" {
  description = "S3 path to crawl"
  type        = string
}

variable "glue_role_arn" {
  description = "IAM Role ARN for Glue Crawler"
  type        = string
}

variable "lambda_function_one_name" {
  description = "Name of the first Lambda function"
  type        = string
}

variable "lambda_function_two_name" {
  description = "Name of the second Lambda function"
  type        = string
}

variable "lambda_role_arn" {
  description = "IAM Role ARN for Lambda functions"
  type        = string
}

variable "crawler_schedule_expression" {
  description = "Cron expression for Glue Crawler schedule"
  type        = string
  default     = "cron(0/1 * * * ? *)"
}

