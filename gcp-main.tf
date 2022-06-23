# Cria uma VM no Google Cloud
resource "google_compute_instance" "firstvm" {
  name         = "helloworld"
  machine_type = "n1-standard-1"
  zone         = "us-central1-c"

  # Defini a Imagem da VM
  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20220303a"
    }
  }

  # Habilita rede para a VM com um IP público
  network_interface {
    network = "default" # Estamos usando a VPC default que já vem por padrão no projeto.

    # A presença do bloco access_config, mesmo sem argumentos, garante que a instância estará acessível pela internet.
    access_config {
    }
  }
}

resource "google_app_engine_application" "app" {
  project     = "fiap-study"
  location_id = "us-central"
}

resource "google_artifact_registry_repository" "my-repo" {
  provider      = google-beta

  location      = "us-central1"
  repository_id = "fiap-labdevops"
  description   = "Imagens Docker"
  format        = "DOCKER"
}
