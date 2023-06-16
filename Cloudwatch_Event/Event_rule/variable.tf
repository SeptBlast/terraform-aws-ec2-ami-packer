
variable "name" {
  type        = string
  description = "Name of the EventBridge rule"
}

variable "description" {
  type        = string
  description = "Description of the EventBridge rule"
}

variable "event_pattern" {
  type        = string
  description = "Event pattern of the EventBridge rule"
}

variable "event_bus_name" { 
  type        = string 
  description = "Name of the EventBus" 
  default     = "default"
}

variable "tags" {
  type        = map(string)
  description = "The tags applied to the rule."
  default     = {}
}