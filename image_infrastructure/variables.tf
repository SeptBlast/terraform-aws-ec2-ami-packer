variable "description" {
  type        = string
  description = "The description of the component."
  default     = null
}

variable "name" {
  type        = string
  description = "The name of the component."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "The tags applied to the component."
  default     = {}
}

variable "iam_instance_profile_name" {
  type        = string
  description = "The name of the IAM instance profile used when building images."
  default     = null
}

variable "instance_types" {
  type        = list(string)
  description = "The list of EC2 instance types to build."
  default     = []
}

variable "key_name" {
  type        = string
  description = "Name of EC2 key pair used to connect to the instances."
  default     = null
}

variable "s3_bucket_name" {
  type        = string
  description = "The name of the bucket that will receive the log objects."
  default     = null
}

variable "s3_key_prefix" {
  type        = string
  description = "The key prefix to use when logging.  Defaults to \"imagebuilder/[NAME]/\" if not specified."
  default     = null
}

variable "sns_topic_arn" {
  type        = string
  description = "The ARN of the SNS topic receiving notifications during builds."
  default     = null
}

variable "subnet_id" {
  type        = string
  description = "The ID of the VPC subnet used when building images."
  default     = null
}

variable "terminate_instance_on_failure" {
  type        = bool
  description = "Enable if the instance should be terminated when the pipeline fails."
  default     = true
}

variable "security_group_ids" {
  type        = list(string)
  description = "The ID of the security group used when building images."
  default     = null
}

