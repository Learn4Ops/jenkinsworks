provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "redis_bitnami" {
  name       = "normal-redis"
  namespace =  "opensource"
  create_namespace = "true"

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "redis"

  set {
    name  = "master.service.type"
    value = "NodePort"
  }

    set {
    name = "master.persistence.enabled"
    value = "false"
    }

    set {
    name= "replica.persistence.enabled"
    value = "false"
    }

    set {
      name= "global.redis.password"
      value= "redis"
    }


}