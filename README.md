# GKE Cluster using Terraform (All Terraform files are in Terraform-K8-cluster)

1. Module: terraform-google-modules/kubernetes-engine/google
   Purpose: This module provisions a GKE cluster in Google Cloud Platform (GCP). It sets up the necessary infrastructure, including VPC network, subnetwork, cluster, node pools, and other configurations.

2. Resource: google_compute_disk.persistent_volume
   Purpose: This resource represents a persistent disk in GCP Compute Engine. It provisions a disk that can be attached to GCE instances or GKE nodes.

3. Data Source: google_client_config.default
   Purpose: This data source retrieves the client configuration for the Google provider. It is used to authenticate and authorize Terraform to make API requests to GCP.

4. Resource: google_project_iam_member.admin_role
   Purpose: This resource grants an IAM member a role on a GCP project. In this case, it assigns the "roles/owner" role to the specified user, giving them full administrative access to the project.

5. The Network config file contains the necessary connection to enable accessibilty on the cluster

6. resources vaules are hardcoded inside variable.auto.tfvars for future use
