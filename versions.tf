terraform {
  required_providers {
    env0 = {
      source  = "env0/env0"
      version = "1.27.0"
    }

    github = {
      source  = "integrations/github"
      version = "6.6.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }
}
