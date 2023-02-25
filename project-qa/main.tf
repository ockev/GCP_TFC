resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  tags         = ["web", "dev1"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}

module "cloud-storage" {
  source  = "terraform-google-modules/cloud-storage/google"
  version = "3.4.1"
  names   = ["first"]
  prefix  = "kevins-bucket"
  project_id = "hc-51f8be8b9e3e42d78269e1fb96f"
  # insert required variables here
}

