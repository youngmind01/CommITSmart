module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.gcp_project_id
  name                       = var.gke_cluster_name
  region                     = var.gcp_region
  regional                   = var.gke_regional
  zones                      = var.gke_cluster_az
  network                    = var.gke_network
  subnetwork                 = var.gke_subnetwork_cidr
  ip_range_pods              = ""
  ip_range_services          = ""
  http_load_balancing        = true
  network_policy             = false
  horizontal_pod_autoscaling = true
  filestore_csi_driver       = true

  node_pools = [
    {
      name                  = var.gke_default_nodepool_name
      machine_type          = "e2-medium"
      min_count             = 1
      max_count             = 3
      spot                  = false
      disk_size_gb          = var.volume_size
      disk_type             = var.disk_type
      image_type            = "COS_CONTAINERD"
      enable_gcfs           = false
      enable_gvnic          = false
      auto_repair           = true
      auto_upgrade          = true
      service_account       = var.gke_service_account_name
      preemptible           = false
      initial_node_count    = 1
    },
  ]

  node_pools_oauth_scopes = {
    all = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }

  node_pools_labels = {
    all = {}

    default-node-pool = {
      default-node-pool = true
    }
  }

  node_pools_taints = {
    all = []

    default-node-pool = [
      {
        key    = "default-node-pool"
        value  = true
        effect = "PREFER_NO_SCHEDULE"
      },
    ]
  }

  node_pools_tags = {
    all = []

    default-node-pool = [
      "default-node-pool",
    ]
  }
}

resource "google_compute_disk" "persistent_volume" {
  name  = var.volume_name
  type  = var.disk_type
  size  = var.volume_size

  zone  = var.gke_cluster_az[0]  # Use the first zone from the cluster's available zones

  labels = {
    environment = "dev"
  }
}

data "google_client_config" "default" {}

resource "google_project_iam_member" "admin_role" {
  project = var.gcp_project_id
  role    = "roles/owner"
  member  = "user:magen.techn@gmail.com"
}