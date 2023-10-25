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
resource "google_compute_subnetwork" "cluster_subnetwork" {
  name                     = join("-", ["snet", "gke-cluster", var.environment])
  project                  = var.project_name
  ip_cidr_range            = var.cluster_subnetwork_primary_cidr
  region                   = var.cluster_location
  network                  = var.vpc_id
  private_ip_google_access = true
  secondary_ip_range {
    range_name    = "cluster-pods"
    ip_cidr_range = var.cluster_secondary_pods_cidr_range
  }
  secondary_ip_range {
    range_name    = "cluster-services"
    ip_cidr_range = var.cluster_secondary_services_cidr_range
  }

  dynamic "log_config" {
    for_each = var.enable_flow_logs ? [1] : []
    content {
      aggregation_interval = var.aggregation_interval
      flow_sampling        = var.flow_sampling
      metadata             = var.metadata
    }
  }
}
