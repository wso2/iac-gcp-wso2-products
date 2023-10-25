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
  description = "The project name to add the DNS C Record"
  type        = string
}
variable "c_name_record_name" {
  description = "The CNAME record name"
  type        = string
}
variable "managed_zone_name" {
  description = "The managed zone name of the DNS CName record"
  type        = string
}
variable "ttl" {
  description = "The time to live value of the DNS CName record"
  type        = string
}
variable "rrdatas" {
  type        = list(string)
  description = "List of IPv4 Addresses of the DNS CName Record"
}
