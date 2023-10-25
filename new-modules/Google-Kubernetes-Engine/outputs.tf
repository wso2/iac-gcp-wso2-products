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

output "gke_service_account_id" {
  value      = google_service_account.cluster_service_account.id
  depends_on = [google_service_account.cluster_service_account]
}
output "gke_service_account_email" {
  value      = google_service_account.cluster_service_account.email
  depends_on = [google_service_account.cluster_service_account]
}
output "gke_node_pool_id" {
  value      = google_container_node_pool.node_pool.id
  depends_on = [google_container_node_pool.node_pool]
}
output "gke_cluster_id" {
  value      = google_container_cluster.cluster.id
  depends_on = [google_container_cluster.cluster]
}
output "gke_cluster_name" {
  value      = google_container_cluster.cluster.name
  depends_on = [google_container_cluster.cluster]
}
output "gke_cluster_subnet_id" {
  value      = google_compute_subnetwork.cluster_subnetwork.id
  depends_on = [google_compute_subnetwork.cluster_subnetwork]
}
output "gke_cluster_subnet_name" {
  value      = google_compute_subnetwork.cluster_subnetwork.name
  depends_on = [google_compute_subnetwork.cluster_subnetwork]
}
output "gke_cluster_subnet_ip_cidr_range" {
  value      = google_compute_subnetwork.cluster_subnetwork.ip_cidr_range
  depends_on = [google_compute_subnetwork.cluster_subnetwork]
}
