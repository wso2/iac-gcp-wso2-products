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

resource "google_secret_manager_secret" "secrets" {
  project   = var.project_name
  for_each  = { for secret in var.secrets : secret.name => secret }
  secret_id = each.value.name
  replication {
    automatic = true
  }
  labels = var.labels
}

resource "google_secret_manager_secret_version" "secret-version" {
  for_each    = { for secret in var.secrets : secret.name => secret }
  secret      = google_secret_manager_secret.secrets[each.value.name].id
  secret_data = each.value.secret_data
}
