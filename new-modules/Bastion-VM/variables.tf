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
  description = "The project name of the bastion VM"
  type        = string
}
variable "zone" {
  description = "The zone of bastion vm"
  type        = string
}
variable "location" {
  description = "The location of the bastion VM"
  type        = string
}
variable "environment" {
  description = "The environment of the bastion VM"
  type        = string
}
variable "vpc_name" {
  description = "The VPC name in which the bastion VM will be created"
  type        = string
}
variable "bastion_ip_cidr_range" {
  description = "The IP CIDR range of the bastion subnet"
  type        = string
}
variable "bastion_vm_machine_type" {
  description = "The bastion VM machine type"
  type        = string
  default     = "e2-small"
}
variable "boot_disk_image" {
  description = "The bastion vm boot disk image"
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"
}
variable "enable_flow_logs" {
  description = "Enable flow logs of the VPC subnetwork"
  type        = bool
  default     = false
}
variable "aggregation_interval" {
  description = "Aggregation interval of the VPC subnetwork logs"
  type        = string
  default     = "INTERVAL_10_MIN"
}
variable "flow_sampling" {
  description = "Flow sampling of the VPC subnetwork logs"
  type        = number
  default     = 0.5
}
variable "metadata" {
  description = "Metadata of the VPC subnetwork logs"
  type        = string
  default     = "INCLUDE_ALL_METADATA"
}
variable "enable_secure_boot" {
  description = "Enable secure boot of the bastion VM"
  type        = bool
  default     = false
}
variable "metadata_startup_script" {
  description = "Startup script of the bastion VM"
  type        = string
  default     =  <<-EOF
    #!/bin/bash
    sudo apt update
    sudo apt-get update
    # Install Helm
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
    chmod 700 get_helm.sh
    ./get_helm.sh
    # Install kubectl
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
    sudo apt update
    sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin kubectl
    export USE_GKE_GCLOUD_AUTH_PLUGIN=True
    # Install Kustomize
    sudo snap install kustomize
    # Install Kapp
    wget -O- https://carvel.dev/install.sh > install.sh
    sudo bash install.sh
    # Install yq and jq
    sudo snap install yq
    sudo apt-get install jq
    # Intsall Unzip
    sudo apt install unzip
    EOF
}
