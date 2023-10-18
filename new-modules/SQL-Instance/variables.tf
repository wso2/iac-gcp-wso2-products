# -------------------------------------------------------------------------------------
#
# Copyright (c) 2023, WSO2 LLC. (http://www.wso2.com). All Rights Reserved.
#
# This software is the property of WSO2 LLC. and its suppliers, if any.
# Dissemination of any information or reproduction of any material contained
# herein in any form is strictly forbidden, unless permitted by WSO2 expressly.
# You may not alter or remove any copyright or other notice from copies of this content.
#
# --------------------------------------------------------------------------------------

variable "project_name" {
  description = "GCP project name"
  type        = string
}

variable "region" {
  description = "Deployment region"
  type        = string
}

variable "environment" {
  default     = "dev"
  description = "Deployment environment. This will be used for resource naming."
  type        = string
}

variable "vpc_network" {
  description = "VPC network name"
  type        = string
}

variable "database_version" {
  default     = "MYSQL_8_0"
  description = "Database version"
  type        = string
}

variable "deletion_protection" {
  default     = true
  description = "Deletion protection. If false, database will be deleted with terraform destroy"
  type        = bool
}

variable "database_tier" {
  description = "Database tier"
  type        = string
}

variable "common_labels" {
  default = {
    "user" = "apim"
  }
  description = "Common labels"
  type        = map(string)
}

variable "availability_type" {
  description = "Availability type"
  type        = string
}

variable "disk_size" {
  description = "Disk size"
  type        = number
}

variable "disk_type" {
  description = "Disk type"
  type        = string
}

variable "db_ipv4_enabled" {
  description = "DB IPv4 enabled"
  type        = bool
}

variable "db_cidr_range" {
  description = "DB CIDR range"
  type        = string
}

variable "require_ssl" {
  description = "Require SSL for DB connections"
  type        = bool
}

variable "query_insights_enabled" {
  description = "Query insights enabled"
  type        = bool
}

variable "db_username" {
  description = "DB username"
  type        = string
}

variable "db_password" {
  description = "DB password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "DB name"
  type        = string
}

variable "db_backup_enabled" {
  description = "DB backup enabled"
  type        = bool
}

variable "db_binary_log_enabled" {
  description = "Binary logs enabled for DB. This should be true only for MySQL Regional (not Zonal) deployments"
  type        = bool
}

variable "db_retained_backups" {
  description = "DB retained backups"
  type        = number
}