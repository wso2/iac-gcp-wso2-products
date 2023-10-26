variable "project_id" {
  description = "The ID of the project"
  type        = string
}

variable "secret_id" {
  default     = "wso2am"
  description = "The secret ID"
  type        = string
}

variable "labels" {
  default     = {}
  description = "Labels"
  type        = map(string)
}

variable "annotations" {
  default     = {}
  description = "Annotations"
  type        = map(string)
}

variable "replication_mode" {
  default     = "auto"
  description = "Replication mode: 'auto' or 'user_managed'"
  type        = string
}

variable "replica_locations" {
  default = []
  description = "List of replica locations for user_managed replication mode"
  type        = list(string)
}

variable "is_secret_data_base64" {
  description = "Flag indicating whether secret data is base64 encoded or not."
  type        = bool
  default     = false
}

variable "deletion_policy" {
  description = "The deletion policy for the secret."
  type        = string
  default     = "DELETE"
}

variable "secret_data" {
  description = "The secret data to be stored."
  type        = string
}
