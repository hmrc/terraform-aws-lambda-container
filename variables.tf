variable "account_engineering_boundary" {
  description = "The account engineering permission boundary to use for the IAM role"
  type        = string
}

variable "enable_error_alarm" {
  description = "Creates an alarm for the Errors metric"
  type        = bool
  default     = true
}

variable "environment" {
  description = "Name of the environment the lambda function is deployed to"
  type        = string
}

variable "environment_variables" {
  description = "Environment variables to pass to the lambda function"
  type        = map(string)
  default     = {}
}

variable "error_alarm_actions" {
  description = "List of SNS topics to notify when the alarm changes state"
  type        = list(string)
  default     = []
}

variable "error_alarm_runbook" {
  description = "Link to the confluence runbook for triaging the alamr"
  type        = string
  default     = ""
}

variable "error_alarm_threshold" {
  description = "The number of errors that can occur before the alarm is triggered"
  type        = string
  default     = "0"
}

variable "iam_role_name_override" {
  description = "Override the IAM role name if it must be specific and not auto generated"
  default     = ""
  type        = string
}

variable "image_command" {
  default     = []
  description = "The image command to run for the lambda's function"
  type        = list(string)
}

variable "function_name" {
  description = "The lambda function's name"
  type        = string
}

variable "function_version_override" {
  description = "The function version to override the latest alias to"
  default     = null
  type        = string
}

variable "image_uri" {
  description = "The full image URI to the image that should be published"
  type        = string
}

variable "lambda_function_tags" {
  description = "Tags to set on the created lambda function (in addition to those added by this module)"
  type        = map(string)
  default     = {}
}

variable "lambda_git_repo" {
  description = "URL for the GitHub repository"
  type        = string
}

variable "log_subscription_filter_destination_arn" {
  description = "The Kibana log subscription destination ARN"
  type        = string
}

variable "memory_size" {
  default     = 256
  description = "The amount of memory to allocate to the lambda function"
  type        = number
}

variable "reserved_concurrent_executions" {
  description = "Amount of reserved concurrent executions for this lambda function."
  type        = number
  default     = -1
}

variable "timeout" {
  default     = 900
  description = "How long the lambda is allowed to run before timing out"
  type        = number
}

variable "vpc_id" {
  default     = null
  description = "(DEPRECATED) The VPC id the lambda should use if it needs to be in a VPC"
  type        = string
}

variable "vpc_subnet_ids" {
  default     = []
  description = "The list of subnet ids the lambda should use if it needs to be in a VPC"
  type        = list(string)
}

variable "security_group_ids" {
  default     = []
  description = "An optional list of security group IDs to attach to the lambda in addition to the group this module creates"
  type        = list(string)
}
