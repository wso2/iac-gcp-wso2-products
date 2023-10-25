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

resource "google_dns_record_set" "cname" {
  project      = var.project_name
  name         = var.c_name_record_name
  managed_zone = var.managed_zone_name
  type         = "CNAME"
  ttl          = var.ttl
  rrdatas      = var.rrdatas
}
