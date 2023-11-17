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

module "project_svc" {
  source           = "git::https://github.com/wso2/gcp-terraform-modules.git//modules/gcp/Project-Service"
  project_id       = var.project_name
  project_services = var.project_services
}

module "vpc_network" {
  source       = "git::https://github.com/wso2/gcp-terraform-modules.git//modules/gcp/VPC"
  project_name = var.project_name
  vpc_name     = var.vpc_name
}

module "cloud_nat" {
  source       = "git::https://github.com/wso2/gcp-terraform-modules.git//modules/gcp/Cloud-NAT"
  project_name = var.project_name
  region       = var.region
  vpc_name     = module.vpc_network.vpc_id
  environment  = var.environment
}
