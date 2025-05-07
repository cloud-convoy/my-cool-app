// Define your stacks here

module "hello" {
  source = "./modules/stack"

  app          = env0_project.this.id
  dependencies = [module.bootstrap.stack_id] // Makes bootstrap dependent on this stack
  id           = "hello-world"

  env = {
    account = "571600864712"
    region  = "us-east-1"
  }
}

module "bootstrap" {
  source = "./modules/stack"

  app = env0_project.this.id
  id  = "bootstrap" // https://github.com/cloud-convoy/bootstrap

  env = {
    account = "571600864712"
    region  = "us-east-1"
  }
}
