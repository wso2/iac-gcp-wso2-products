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

resource "google_artifact_registry_repository" "artifact_registry_repository" {
  repository_id = join("-", ["gar", var.project_name, var.location])
  location      = var.location
  description   = join(" ", ["Artifact Registry for", var.project_name])
  format        = "DOCKER"
  project       = var.project_name
  labels        = var.labels
}
