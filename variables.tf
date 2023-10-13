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

variable "project_services" {
  description = "GCP project services"
  type        = list(string)
}

variable "region" {
  description = "Deployment region"
  type        = string
}

variable "zone" {
  description = "Deployment zone"
  type        = string
}

variable "environment" {
  default     = "dev"
  description = "Deployment environment. This will be used for resource naming."
  type        = string
}

# VPC related variables

variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "vpc_subnetwork_name" {
  description = "VPC subnetwork name"
  type        = string
}

variable "ip_cidr_range" {
  description = "IP CIDR range"
  type        = string
}

variable "cluster_location" {
  description = "Cluster location"
  type        = string
}

variable "cluster_ip_cidr_range" {
  description = "Cluster IP CIDR range"
  type        = string
}

variable "cluster_secondary_pods_cidr_range" {
  description = "Cluster secondary pods CIDR range"
  type        = string
}

variable "cluster_secondary_services_cidr_range" {
  description = "Cluster secondary services CIDR range"
  type        = string
}

variable "master_kubernetes_version" {
  description = "Kubernetes version of the GKE cluster"
  type        = string
}

variable "default_max_pods_per_node" {
  description = "Maximum number of pods per node"
  type        = number
}

variable "master_cluster_ipv4_cidr" {
  description = "IP CIDR range for the master cluster"
  type        = string
}

variable "master_authorized_networks_cidr" {
  description = "IP CIDR range for the master authorized networks"
  type        = string
}

variable "node_pool_location" {
  description = "Node pool location"
  type        = string
}

variable "node_pool_node_count" {
  description = "Node pool node count"
  type        = number
}

variable "node_pool_zone_locations" {
  description = "Node pool zone locations"
  type        = list(string)
}

variable "node_pool_machine_type" {
  description = "Node pool machine type"
  type        = string
}

variable "node_pool_max_node_count" {
  description = "Node pool max node count"
  type        = number
}

variable "node_pool_min_node_count" {
  description = "Node pool min node count"
  type        = number
}

variable "labels" {
  description = "Labels"
  type        = map(string)
}

# https://registry.terraform.io/providers/hashicorp/google/4.80.0/docs/resources/sql_database_instance#database_version
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

variable "db_private_network" {
  description = "DB private network"
  type        = string
}

variable "db_subnetwork_name" {
  description = "DB subnetwork name"
  type        = string
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

variable "bastion_ip_cidr_range" {
  description = "Base IP CIDR range for the bastion subnet"
  type        = string
}

variable "bastion_vm_machine_type" {
  description = "Bastion VM machine type"
  type        = string
}

variable "bastion_vm_boot_disk_image" {
  description = "Bastion VM boot disk image"
  type        = string
  default     = "ubuntu-2204-lts"
}