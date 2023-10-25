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

output "project_id" {
  value      = google_project.project.id
  depends_on = [google_project.project]
}
output "project_name" {
  value      = google_project.project.name
  depends_on = [google_project.project]
}
output "project_number" {
  value      = google_project.project.number
  depends_on = [google_project.project]
}
