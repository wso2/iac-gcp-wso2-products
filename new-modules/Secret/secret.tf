resource "google_secret_manager_secret" "secret" {
  project = var.project_id
  secret_id = var.secret_id
  labels = var.labels
  annotations = var.annotations

  replication {
    dynamic "auto" {
      for_each = var.replication_mode == "auto" ? [1] : []
      content {}
    }

    dynamic "user_managed" {
      for_each = var.replication_mode == "user_managed" ? var.replica_locations : []
      content {
        replicas {
          location = var.replica_locations.value
        }
      }
    }
  }
}

resource "google_secret_manager_secret_version" "ar-svc-version" {
  secret = google_secret_manager_secret.secret.id
  is_secret_data_base64 = var.is_secret_data_base64
  deletion_policy = var.deletion_policy
  secret_data = var.secret_data
}