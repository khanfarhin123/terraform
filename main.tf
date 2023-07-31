provider "google" {
  credentials = file("/home/kfarhin305/gcproject-393312-fe64bc230d98.json")
  project     = "gcproject-393312"
  region      = "asia-south1"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-vm"
  machine_type = "n1-standard-1"
  zone         = "asia-south1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"  # Replace with the desired OS image
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }
}
