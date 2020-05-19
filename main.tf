provider "google" {
  project = var.gcp_project
  region  = "australia-southeast1"
  zone    = "australia-southeast1-b"
}

terraform {
  backend "gcs" {
    prefix  = "codefresh/${terraform.workspace}/state"
  }
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-${terraform.workspace}-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
  }
}


