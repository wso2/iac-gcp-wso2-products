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

resource "google_monitoring_alert_policy" "alert_policy" {
  display_name = join("", ["[LOG][", upper(var.alert_environment), "]", var.alert_name])
  combiner     = "OR"
  enabled      = var.alert_enabled
  project      = var.project_name
  conditions {
    display_name = join("", ["[LOG][", upper(var.alert_environment), "]", var.alert_name])
    condition_threshold {
      filter          = "resource.type = \"k8s_container\" AND resource.labels.cluster_name = \"${var.cluster_name}\" AND metric.type = \"logging.googleapis.com/user/${var.alert_metric_name}\""
      duration        = "0s"
      threshold_value = var.alert_threshold_value
      comparison      = "COMPARISON_GT"
      aggregations {
        alignment_period     = var.alert_condition_duration
        cross_series_reducer = "REDUCE_NONE"
        per_series_aligner   = "ALIGN_COUNT"
      }
    }
  }
  alert_strategy {
    auto_close = "1800s"
  }
  notification_channels = var.notification_channels_ids
  documentation {
    content   = "Choreo PDP service is outputting logs that contain the word '${var.alert_name}'."
    mime_type = "text/markdown"
  }
}
