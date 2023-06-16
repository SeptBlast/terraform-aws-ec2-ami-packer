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

variable "infrastructure_configuration" {
  type        = string
  description = "The ARN of the infrastructure configuration to use with this pipeline."
  default     = null
}

variable "image_recipe" {
  type        = string
  description = "The name of the recipe.  Defaults to the name of the pipeline."
  default     = null
}

variable "distribution_configuration" {
  type        = string
  description = "The ARN of the distribution configuration to use with this pipeline."
  default     = null
  
}
