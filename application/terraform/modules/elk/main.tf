resource "helm_release" "elasticsearch" {
  name       = "elasticsearch"
  namespace =  "application"
  create_namespace = "true"

  repository = "https://helm.elastic.co"
  chart      = "elasticsearch"

  set {
    name  = "antiAffinity"
    value = "soft"
  }

    set {
    name = "persistence.enabled"
    value = "false"
    }

    set {
      name = "service.type"
      value = "NodePort"
    }

    set {
      name = "resources.requests.memory"
      value = "1Gi"
    }

    set {
      name = "resources.limits.memory"
      value = "1Gi"
    }

    set {
        name = "replicas"
        value = "1"
    }

    set {
        name = "minumumMasterNodes"
        value = "1"
    }

}

resource "helm_release" "logstash" {
  name       = "logstash"
  namespace =  "application"
  create_namespace = "true"

  repository = "https://helm.elastic.co"
  chart      = "logstash"

  set {
    name  = "antiAffinity"
    value = "soft"
  }

    set {
    name = "persistence.enabled"
    value = var.persistence
    }

    # set {
    #   name = "service.type"
    #   value = "NodePort"
    # }

    set {
      name = "resources.requests.memory"
      value = "1Gi"
    }

    set {
      name = "resources.limits.memory"
      value = "1Gi"
    }

    set {
        name = "replicas"
        value = "1"
    }

  depends_on = [helm_release.elasticsearch ]
}
resource "helm_release" "kibana" {
  name       = "kibana"
  namespace =  "application"
  create_namespace = "true"

  repository = "https://helm.elastic.co"
  chart      = "kibana"

  set {
    name  = "service.type"
    value = var.kibanaservicetype
  }

    set {
    name = "persistence.enabled"
    value = var.persistence
    }

    set {
      name = "resources.requests.memory"
      value = "1Gi"
    }

    set {
      name = "resources.limits.memory"
      value = "1Gi"
    }

    set {
        name = "replicas"
        value = "1"
    }

    set {
      name = "ingress.enabled"
      value = var.kibanaingressenable
    }

    set {
      name = "ingress.hosts[0].host"
      value = var.kibanaingress
    }

    set {
      name = "ingress.hosts[0].paths[0].path"
      value = "/"
    }

  depends_on = [helm_release.elasticsearch ]

 }