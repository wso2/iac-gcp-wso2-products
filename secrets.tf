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

module "secret" {
  source = "./new-modules/Secret"

  project_id            = var.project_name
  secret_id             = var.secret_id
  labels                = var.labels
  annotations           = var.secret_annotations
  replication_mode      = var.secret_replication_mode
  is_secret_data_base64 = var.is_secret_data_base64
  deletion_policy       = var.deletion_policy
  secret_data           = var.secret_data
}
