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

output "vpc_id" {
  value      = google_compute_network.vpc_network.id
  depends_on = [google_compute_network.vpc_network]
}
output "vpc_name" {
  value      = google_compute_network.vpc_network.name
  depends_on = [google_compute_network.vpc_network]
}
output "vpc_network_gateway_ipv4" {
  value      = google_compute_network.vpc_network.gateway_ipv4
  depends_on = [google_compute_network.vpc_network]
}
output "vpc_self_link" {
  value      = google_compute_network.vpc_network.self_link
  depends_on = [google_compute_network.vpc_network]
}
