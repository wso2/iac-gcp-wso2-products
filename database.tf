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

resource "google_sql_database_instance" "rds_instance" {
  depends_on          = [google_service_networking_connection.rds_network_connection]
  name                = join("-", ["rds", var.project_name, var.environment, var.region])
  database_version    = var.database_version
  deletion_protection = var.deletion_protection

  settings {
    tier              = var.database_tier
    user_labels       = var.common_labels
    availability_type = var.availability_type
    disk_size         = var.disk_size
    disk_type         = var.disk_type

    ip_configuration {
      ipv4_enabled    = var.db_ipv4_enabled
      private_network = module.vpc_network.vpc_id
      require_ssl     = var.require_ssl
    }

    insights_config {
      query_insights_enabled = var.query_insights_enabled
    }
  }
}

resource "google_sql_user" "rds_user" {
  name     = var.db_username
  instance = google_sql_database_instance.rds_instance.name
  password = var.db_password
}

resource "google_sql_database" "database" {
  name     = var.db_name
  instance = google_sql_database_instance.rds_instance.name
}

# Database VPC/subnet configurations
resource "google_compute_global_address" "rds_private_ip" {
  name          = "rds-private-ip"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = module.vpc_network.vpc_id
}

resource "google_service_networking_connection" "rds_network_connection" {
  network                 = module.vpc_network.vpc_id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.rds_private_ip.name]
}

resource "google_compute_network_peering_routes_config" "rds_peering_config" {
  peering              = google_service_networking_connection.rds_network_connection.peering
  network              = module.vpc_network.vpc_id
  import_custom_routes = true
  export_custom_routes = true
}