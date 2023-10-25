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

resource "google_service_account" "service_account_choreo_cp" {
  project      = var.project_name
  account_id   = join("-", ["svcacc", "org-reg"])
  display_name = join("-", ["svcacc", "org-reg"])
  description  = "Service account for Choreo Org registration"
}

resource "google_service_account_key" "service_account_choreo_cp_key" {
  service_account_id = google_service_account.service_account_choreo_cp.name
}

resource "google_project_iam_member" "service_account_choreo_cp_role" {
  project = var.project_name
  role    = "roles/artifactregistry.writer"
  member  = join(":", ["serviceAccount", google_service_account.service_account_choreo_cp.email])
  depends_on = [
    google_service_account.service_account_choreo_cp
  ]
}
