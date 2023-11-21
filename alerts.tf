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

module "email_channel_primary" {
  source              = "git::https://github.com/wso2/gcp-terraform-modules.git//modules/gcp/Notification-Channel"
  environment         = var.environment
  channel_name        = var.alert_channel_name
  alert_email_address = var.alert_email_address
}

module "alert_policy_container_cpu" {
  source                      = "git::https://github.com/wso2/gcp-terraform-modules.git//modules/gcp/Alert-Policy"
  environment                 = var.environment
  alert_resource_type         = local.alert_resource_type_container
  alert_name                  = var.container_cpu_alert_name
  alert_duration              = var.container_cpu_alert_duration
  alert_comparison            = local.alert_gt_condition
  alert_threshold_value       = var.container_cpu_alert_threshold_value
  alert_notification_channels = [module.email_channel_primary.name]
  alert_filter                = join(" AND ", [local.alert_k8s_resource_container, local.alert_container_metric_cpu])
}

module "alert_policy_container_memory" {
  source                      = "git::https://github.com/wso2/gcp-terraform-modules.git//modules/gcp/Alert-Policy"
  environment                 = var.environment
  alert_resource_type         = local.alert_resource_type_container
  alert_name                  = var.container_memory_alert_name
  alert_duration              = var.container_memory_alert_duration
  alert_comparison            = local.alert_gt_condition
  alert_threshold_value       = var.container_memory_alert_threshold_value
  alert_notification_channels = [module.email_channel_primary.name]
  alert_filter                = join(" AND ", [local.alert_k8s_resource_container, local.alert_container_metric_memory])
}

module "alert_policy_container_restart_count" {
  source                             = "git::https://github.com/wso2/gcp-terraform-modules.git//modules/gcp/Alert-Policy"
  environment                        = var.environment
  alert_resource_type                = local.alert_resource_type_container
  alert_name                         = var.container_restart_alert_name
  alert_duration                     = var.container_restart_alert_duration
  alert_comparison                   = local.alert_gt_condition
  alert_threshold_value              = var.container_restart_alert_threshold_value
  alert_aggregations                 = true
  alert_aggregation_alignment_period = var.container_restart_alert_alignment_period
  alert_notification_channels        = [module.email_channel_primary.name]
  alert_filter                       = join(" AND ", [local.alert_k8s_resource_container, local.alert_container_metric_restarts])
}


module "alert_policy_node_cpu" {
  source                      = "git::https://github.com/wso2/gcp-terraform-modules.git//modules/gcp/Alert-Policy"
  environment                 = var.environment
  alert_resource_type         = local.alert_resource_type_node
  alert_name                  = var.node_cpu_alert_name
  alert_duration              = var.node_cpu_alert_duration
  alert_comparison            = local.alert_gt_condition
  alert_threshold_value       = var.node_cpu_alert_threshold_value
  alert_notification_channels = [module.email_channel_primary.name]
  alert_filter                = join(" AND ", [local.alert_k8s_resource_node, local.alert_node_metric_cpu])
}

module "alert_policy_node_memory" {
  source                      = "git::https://github.com/wso2/gcp-terraform-modules.git//modules/gcp/Alert-Policy"
  environment                 = var.environment
  alert_resource_type         = local.alert_resource_type_node
  alert_name                  = var.node_memory_alert_name
  alert_duration              = var.node_memory_alert_duration
  alert_comparison            = local.alert_gt_condition
  alert_threshold_value       = var.node_memory_alert_threshold_value
  alert_notification_channels = [module.email_channel_primary.name]
  alert_filter                = join(" AND ", [local.alert_k8s_resource_node, local.alert_node_metric_memory])
}
