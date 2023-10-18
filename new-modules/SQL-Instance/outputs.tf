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

output "database_internal_ip" {
  value      = google_sql_database_instance.rds_instance.private_ip_address
  depends_on = [google_sql_database_instance.rds_instance]
}

output "database_connection_name" {
  value      = google_sql_database_instance.rds_instance.connection_name
  depends_on = [google_sql_database_instance.rds_instance]
}

output "database_default_user" {
  value      = google_sql_user.rds_user.name
  depends_on = [google_sql_user.rds_user]
}
