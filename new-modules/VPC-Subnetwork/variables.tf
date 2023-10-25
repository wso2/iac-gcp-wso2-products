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

variable "vpc_subnetwork_name" {
  description = "The name of the VPC subnetwork"
  type        = string
}
variable "environment" {
  description = "The environment of the VPC subnetwork"
  type        = string
}
variable "ip_cidr_range" {
  description = "The IP CIDR range of the VPC subnetwork"
  type        = string
}
variable "region" {
  description = "The region of the VPC subnetwork"
  type        = string
}
variable "vpc_id" {
  description = "The ID of the VPC network"
  type        = string
}
variable "project_id" {
  description = "The project ID of the VPC network"
  type        = string
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
