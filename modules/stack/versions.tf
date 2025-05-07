terraform {
  required_providers {
    env0 = {
      source = "env0/env0"
    }

    github = {
      source = "integrations/github"
    }

    random = {
      source = "hashicorp/random"
    }
  }
}
