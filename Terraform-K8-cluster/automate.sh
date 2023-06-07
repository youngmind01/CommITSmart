#!/bin/bash

# Set variables
TF_DIR="path/to/terraform/directory"
TEST_SCRIPT="path/to/test/script"

# Change to the Terraform directory
cd "$TF_DIR" || exit

# Initialize Terraform
terraform init

# Apply the Terraform configuration
terraform apply -auto-approve

# Run the test script
bash "$TEST_SCRIPT"

# Clean up resources
terraform destroy -auto-approve
