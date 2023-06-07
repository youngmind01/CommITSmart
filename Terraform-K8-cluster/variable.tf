variable "gcp_credentials" {
  type        = string
  description = "gcloud CLI login "
}

variable "gcp_project_id" {
  type        = string
  description = "GCP Project id"
}

variable "gcp_region" {
  type        = string
  description = "GCP region"
}

variable "gke_regional" {
  type        = string
  description = "value"
}

variable "gke_cluster_name" {
  type    = string
  default = "CommIT-cluster"
}

variable "gke_cluster_az" {
  type        = list(string)
  description = "cluster availabilty zones"
}

variable "gke_network" {
  type        = string
  description = "VPC Network name"
}

variable "gke_subnetwork_cidr" {
  type        = string
  description = "Subnet"
}

variable "ip_cidr_range" {
  type = string
}

variable "gke_default_nodepool_name" {
  type        = string
  description = "GKE Default node pool name"
}

variable "gke_service_account_name" {
  type        = string
  description = "GKE Service Account Name"
}

variable "volume_name" {
  type = string
}

variable "volume_size" {
  type        = number
  description = "This is the disk size"
}

variable "disk_type" {
  type = string
}






