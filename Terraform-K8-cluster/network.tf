
resource "google_compute_network" "my_vpc_network" {
  name                    = "my-vpc-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "my_subnetwork" {
  name          = "my-subnetwork"
  network       = var.gke_network
  ip_cidr_range = var.gke_subnetwork_cidr
  region        = var.gcp_region
  private_ip_google_access = true
}


resource "google_compute_firewall" "gke_cluster_firewall" {
  name    = "gke-cluster-firewall"
  network = var.gke_network

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_tags = ["gke-my-cluster"]
  target_tags = ["gke-my-cluster"]
}