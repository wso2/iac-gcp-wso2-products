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

resource "google_monitoring_notification_channel" "notification_channel" {
  project      = var.project_name
  display_name = join("-", ["nc-email", var.notification_channel_name, var.environment])
  description  = join("", ["Email notification channel for ", var.notification_channel_name, " in ", var.environment])
  type         = "email"
  labels = {
    email_address = var.notification_email_address
  }
}
