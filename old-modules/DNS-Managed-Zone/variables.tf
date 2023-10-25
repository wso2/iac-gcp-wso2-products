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
  description = "The project name of the DNS Managed Zone"
  type        = string
}
variable "dns_zone_name" {
  description = "The Managed DNS Zone name"
  type        = string
}
variable "dns_name" {
  description = "The DNS domain name of the Private DNS Zone"
  type        = string
}
variable "dnssec_state" {
  description = "The state of DNSSEC"
  type        = string
  default     = "off"
}
variable "labels" {
  description = "The labels to add to the DNS Managed Zone"
  type        = map(string)
}
