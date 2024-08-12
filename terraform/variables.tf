## Use only if you are using AWS Keys
#variable "aws_access_key" {
#  description = "Access key used to create instances"
#}
#
### Use only if you are using AWS Keys
#variable "aws_secret_key" {
#  description = "Secret key used to create instances"
#}

variable "aws_region" {
  type        = string
  description = "default region for terraform"
  default     = "us-east-1"
}

variable "env_var1" {
  type        = string
  description = "env_var1 for AWS ECS Task Definition"
}

variable "env_var2" {
  type        = string
  description = "env_var2 for AWS ECS Task Definition"
}

