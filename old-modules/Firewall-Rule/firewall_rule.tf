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

resource "google_compute_firewall" "rule" {
  project            = var.project_name
  name               = join("-", ["fwr", var.rule_name, var.environment])
  network            = var.vpc_id
  priority           = var.priority
  direction          = var.direction
  source_ranges      = var.source_ranges
  destination_ranges = var.destination_ranges

  dynamic "allow" {
    for_each = var.allow_rules
    content {
      protocol = allow.value.protocol
      ports    = allow.value.ports
    }
  }
  dynamic "deny" {
    for_each = var.deny_rules
    content {
      protocol = deny.value.protocol
      ports    = deny.value.ports
    }
  }
}
