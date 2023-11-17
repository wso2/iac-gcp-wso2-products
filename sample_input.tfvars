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

region      = "us-central1"
zone        = "us-central1-a"
environment = "dev"
project_services = [
  "compute.googleapis.com",
  "container.googleapis.com",
  "containerregistry.googleapis.com",
  "deploymentmanager.googleapis.com",
  "dns.googleapis.com",
  "logging.googleapis.com",
  "monitoring.googleapis.com",
  "oslogin.googleapis.com",
  "pubsub.googleapis.com",
  "replicapool.googleapis.com",
  "replicapoolupdater.googleapis.com",
  "resourceviews.googleapis.com",
  "servicemanagement.googleapis.com",
  "servicenetworking.googleapis.com",
  "sql-component.googleapis.com",
  "sqladmin.googleapis.com",
  "storage-api.googleapis.com",
]

vpc_name            = "vpc"
vpc_subnetwork_name = "vpc-subnet"
ip_cidr_range       = "10.128.0.0/16"

cluster_location                      = "us-central1"
cluster_ip_cidr_range                 = "10.128.10.0/24"
cluster_secondary_pods_cidr_range     = "10.128.11.0/24"
cluster_secondary_services_cidr_range = "10.128.12.0/24"
master_kubernetes_version             = "1.26.9-gke.1437000"
default_max_pods_per_node             = 25
master_cluster_ipv4_cidr              = "10.128.1.0/28"
master_authorized_networks_cidr       = "10.128.5.0/24"

node_pool_location   = "us-central1"
node_pool_node_count = 2
node_pool_zone_locations = [
  "us-central1-a",
  "us-central1-b",
]
node_pool_machine_type   = "e2-standard-4"
node_pool_max_node_count = 3
node_pool_min_node_count = 1
labels                   = {}

database_tier             = "db-n1-standard-4"
db_availability_type      = "REGIONAL"
db_disk_size              = 10
db_disk_type              = "PD_SSD"
db_ipv4_enabled           = false
db_cidr_range             = "10.128.20.0/24"
db_require_ssl            = false
db_query_insights_enabled = true
db_username               = "wso2carbon"
db_password               = "wso2carbon"
db_name                   = "apimdb"
database_version          = "MYSQL_8_0"
db_deletion_protection    = false
db_backup_enabled         = true
db_binary_log_enabled     = true
db_retained_backups       = 3

bastion_ip_cidr_range      = "10.128.5.0/24"
bastion_vm_machine_type    = "e2-small"
bastion_vm_boot_disk_image = "ubuntu-2204-lts"

# Alerting policies
# Container CPU
container_cpu_alert_name            = "cpu-usage"
container_cpu_alert_duration        = "60s"
container_cpu_alert_threshold_value = 0.75

# Container Memory
container_memory_alert_name            = "memory-usage"
container_memory_alert_duration        = "60s"
container_memory_alert_threshold_value = 0.75

# Container restart
container_restart_alert_name             = "restart-count"
container_restart_alert_duration         = "60s"
container_restart_alert_threshold_value  = 0.75
container_restart_alert_alignment_period = "120s"

# Node CPU
node_cpu_alert_name            = "cpu-usage"
node_cpu_alert_duration        = "60s"
node_cpu_alert_threshold_value = 0.75

# Node memory
node_memory_alert_name            = "memory-usage"
node_memory_alert_duration        = "60s"
node_memory_alert_threshold_value = 0.75

# File Store
filestore_name        = "store"
filestore_tier        = "BASIC_HDD"
filestore_capacity_gb = 1024
filestore_location    = "us-central1-b"

# Secrets
secrets = [
  {
    name : "secret"
    secret_data : "wso2carbon"
  }
]
