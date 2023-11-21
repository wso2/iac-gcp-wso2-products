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

locals {
  alert_resource_type_container   = "container"
  alert_resource_type_node        = "node"
  alert_k8s_resource_node         = "resource.type = \"k8s_node\""
  alert_k8s_resource_container    = "resource.type = \"k8s_container\""
  alert_gt_condition              = "COMPARISON_GT"
  alert_container_metric_cpu      = "metric.type = \"kubernetes.io/container/cpu/limit_utilization\""
  alert_container_metric_memory   = "metric.type = \"kubernetes.io/container/memory/limit_utilization\""
  alert_container_metric_restarts = "metric.type = \"kubernetes.io/container/restart_count\""
  alert_node_metric_cpu           = "metric.type = \"kubernetes.io/node/cpu/allocatable_utilization\""
  alert_node_metric_memory        = "metric.type = \"kubernetes.io/node/memory/allocatable_utilization\""
}
