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
# Ignore: AVD-GCP-0029(https://avd.aquasec.com/misconfig/avd-gcp-0029)
# Reason: Flow log enabling is optional due to high cost.

# trivy:ignore:AVD-GCP-0029
resource "google_compute_subnetwork" "vpc_subnetwork" {
  name          = join("-", ["snet", var.vpc_subnetwork_name, var.environment])
  project       = var.project_id
  ip_cidr_range = var.ip_cidr_range
  region        = var.region
  network       = var.vpc_id
  description   = join(" ", ["Subnetwork of", var.vpc_id, " in ", var.region, ])

  dynamic "log_config" {
    count = var.enable_flow_logs ? 1 : 0
    content {
      aggregation_interval = var.aggregation_interval
      flow_sampling        = var.flow_sampling
      metadata             = var.metadata
    }
  }
}
