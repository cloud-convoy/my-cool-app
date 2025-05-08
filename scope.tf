/*
+-----------------------------------------------------------+
|                                                           |
|                                                           |
|  scope.tf                                                 |
|                                                           |
|  WARNING:  DO NOT MODIFY this file                        |
|                                                           |
|            An app is a collection of one or more stacks.  |
|                                                           |
|                                                           |
+-----------------------------------------------------------+
 */

terraform {
  backend "s3" {
    bucket               = "cloud-convoy"
    dynamodb_table       = "cloud-convoy"
    encrypt              = true
    key                  = "terraform.tfstate"
    region               = "us-east-1"
    workspace_key_prefix = "apps"
  }
}

resource "env0_project" "this" {
  force_destroy = true
  name          = terraform.workspace
  wait          = true
}
