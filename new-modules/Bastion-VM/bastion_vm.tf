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

  metadata_startup_script = var.metadata_startup_script

  service_account {
    email  = google_service_account.bastion_service_account.email
    scopes = ["cloud-platform"]
  }
  depends_on = [
    google_service_account.bastion_service_account,
    google_compute_subnetwork.bastion_subnetwork
  ]
}
