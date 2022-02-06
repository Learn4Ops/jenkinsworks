
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "postgresql_bitnami" {
  name       = "normal-postgresql"
  namespace =  "opensource"
  create_namespace = "true"

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "postgresql"

  set {
    name  = "primary.service.type"
    value = "NodePort"
  }

    set {
    name = "primary.persistence.enabled"
    value = "false"
    }

    set {
      name = "readReplicas.persistence.enabled"
      value = "false"
    }

    set {
        name = "global.postgresql.auth.postgresPassword"
        value = "postgres"
    }


}