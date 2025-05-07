variable "app" {
  type = string
}

variable "dependencies" {
  default     = []
  description = "This can be used to define dependencies between any two stacks within an app"
  type        = set(string)
}

variable "description" {
  default     = "Managed by Terraform"
  description = "A description of the stack"
  type        = string
}

variable "env" {
  description = "The AWS environment (account/region) where this stack will be deployed"

  type = object({
    account = string // The AWS account ID for this environment
    region  = string // The AWS region for this environment
  })
}

variable "id" {
  description = "The construct ID of this stack"
  type        = string
}

variable "parameters" {
  default     = {}
  description = "Custom values that are supplied at deployment time"
  type        = map(string)
}

variable "stack_name" {
  default     = ""
  description = "Name to deploy the stack with"
  type        = string
}

variable "tags" {
  default     = {}
  description = "Stack tags that will be applied to all the taggable resources and the stack itself"
  type        = map(string)
}

variable "termination_protection" {
  default     = false
  description = "Whether to enable termination protection for this stack"
  type        = bool
}
