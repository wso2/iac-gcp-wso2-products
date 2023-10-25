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

variable "project_name" {
  description = "GCP project name"
  type        = string
}

variable "project_services" {
  description = "GCP project services"
  type        = list(string)
}

variable "region" {
  description = "Deployment region"
  type        = string
}

variable "zone" {
  description = "Deployment zone"
  type        = string
}

variable "environment" {
  default     = "dev"
  description = "Deployment environment. This will be used for resource naming."
  type        = string
}

# VPC related variables

variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "vpc_subnetwork_name" {
  description = "VPC subnetwork name"
  type        = string
}

variable "ip_cidr_range" {
  description = "IP CIDR range"
  type        = string
}

variable "cluster_location" {
  description = "Cluster location"
  type        = string
}

variable "cluster_ip_cidr_range" {
  description = "Cluster IP CIDR range"
  type        = string
}

variable "cluster_secondary_pods_cidr_range" {
  description = "Cluster secondary pods CIDR range"
  type        = string
}

variable "cluster_secondary_services_cidr_range" {
  description = "Cluster secondary services CIDR range"
  type        = string
}

variable "master_kubernetes_version" {
  description = "Kubernetes version of the GKE cluster"
  type        = string
}

variable "default_max_pods_per_node" {
  description = "Maximum number of pods per node"
  type        = number
}

variable "master_cluster_ipv4_cidr" {
  description = "IP CIDR range for the master cluster"
  type        = string
}

variable "master_authorized_networks_cidr" {
  description = "IP CIDR range for the master authorized networks"
  type        = string
}

variable "node_pool_location" {
  description = "Node pool location"
  type        = string
}

variable "node_pool_node_count" {
  description = "Node pool node count"
  type        = number
}

variable "node_pool_zone_locations" {
  description = "Node pool zone locations"
  type        = list(string)
}

variable "node_pool_machine_type" {
  description = "Node pool machine type"
  type        = string
}

variable "node_pool_max_node_count" {
  description = "Node pool max node count"
  type        = number
}

variable "node_pool_min_node_count" {
  description = "Node pool min node count"
  type        = number
}

variable "labels" {
  description = "Labels"
  type        = map(string)
}

# https://registry.terraform.io/providers/hashicorp/google/4.80.0/docs/resources/sql_database_instance#database_version
variable "db_enable" {
  default     = true
  description = "Set to true to enable the creation of a MySQL database."
  type        = bool
}

variable "database_version" {
  default     = "MYSQL_8_0"
  description = "Database version"
  type        = string
}

variable "db_deletion_protection" {
  default     = true
  description = "Deletion protection. If false, database will be deleted with terraform destroy"
  type        = bool
}

variable "database_tier" {
  description = "Database tier"
  type        = string
}

variable "db_common_labels" {
  default = {
    "user" = "apim"
  }
  description = "Common labels"
  type        = map(string)
}

variable "db_availability_type" {
  description = "Availability type"
  type        = string
}

variable "db_disk_size" {
  description = "Disk size"
  type        = number
}

variable "db_disk_type" {
  description = "Disk type"
  type        = string
}

variable "db_ipv4_enabled" {
  description = "DB IPv4 enabled"
  type        = bool
}

variable "db_cidr_range" {
  description = "DB CIDR range"
  type        = string
}

variable "db_require_ssl" {
  description = "Require SSL for DB connections"
  type        = bool
}

variable "db_query_insights_enabled" {
  description = "Query insights enabled"
  type        = bool
}

variable "db_username" {
  description = "DB username"
  type        = string
}

variable "db_password" {
  description = "DB password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "DB name"
  type        = string
}

variable "db_backup_enabled" {
  description = "DB backup enabled"
  type        = bool
}

variable "db_binary_log_enabled" {
  description = "Binary logs enabled for DB. This should be true only for MySQL Regional (not Zonal) deployments"
  type        = bool
}

variable "db_retained_backups" {
  description = "DB retained backups"
  type        = number
}

variable "bastion_ip_cidr_range" {
  description = "Base IP CIDR range for the bastion subnet"
  type        = string
}

variable "bastion_vm_machine_type" {
  description = "Bastion VM machine type"
  type        = string
}

variable "bastion_vm_boot_disk_image" {
  description = "Bastion VM boot disk image"
  type        = string
  default     = "ubuntu-2204-lts"
}

variable "bastion_metadata_startup_script" {
  description = "Startup script of the bastion VM"
  type        = string
  default     = <<-EOF
    #!/bin/bash
    sudo apt update
    sudo apt-get update
    # Install Helm
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
    chmod 700 get_helm.sh
    ./get_helm.sh
    # Install kubectl
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
    sudo apt update
    sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin kubectl
    export USE_GKE_GCLOUD_AUTH_PLUGIN=True
    # Install Kustomize
    sudo snap install kustomize
    # Install Kapp
    wget -O- https://carvel.dev/install.sh > install.sh
    sudo bash install.sh
    # Install yq and jq
    sudo snap install yq
    sudo apt-get install jq
    # Intsall Unzip
    sudo apt install unzip
    # Install mysql client
    sudo apt install mysql-client-8.0 -y
    EOF
}

variable "alert_email_address" {
  description = "Alert email address"
  type        = string
}

variable "alert_channel_name" {
  description = "Channel name for alert notifications"
  type        = string
  default     = "primary"
}


# Alert policy variables
# Container CPU alerts
variable "container_cpu_alert_name" {
  description = "Container CPU alert name"
  type        = string
}

variable "container_cpu_alert_duration" {
  description = "Container CPU alert duration"
  type        = string
}

variable "container_cpu_alert_threshold_value" {
  description = "Container CPU alert threshold value"
  type        = number
}

variable "container_cpu_alert_renotify_interval" {
  description = "Container CPU alert renotify interval"
  type        = string
}

# Container memory alerts
variable "container_memory_alert_name" {
  description = "Container memory alert name"
  type        = string
}

variable "container_memory_alert_duration" {
  description = "Container memory alert duration"
  type        = string
}

variable "container_memory_alert_threshold_value" {
  description = "Container memory alert threshold value"
  type        = number
}

variable "container_memory_alert_renotify_interval" {
  description = "Container memory alert renotify interval"
  type        = string
}

# Container restart alerts
variable "container_restart_alert_name" {
  description = "Container restart alert name"
  type        = string
}

variable "container_restart_alert_duration" {
  description = "Container restart alert duration"
  type        = string
}

variable "container_restart_alert_threshold_value" {
  description = "Container restart alert threshold value"
  type        = number
}

variable "container_restart_alert_renotify_interval" {
  description = "Container restart alert renotify interval"
  type        = string
}

variable "container_restart_alert_alignment_period" {
  description = "Container restart alert alignment period"
  type        = string
}

# Node CPU alerts
variable "node_cpu_alert_name" {
  description = "Node CPU alert name"
  type        = string
}

variable "node_cpu_alert_duration" {
  description = "Node CPU alert duration"
  type        = string
}

variable "node_cpu_alert_threshold_value" {
  description = "Node CPU alert threshold value"
  type        = number
}

variable "node_cpu_alert_renotify_interval" {
  description = "Node CPU alert renotify interval"
  type        = string
}

# Node memory alerts
variable "node_memory_alert_name" {
  description = "Node memory alert name"
  type        = string
}

variable "node_memory_alert_duration" {
  description = "Node memory alert duration"
  type        = string
}

variable "node_memory_alert_threshold_value" {
  description = "Node memory alert threshold value"
  type        = number
}

variable "node_memory_alert_renotify_interval" {
  description = "Node memory alert renotify interval"
  type        = string
}

variable "filestore_tier" {
  description = "Filestore tier"
  type        = string
}

variable "filestore_capacity_gb" {
  description = "Filestore capacity in GB"
  type        = number
}

variable "filestore_location" {
  description = "Filestore location"
  type        = string
}

variable "filestore_name" {
  description = "File share name"
  type        = string
}
