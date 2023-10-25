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

output "log_metric_filter" {
  value = google_logging_metric.logging_metric.filter
  depends_on = [
    google_logging_metric.logging_metric
  ]
}
output "log_metric_id" {
  value = google_logging_metric.logging_metric.id
  depends_on = [
    google_logging_metric.logging_metric
  ]
}
output "log_metric_name" {
  value = google_logging_metric.logging_metric.name
  depends_on = [
    google_logging_metric.logging_metric
  ]
}
