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
  display_name = join("-", [var.environment, var.alert_resource_type, var.alert_name])
  combiner     = "OR"
  conditions {
    display_name = join("-", [var.alert_resource_type, var.alert_name])
    condition_threshold {
      filter          = var.alert_filter
      duration        = var.alert_duration
      comparison      = var.alert_comparison
      threshold_value = var.alert_threshold_value

      dynamic "aggregations" {
        for_each = var.alert_aggregations ? [1] : []

        content {
          alignment_period   = var.alert_aggregation_alignment_period
          per_series_aligner = "ALIGN_RATE"
        }
      }
    }
  }
  alert_strategy {
    notification_channel_strategy {
      renotify_interval = var.alert_renotify_interval
    }
  }
  notification_channels = var.alert_notification_channels
}