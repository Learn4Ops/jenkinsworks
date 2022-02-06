provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}


module "elk" {
  source = "./modules/elk"
  kibanaservicetype = var.kibanaservicetype
  persistence = var.persistence
  kibanaingressenable = var.kibanaingressenable
  kibanaingress = var.kibanaingress

}

module "application" {
  source = "./modules/application"

}