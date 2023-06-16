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

variable "ami_description" {
  type        = string
  description = "The description applied to the distributed AMI."
  default     = null  
}

variable "ami_name" {
  type        = string
  description = "The name of the distributed AMI.  Defaults to the name of the pipeline appended with \"-{{ imagebuilder:buildDate }}\"."
  default     = null
}

variable "ami_region" {
  type        = string
  description = "A list of regions where the AMI will be distributed.  Defaults to current region."
  default     = null
}

variable "ami_tags" {
  type        = map(string)
  description = "The tags for the distributed AMI."
  default     = {}
}

variable "user_ids" {
  type        = list(string)
  description = "set of aws account identifiers to assign"
  default     = []
}

variable "container_description" {
  type        = string
  description = "The description applied to the container."
  default     = null 
}

variable "container_tags" {
  type        = list(string)
  description = "The tags for the distributed container."
  default     = []
}

variable "repository_name" {
  type        = string
  description = "Repository name for container"
  default     = null
}

