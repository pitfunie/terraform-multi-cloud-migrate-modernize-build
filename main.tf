Step 1: Multicloud Terraform Code

main.tf for AWS and GCP:

provider "aws" {
  region = var.aws_region
}

provider "google" {
  credentials = file(var.gcp_credentials)
  project     = var.gcp_project
  region      = var.gcp_region
}

# Define variables for multiple regions, VPCs, etc.
variable "aws_region" {
  default = "us-east-1"
}

variable "gcp_project" {}
variable "gcp_region" {
  default = "us-central1"
}

variable "gcp_credentials" {}

variable "vpc_count" {
  default = 127
}

# AWS VPC
module "aws_vpc" {
  source = "./modules/aws_vpc"
  region = var.aws_region
  vpc_count = var.vpc_count
}

# GCP VPC
module "gcp_vpc" {
  source = "./modules/gcp_vpc"
  project = var.gcp_project
  region = var.gcp_region
  vpc_count = var.vpc_count
}
