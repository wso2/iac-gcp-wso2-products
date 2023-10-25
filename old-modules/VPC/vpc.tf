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

resource "google_compute_network" "vpc_network" {
  name                    = join("-", ["vpc", var.vpc_name])
  project                 = var.project_name
  description             = join(" ", ["VPC for", var.vpc_name])
  auto_create_subnetworks = false
  mtu                     = 1460
}
