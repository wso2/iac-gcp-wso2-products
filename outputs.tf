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
  value      = module.bastion_instance.bastion_instance_id
  depends_on = [module.bastion_instance]
}

output "database_internal_ip" {
  value      = module.sql_instance.database_internal_ip
  depends_on = [module.sql_instance]
}

output "database_connection_name" {
  value      = module.sql_instance.database_connection_name
  depends_on = [module.sql_instance]
}

output "database_default_user" {
  value      = module.sql_instance.database_default_user
  depends_on = [module.sql_instance]
}
