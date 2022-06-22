terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.22.0"
    }
  }
}

# Configura o Provider Google Cloud com o Projeto
provider "google" {

  # Rodar local
  # credentials = file("/vagrant/gcpkey.json")

  project = "fiap-study"
  region  = "us-west1"
  zone    = "us-west1-b"
}

