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

output "service_account_id" {
  value      = google_service_account.service_account.id
  depends_on = [google_service_account.service_account]
}
output "service_account_email" {
  value      = google_service_account.service_account.email
  depends_on = [google_service_account.service_account]
}
output "service_account_name" {
  value      = google_service_account.service_account.name
  depends_on = [google_service_account.service_account]
}
