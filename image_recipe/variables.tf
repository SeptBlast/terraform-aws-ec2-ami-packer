
variable "working_directory" {
  type        = string
  description = "working directory path"
  default     = "/tmp"
}

variable "device_name" {
  type    = string
  default = "/dev/xvda"
}

variable "system_manager_agent_uninstall" {
  type    = bool
  default = false
}

variable "component_arns" {
  type = list(object({
    arn = string
  }))
  description = "The ordered components of the recipe"
  default     = []
}

variable "parent_image" {
  type        = string
  description = "Image that the recipe should start with."
  default     = null
}

variable "volume_size" {
  type        = number
  description = "GiB of the volume size"
  default     = null
}

variable "volume_type" {
  type        = string
  description = "type of the volume"
  default     = null
}

variable "iops" {
  type        = number
  description = "Number of I/O operation to provision"
  default     = null
}

variable "throughput" {
  type        = number
  description = "Number of throughput only for gp3"
  default     = null
}

variable "recipe_version" {
  type        = string
  description = "Version of the recipe"
  default     = null
}


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

variable "platform" {
  type        = string
  description = "The platform of the component."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "The tags applied to the component."
  default     = {}
}

variable "delete_on_termination" {
  type        = bool
  description = "Delete on termination to the volume."
  default     = true
}
