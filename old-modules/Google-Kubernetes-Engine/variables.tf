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
  description = "The project name of the GKE cluster"
  type        = string
}
variable "environment" {
  description = "The environment name"
  type        = string
}
variable "cluster_location" {
  description = "The location name"
  type        = string
}
variable "vpc_id" {
  description = "The VPC id of the cluster"
  type        = string
}
variable "master_cluster_ipv4_cidr" {
  description = "The master cluster ipv4 cidr"
  type        = string
}
variable "cluster_subnetwork_primary_cidr" {
  description = "The cluster subnet cidr range"
  type        = string
}
variable "cluster_secondary_pods_cidr_range" {
  description = "The cluster secondry pods cidr range"
  type        = string
}
variable "cluster_secondary_services_cidr_range" {
  description = "The cluster secondry services cidr range"
  type        = string
}
variable "node_pool_location" {
  description = "The node pool location"
  type        = string
}
variable "node_pool_zone_locations" {
  description = "The node pool node zone locations"
  type        = list(string)
}
variable "node_pool_node_count" {
  description = "The node pool node count"
  type        = number
}
variable "node_pool_machine_type" {
  description = "The node pool machine type"
  type        = string
}
variable "node_pool_min_node_count" {
  description = "The node pool min node count"
  type        = number
}
variable "node_pool_max_node_count" {
  description = "The node pool max node count"
  type        = number
}
variable "default_max_pods_per_node" {
  description = "The default max pods per node"
  type        = number
}
variable "master_authorized_networks_cidr" {
  description = "The master authorized networks cidr"
  type        = string
}
variable "master_kubernetes_version" {
  description = "The master Kubernetes version"
  type        = string
}
variable "labels" {
  description = "The labels for the cluster"
  type        = map(string)
}
variable "enable_flow_logs" {
  description = "Enable flow logs of the VPC subnetwork"
  type        = bool
  default     = false
}
variable "aggregation_interval" {
  description = "Aggregation interval of the VPC subnetwork logs"
  type        = string
  default     = "INTERVAL_10_MIN"
}
variable "flow_sampling" {
  description = "Flow sampling of the VPC subnetwork logs"
  type        = number
  default     = 0.5
}
variable "metadata" {
  description = "Metadata of the VPC subnetwork logs"
  type        = string
  default     = "INCLUDE_ALL_METADATA"
}
