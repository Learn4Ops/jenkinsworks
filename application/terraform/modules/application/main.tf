terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}
provider "kubernetes" {
  config_path = "~/.kube/config"
}

# resource "kubernetes_namespace" "application" {
#   metadata {
#     name = "application"
#   }
# }

resource "kubernetes_deployment" "application" {
  metadata {
    name      = "application"
    namespace = "application"
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "application"
      }
    }
    template {
      metadata {
        labels = {
          app = "application"
        }
      }
      spec {
        container {
          image = "nginx"
          name  = "application-container"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}
resource "kubernetes_service" "application" {
  metadata {
    name      = "application"
    namespace = "application"
  }
  spec {
    selector = {
      app = "application"
    }
    type = "NodePort"
    port {
      node_port   = 30220
      port        = 80
      target_port = 80
    }
  }
}