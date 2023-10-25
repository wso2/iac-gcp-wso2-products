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

resource "google_monitoring_alert_policy" "memory_container_alert_policy" {
  display_name = join("-", ["[ALERT POLICY] - GKE Container Memory", var.environment, var.scope])
  combiner     = "OR"
  conditions {
    display_name = join("-", ["Container High Memory Usage", var.environment, var.scope])
    condition_threshold {
      filter          = "resource.type=\"k8s_container\" AND metric.type=\"kubernetes.io/container/memory/used_bytes\" AND resource.labels.cluster_name=\"${var.cluster_name}\" AND resource.labels.container_name=\"${var.filter}\""
      duration        = var.container_memory_duration
      comparison      = "COMPARISON_GT"
      threshold_value = var.container_memory_threshold_value #Bytes
      aggregations {
        alignment_period     = var.container_memory_alignment_period
        per_series_aligner   = "ALIGN_MEAN"
        cross_series_reducer = "REDUCE_MEAN"
        group_by_fields      = ["resource.container_name", "resource.cluster_name"]
      }

      trigger {
        count = var.container_memory_trigger_count
      }
    }

  }
  notification_channels = [
    var.notification_channels_id
  ]
}

# GKE ALERT POLICY - Container CPU
resource "google_monitoring_alert_policy" "cpu_container_alert_policy" {
  display_name = join("-", ["[ALERT POLICY] - GKE Container CPU", var.environment, var.scope])
  combiner     = "OR"
  conditions {
    display_name = join("-", ["Container High CPU Usage", var.environment, var.scope])
    condition_threshold {
      filter          = "resource.type=\"k8s_container\" AND metric.type=\"kubernetes.io/container/cpu/core_usage_time\" AND resource.labels.cluster_name=\"${var.cluster_name}\" AND resource.labels.container_name=\"${var.filter}\""
      duration        = var.container_cpu_duration
      comparison      = "COMPARISON_GT"
      threshold_value = var.container_cpu_threshold_value #Bytes
      aggregations {
        alignment_period     = var.container_cpu_alignment_period
        per_series_aligner   = "ALIGN_RATE"
        cross_series_reducer = "REDUCE_MEAN"
        group_by_fields      = ["resource.container_name", "resource.cluster_name"]
      }

      trigger {
        count = var.container_cpu_trigger_count
      }
    }

  }
  notification_channels = [
    var.notification_channels_id
  ]
}
