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
  description = "The project name of the Private DNS managed  Zone"
  type        = string
}
variable "dns_name" {
  description = "The DNS domain name of the Private DNS managed Zone"
  type        = string
}
variable "labels" {
  description = "The labels of the Private DNS managed Zone"
  type        = map(string)
}
variable "dns_zone_name" {
  description = "The DNS managed zone name"
  type        = string
}
variable "vpc_id" {
  description = "The VPN ID of the VPC network"
  type        = string
}
