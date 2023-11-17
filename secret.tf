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
  source       = "git::https://github.com/wso2/gcp-terraform-modules.git//modules/gcp/Secret-Manager-Secrets"
  count        = var.enable_secret ? 1 : 0
  project_name = var.project_name
  labels       = var.labels
  secrets      = var.secrets
}
