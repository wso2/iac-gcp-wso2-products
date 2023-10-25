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

# GLOBAL VARS
variable "notification_channels_id" {
  type = string
}
variable "environment" {
  type = string
}
variable "cluster_name" {
  type = string
}

# GKE ALERT POLICY - Container Memory
variable "container_memory_duration" {
  type = string
}
variable "container_memory_threshold_value" {
  type = string
}
variable "container_memory_alignment_period" {
  type = string
}
variable "container_memory_trigger_count" {
  type = string
}

# GKE ALERT POLICY - Container CPU
variable "container_cpu_duration" {
  type = string
}
variable "container_cpu_threshold_value" {
  type = string
}
variable "container_cpu_alignment_period" {
  type = string
}
variable "container_cpu_trigger_count" {
  type = string
}

variable "filter" {
  type = string
}
variable "scope" {
  type = string
}
