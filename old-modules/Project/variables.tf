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
  description = "The project name to create"
  type        = string
}
variable "environment" {
  description = "The environment that is getting created"
  type        = string
}
variable "folder_id" {
  description = "The folder ID of the organization"
  type        = string
}
variable "billing_account_id" {
  description = "The billing account ID of the organization"
  type        = string
}
variable "labels" {
  description = "The labels to add to the project"
  type        = map(string)
}
