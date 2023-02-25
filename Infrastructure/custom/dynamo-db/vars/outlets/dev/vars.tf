variable "environment" {
  type        = string
  description = "environment"
  default = "dev"
}

variable "type" {
  type        = string
  description = "type"
  default = "outlets"
}

variable "module" {
  type        = string
  description = "module"
  default = "classic-partner"
}

variable "billing_mode" {
  type        = string
  description = "billing_mode"
  default = "PAY_PER_REQUEST"
}

variable "read_capacity" {
  type        = number
  description = "read_capacity"
  default = 0.5
}

variable "write_capacity" {
  type        = number
  description = "write_capacity"
  default = 0.5
}

variable "table_class" {
  type        = string
  description = "table_class"
  default = "STANDARD"
}

variable "ttl_enabled" {
  type        = bool
  description = "ttl_enabled"
  default = true
}

variable "ttl_attribute" {
  type        = string
  description = "ttl_attribute"
  default = "TTL"
}