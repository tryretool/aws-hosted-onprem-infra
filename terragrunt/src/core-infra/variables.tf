variable "vpc_name" {
  type = string
}

variable "public_subnet_names" {
  type = list(any)
}

variable "private_subnet_names" {
  type = list(any)
}

// variable "aws_region" {
//   type = string
// }

// variable "client_name" {
//   type = string
// }

// variable "cluster_version" {
//   type = number
// }

// variable "cluster_endpoint_private_access" {
//   type        = bool
//   default     = true
//   description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled"
// }

// variable "cluster_endpoint_public_access" {
//   type        = bool
//   default     = false
//   description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled"
// }

