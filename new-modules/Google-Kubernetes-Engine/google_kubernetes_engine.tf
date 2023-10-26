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
# Ignore: AVD-GCP-0051 (https://avd.aquasec.com/misconfig/avd-gcp-0051)
# Reason: The cluster labels(tags) are added via a required variable in the module. When using the module, the labels are added from the implementation.
# Ignore: AVD-GCP-0056 (https://avd.aquasec.com/misconfig/avd-gcp-0056)
# Reason: Network-Policies are enabled from the Helm level. Not when provisioning the cluster.
# Ignore: AVD-GCP-0058 (https://avd.aquasec.com/misconfig/avd-gcp-0058)
# Reason: Automatic updates are disabled for the cluster and updates are done manually with intention.

# trivy:ignore:AVD-GCP-0051
# trivy:ignore:AVD-GCP-0056
resource "google_container_cluster" "cluster" {
  name               = join("-", ["gke", var.project_name, var.cluster_location, var.environment])
  project            = var.project_name
  description        = join("", ["GKE cluster for ", var.project_name, " located in ", var.cluster_location, " ENV: ", var.environment])
  min_master_version = var.master_kubernetes_version
  deletion_protection = var.deletion_protection

  # Regional cluster
  location                  = var.cluster_location
  enable_kubernetes_alpha   = false
  enable_l4_ilb_subsetting  = false
  enable_tpu                = false
  default_max_pods_per_node = var.default_max_pods_per_node

  # Setting the value to 1 as it will be the minimum number to remove the default node pool
  initial_node_count       = 1
  remove_default_node_pool = true

  # network configuration
  network    = var.vpc_id
  subnetwork = google_compute_subnetwork.cluster_subnetwork.name
  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = var.master_cluster_ipv4_cidr
  }
  ip_allocation_policy {
    cluster_secondary_range_name  = "cluster-pods"
    services_secondary_range_name = "cluster-services"
  }
  default_snat_status {
    disabled = false
  }
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = var.master_authorized_networks_cidr
      display_name = " Authorized network to access CP"
    }
  }
  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }
  workload_identity_config {
    workload_pool = join(".", [var.project_name, "svc.id.goog"])
  }
  release_channel {
    channel = "UNSPECIFIED"
  }
  cluster_autoscaling {
    enabled = false
  }
  addons_config {
    horizontal_pod_autoscaling {
      disabled = false
    }
    http_load_balancing {
      disabled = false
    }
    gcp_filestore_csi_driver_config {
      enabled = true
    }
    gke_backup_agent_config {
      enabled = true
    }
    gce_persistent_disk_csi_driver_config {
      enabled = true
    }
    network_policy_config {
      disabled = true
    }
    dns_cache_config {
      enabled = false
    }
  }
  vertical_pod_autoscaling {
    enabled = true
  }
  confidential_nodes {
    enabled = false
  }
  resource_labels = var.labels
  logging_config {
    enable_components = [
      "SYSTEM_COMPONENTS",
      "WORKLOADS"
    ]
  }

  depends_on = [
    google_compute_subnetwork.cluster_subnetwork,
    google_service_account.cluster_service_account
  ]
}

# trivy:ignore:AVD-GCP-0058
resource "google_container_node_pool" "node_pool" {
  name           = join("", ["gkenpprimary"])
  project        = var.project_name
  location       = var.node_pool_location
  cluster        = google_container_cluster.cluster.id
  node_count     = var.node_pool_node_count
  node_locations = var.node_pool_zone_locations
  version        = var.master_kubernetes_version

  node_config {
    preemptible     = false
    machine_type    = var.node_pool_machine_type
    service_account = google_service_account.cluster_service_account.email
    image_type      = "COS_CONTAINERD"
    local_ssd_count = 0
    disk_size_gb    = 100
    disk_type       = "pd-balanced"
    metadata = {
      disable-legacy-endpoints = true
    }
    workload_metadata_config {
      mode = "GKE_METADATA"
    }
    labels = var.labels
  }
  management {
    auto_repair  = true
    auto_upgrade = false
  }
  network_config {
    enable_private_nodes = true
    create_pod_range     = false
    pod_range            = "cluster-pods"
  }
  autoscaling {
    max_node_count  = var.node_pool_max_node_count
    min_node_count  = var.node_pool_min_node_count
    location_policy = "BALANCED"
  }
  upgrade_settings {
    max_surge       = 1
    max_unavailable = 0
    strategy        = "SURGE"
  }

  depends_on = [
    google_service_account.cluster_service_account
  ]
}
