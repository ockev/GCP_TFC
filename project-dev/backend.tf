terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "koconnor"

    workspaces {
      name = "GCP_TFC_Dev"
    }
  }
}

provider "google" {
  credentials = file(var.credentials_file)

  project = var.project
  region  = var.region
  zone    = var.zone
}