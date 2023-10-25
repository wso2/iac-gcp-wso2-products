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
# Ignore: AVD-GCP-0013(https://avd.aquasec.com/misconfig/avd-gcp-0013)
# Reason: DNSSEC can be enabled based on the requirement. This is disabled by default.

# trivy:ignore:AVD-GCP-0013
resource "google_dns_managed_zone" "dns_managed_zone" {
  name        = join("-", ["dnsz", var.project_name, var.dns_zone_name])
  dns_name    = var.dns_name
  description = join(" ", ["The DNS zone for", var.dns_name])
  project     = var.project_name
  labels      = var.labels
  dnssec_config {
    state = var.dnssec_state
  }
}
