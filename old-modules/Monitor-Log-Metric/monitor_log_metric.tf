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

resource "google_logging_metric" "logging_metric" {
  name    = join("", ["METRIC-", var.alert_name])
  filter  = var.alert_query
  project = var.project_name
  metric_descriptor {
    metric_kind = "DELTA"
    value_type  = "INT64"
  }
}
