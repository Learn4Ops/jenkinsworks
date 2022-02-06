provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "rabbitmq_bitnami" {
  name       = "normal-rabbitmq"
  namespace =  "opensource"
  create_namespace = "true"

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "rabbitmq"

  set {
    name  = "service.type"
    value = "NodePort"
  }

    set {
      name = "persistence.enabled"
      value = "false"
    }

    set {
        name = "auth.user"
        value = "user"
    }


    set {
        name = "auth.password"
        value = "rabbitmq"
    }


}