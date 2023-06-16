#image component var 
variable "data" {
  type        = string
  description = "Inline YAML string with data of the component. Exactly one of data and uri can be specified."
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

variable "component_version" {
  type        = string
  description = "The version of the component."
  default     = null
}

variable "os_flavor" {
  type        = string
  description = "OS flavor in use"
  default     = null
}