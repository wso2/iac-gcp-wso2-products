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
  description = "The project name of the firewall rule"
  type        = string
}
variable "rule_name" {
  description = "The firewall rule name"
  type        = string
}
variable "environment" {
  description = "The environment of the firewall rule"
  type        = string
}
variable "vpc_id" {
  description = "The VPN ID of the firewall rule"
  type        = string
}
variable "allow_rules" {
  description = "The allow rules"
  type = list(object({
    protocol = string
    ports    = list(string)
  }))
  default = []
}
variable "deny_rules" {
  description = "The deny rules"
  type = list(object({
    protocol = string
    ports    = list(string)
  }))
  default = []
}
variable "priority" {
  description = "The priority of the rule"
  type        = number
}
variable "direction" {
  description = "The direction of the rule"
  type        = string
  default     = "INGRESS"
}
variable "source_ranges" {
  description = "The source ranges"
  type        = list(string)
}
variable "destination_ranges" {
  description = "The destination ranges"
  type        = list(string)
}
