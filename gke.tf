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

module "gke-cluster" {
  source = "./new-modules/Google-Kubernetes-Engine"

  project_name                          = var.project_name
  vpc_id                                = module.vpc_network.vpc_id
  environment                           = var.environment
  cluster_location                      = var.cluster_location
  cluster_subnetwork_primary_cidr       = var.cluster_ip_cidr_range
  cluster_secondary_pods_cidr_range     = var.cluster_secondary_pods_cidr_range
  cluster_secondary_services_cidr_range = var.cluster_secondary_services_cidr_range
  master_kubernetes_version             = var.master_kubernetes_version
  default_max_pods_per_node             = var.default_max_pods_per_node
  master_cluster_ipv4_cidr              = var.master_cluster_ipv4_cidr
  master_authorized_networks_cidr       = var.master_authorized_networks_cidr
  node_pool_location                    = var.node_pool_location
  node_pool_node_count                  = var.node_pool_node_count
  node_pool_zone_locations              = var.node_pool_zone_locations
  node_pool_machine_type                = var.node_pool_machine_type
  node_pool_max_node_count              = var.node_pool_max_node_count
  node_pool_min_node_count              = var.node_pool_min_node_count
  labels                                = var.labels
  deletion_protection                   = var.cluster_deletion_protection
}

