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

variable "project_name" {
  description = "The project name where the alert needs to be added"
  type        = string
}
variable "alert_name" {
  description = "The alert name"
  type        = string
}
variable "alert_environment" {
  description = "The alert environment"
  type        = string
}
variable "alert_enabled" {
  description = "The alert enabled"
  type        = bool
}
variable "notification_channels_ids" {
  description = "The notification channels ids"
  type        = list(string)
}
variable "alert_metric_filter" {
  description = "The alert metric filter"
  type        = string
}
variable "alert_duration" {
  description = "The alert duration"
  type        = string
}
variable "alert_threshold_value" {
  description = "The alert threshold value"
  type        = number
}
variable "alert_per_series_aligner" {
  description = "The alert per series aligner"
  type        = string
}
variable "alert_alignment_period" {
  description = "The alert alignment period"
  type        = string
}
variable "alert_cross_series_reducer" {
  description = "The alert cross series reducer"
  type        = string
}
variable "alert_group_by_fields" {
  description = "The alert group by fields"
  type        = list(string)
}
variable "alert_trigger_count" {
  description = "The alert trigger count"
  type        = number
}
