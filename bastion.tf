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

module "bastion_instance" {
  source                  = "git::https://github.com/wso2/gcp-terraform-modules.git//modules/gcp/Bastion-VM"
  project_name            = var.project_name
  zone                    = var.zone
  location                = var.region
  environment             = var.environment
  vpc_name                = module.vpc_network.vpc_id
  bastion_ip_cidr_range   = var.bastion_ip_cidr_range
  bastion_vm_machine_type = var.bastion_vm_machine_type
  boot_disk_image         = var.bastion_vm_boot_disk_image
  metadata_startup_script = var.bastion_metadata_startup_script
}
