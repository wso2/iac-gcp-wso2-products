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
  source = "./modules/Project-Service"

  project_id       = var.project_name
  project_services = var.project_services
}

module "vpc_network" {
  source = "./modules/VPC"

  project_name = var.project_name
  vpc_name     = var.vpc_name
}


module "cloud-nat" {
  source = "./modules/Cloud-NAT"

  project_name = var.project_name
  region       = var.region
  vpc_name     = module.vpc_network.vpc_id
  environment  = var.environment
}
# module "google_compute_subnetwork" {
#   source = "./modules/VPC-Subnetwork"

#   project_id          = var.project_name
#   vpc_id              = module.vpc_network.vpc_id
#   vpc_name            = var.vpc_name
#   vpc_subnetwork_name = var.vpc_subnetwork_name
#   environment         = var.environment
#   ip_cidr_range       = var.ip_cidr_range
#   region              = var.region
# }
