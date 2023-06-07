gcp_credentials           = ""
gcp_project_id            = "mytestprod-388723"
gcp_region                = "us-central1"
gke_cluster_az            = ["us-central1-a"]
gke_regional              = false
gke_network               = "google_compute_network.my_vpc_network"
gke_subnetwork_cidr       = "10.128.0.0/16"
ip_cidr_range             = "10.5.0.0/20"
gke_service_account_name  = "magen.techn@gmail.com"
gke_cluster_name          = "commit-cluster"
gke_default_nodepool_name = "CommIT Smart"
volume_name               = "node-disk"
volume_size               = 100
disk_type                 = "pd-standard"