variable "service_name" {
  type        = string
  description = "service name"
}

variable "redundancy" {
  type        = number
  description = "redaudancy count for subnets"
  validation {
    condition     = var.redundancy > 0 && var.redundancy <= 3
    error_message = "redundancy must be 1, 2 or 3"
  }
}
