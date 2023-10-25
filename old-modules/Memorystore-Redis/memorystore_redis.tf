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

resource "google_redis_instance" "memorystore_redis_instance" {
  name                    = join("-", ["ms-redis", var.redis_name, var.environment])
  project                 = var.project_name
  tier                    = var.tier
  memory_size_gb          = var.memory_size_gb
  redis_version           = var.redis_version
  region                  = var.region
  location_id             = var.zone
  reserved_ip_range       = var.reserved_ip_range
  auth_enabled            = true
  authorized_network      = var.vpc_id
  transit_encryption_mode = "SERVER_AUTHENTICATION"
  connect_mode            = "DIRECT_PEERING"
  labels                  = var.labels
}
