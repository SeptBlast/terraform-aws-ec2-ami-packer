variable "aws_region" {
    default     = "us-west-2"
}

variable "key_name" {
    type        = string
    default     = ""
}

variable "security_group_ids" {
    type        = list(string)
    default     = []
}

variable "subnet_id" {
  type          = string
  description   = "Subnet IDs" 
  default       = "" 
}

variable "iam_instance_role" {
    type        = string 
    description = "iam role name"
    default     = ""
}