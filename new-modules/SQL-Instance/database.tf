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
      private_network = var.vpc_network
      require_ssl     = var.require_ssl

      dynamic "authorized_networks" {
        for_each = var.db_ipv4_enabled ? [1] : []
        content {
          name  = "internet"
          value = "0.0.0.0/0"
        }
      }
    }

    insights_config {
      query_insights_enabled = var.query_insights_enabled
    }

    backup_configuration {
      enabled                        = var.db_backup_enabled
      binary_log_enabled             = var.db_binary_log_enabled
      transaction_log_retention_days = 3
      dynamic "backup_retention_settings" {
        for_each = var.db_backup_enabled ? [1] : []

        content {
          retained_backups = var.db_retained_backups
        }
      }
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
