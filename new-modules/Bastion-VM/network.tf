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
# Ignore: AVD-GCP-0027(https://avd.aquasec.com/misconfig/avd-gcp-0027)
# Reason: The whitelisted source range is from the Google's Identity Aware Proxy. Need to allow this range to access the bastion VM.
# Ignore: AVD-GCP-0029(https://avd.aquasec.com/misconfig/avd-gcp-0029)
# Reason: Flow log enabling is optional due to high cost.

# trivy:ignore:AVD-GCP-0029
resource "google_compute_subnetwork" "bastion_subnetwork" {
  name          = join("-", ["snet", "bastion", var.environment])
  project       = var.project_name
  ip_cidr_range = var.bastion_ip_cidr_range
  region        = var.location
  network       = var.vpc_name

  dynamic "log_config" {
    for_each = var.enable_flow_logs ? [1] : []
    content {
      aggregation_interval = var.aggregation_interval
      flow_sampling        = var.flow_sampling
      metadata             = var.metadata
    }
  }
}

# trivy:ignore:AVD-GCP-0027
resource "google_compute_firewall" "allow_ssh_rule" {
  project            = var.project_name
  name               = join("-", ["fwr", "bastion-ssh-allow", var.environment])
  network            = var.vpc_name
  priority           = "100"
  source_ranges      = ["35.235.240.0/20"]
  destination_ranges = [var.bastion_ip_cidr_range]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}
