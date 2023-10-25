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

resource "google_project_iam_member" "service_account_iam_member" {
  for_each = { for idx, role in var.service_account_roles : idx => role }
  project  = var.project_name
  role     = each.value
  member   = join(":", ["serviceAccount", var.service_account_email])
}
