variable "aws_region" {
  type        = string
  description = "default region for terraform"
  default     = "us-east-1"
}

## Use only if you are using AWS Keys
variable "aws_access_key" {
  description = "Access key used to create instances"
}

## Use only if you are using AWS Keys
variable "aws_secret_key" {
  description = "Secret key used to create instances"
}

