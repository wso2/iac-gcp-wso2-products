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

module "sql_instance" {
  # count                  = var.db_enable ? 1 : 0
  source                 = "./new-modules/SQL-Instance"
  project_name           = var.project_name
  region                 = var.region
  environment            = var.environment
  vpc_network            = module.vpc_network.vpc_id
  database_version       = var.database_version
  database_tier          = var.database_tier
  deletion_protection    = var.db_deletion_protection
  common_labels          = var.db_common_labels
  availability_type      = var.db_availability_type
  disk_size              = var.db_disk_size
  disk_type              = var.db_disk_type
  db_ipv4_enabled        = var.db_ipv4_enabled
  db_cidr_range          = var.db_cidr_range
  require_ssl            = var.db_require_ssl
  query_insights_enabled = var.db_query_insights_enabled
  db_username            = var.db_username
  db_password            = var.db_password
  db_name                = var.db_name
  db_backup_enabled      = var.db_backup_enabled
  db_binary_log_enabled  = var.db_binary_log_enabled
  db_retained_backups    = var.db_retained_backups
}
