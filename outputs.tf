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

output "bastion_instance" {
  description = "ID of the bastion instance."
  value       = module.bastion_instance.bastion_instance_id
  depends_on  = [module.bastion_instance]
}

output "database_internal_ip" {
  description = "Internal IP address of the database instance."
  value       = length(module.sql_instance) > 0 ? module.sql_instance[0].database_internal_ip : null
  depends_on  = [module.sql_instance]
}

output "database_connection_name" {
  description = "Connection name of the database instance."
  value       = length(module.sql_instance) > 0 ? module.sql_instance[0].database_connection_name : null
  depends_on  = [module.sql_instance]
}

output "database_default_user" {
  description = "Default user of the database instance."
  value       = length(module.sql_instance) > 0 ? module.sql_instance[0].database_default_user : null
  depends_on  = [module.sql_instance]
}

output "filestore_location" {
  value       = length(module.fileshare) > 0 ? module.fileshare[0].location : null
  depends_on  = [module.fileshare]
  description = "Location of the filestore."
}

output "filestore_location_ip" {
  value       = length(module.fileshare) > 0 ? module.fileshare[0].ip_address : null
  depends_on  = [module.fileshare]
  description = "IP address of the filestore."
}

output "fileshare_name" {
  value       = length(module.fileshare) > 0 ? module.fileshare[0].fileshare_name : null
  depends_on  = [module.fileshare]
  description = "Fileshare name"
}

output "filestore_name" {
  value       = length(module.fileshare) > 0 ? module.fileshare[0].filestore_name : null
  depends_on  = [module.fileshare]
  description = "Filestore name"
}
