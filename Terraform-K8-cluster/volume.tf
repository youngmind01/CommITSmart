resource "google_compute_disk" "gke_volume" {
  name = var.volume_name
  type = var.disk_type
  size = var.volume_size
}

