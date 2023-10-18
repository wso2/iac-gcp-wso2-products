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

variable "environment" {
  description = "Environment"
  type        = string
}

variable "alert_resource_type" {
  description = "Alert resource type"
  type        = string
}

variable "alert_name" {
  description = "Alert name"
  type        = string
}

variable "alert_filter" {
  description = "Alert filter"
  type        = string
}

variable "alert_duration" {
  description = "Alert duration"
  type        = string
}

variable "alert_comparison" {
  description = "Alert comparison"
  type        = string
}

variable "alert_threshold_value" {
  description = "Alert threshold value"
  type        = string
}

variable "alert_aggregations" {
  description = "Alert aggregations"
  type        = bool
  default     = false
}

variable "alert_aggregation_alignment_period" {
  description = "Alert aggregation alignment period"
  type        = string
  default     = "0s"
}

variable "alert_renotify_interval" {
  description = "Alert renotify interval"
  type        = string
}

variable "alert_notification_channels" {
  description = "Alert notification channels"
  type        = list(string)
}
