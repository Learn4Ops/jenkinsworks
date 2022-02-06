provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}


module "postgresql" {
  source = "./modules/postgresql"

}

module "rabbitmq" {
  source = "./modules/rabbitmq"

}

module "redis" {
  source = "./modules/redis"

}