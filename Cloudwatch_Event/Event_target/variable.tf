
variable "dead_letter_arn" {
  type        = string
  description = "Dead letter ARN for the targets"
}

variable "arn" {
  type        = string
  description = "ARN for the targets"
}

variable "target_id" {
  type        = string
  description = "id of the target"
}

variable "maximum_event_age_in_seconds" {
  type        = number
  description = "Maximum event age in seconds for the targets"
}

variable "maximum_retry_attempts" {
  type        = number
  description = "Maximum retry attempts for the targets"
}


variable "rule" { 
  type = string 
  description = "rule of the eventwatch name"
}
variable "role_arn" { 
  type = string 
  description = "role arn of the iam"
}