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
# Ignore: AVD-GCP-0030(https://avd.aquasec.com/misconfig/avd-gcp-0030)
# Reason: IDP is enabled for the bastion VM. SSH keys are not used for authentication.
# Ignore: AVD-GCP-0033(https://avd.aquasec.com/misconfig/avd-gcp-0033)
# Reason: Encryption is enabled and by default GCP managed key is used.
# Ignore: AVD-GCP-0067(https://avd.aquasec.com/misconfig/avd-gcp-0067)
# Reason: Shielded VM can be enabled if all the installations are required to be signed.

# trivy:ignore:AVD-GCP-0030
# trivy:ignore:AVD-GCP-0033
# trivy:ignore:AVD-GCP-0067
resource "google_compute_instance" "bastion_vm" {
  name         = join("-", ["vmbastion", var.location, var.environment])
  project      = var.project_name
  description  = join(" ", ["Bastion VM for", var.environment])
  machine_type = var.bastion_vm_machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.boot_disk_image
      labels = {
        boot_disk = "ubuntu-2204-lts"
      }
    }
  }
  network_interface {
    network            = var.vpc_name
    subnetwork_project = var.project_name
    subnetwork         = google_compute_subnetwork.bastion_subnetwork.name
  }
  shielded_instance_config {
    enable_vtpm        = true
    enable_secure_boot = var.enable_secure_boot
  }
  metadata = {}

  metadata_startup_script = <<-EOF
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

  service_account {
    email  = google_service_account.bastion_service_account.email
    scopes = ["cloud-platform"]
  }
  depends_on = [
    google_service_account.bastion_service_account,
    google_compute_subnetwork.bastion_subnetwork
  ]
}
