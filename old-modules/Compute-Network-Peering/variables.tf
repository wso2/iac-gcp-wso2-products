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

variable "peering_name" {
  description = "The network peering name"
  type        = string
}
variable "main_network" {
  description = "The main network to be peered"
  type        = string
}
variable "peer_network" {
  description = "The peering network"
  type        = string
}
