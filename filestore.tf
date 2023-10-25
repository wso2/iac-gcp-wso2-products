# Copyright (c) 2023, WSO2 LLC. (http://www.wso2.com). All Rights Reserved.
#
# This software is the property of WSO2 LLC. and its suppliers, if any.
# Dissemination of any information or reproduction of any material contained
# herein in any form is strictly forbidden, unless permitted by WSO2 expressly.
# You may not alter or remove any copyright or other notice from copies of this content.
#
# --------------------------------------------------------------------------------------

resource "google_filestore_instance" "persistent_storage" {
  name     = join("-", [var.project_name, var.environment, "filestore"])
  tier     = var.filestore_tier
  location = var.filestore_location
  networks {
    network = module.vpc_network.vpc_name
    modes   = ["MODE_IPV4"]
  }
  file_shares {
    name        = "wso2am"
    capacity_gb = var.filestore_capacity_gb
  }
}
