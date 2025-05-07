resource "random_id" "suffix" {
  byte_length = 3
}

resource "env0_environment" "this" {
  force_destroy = !var.termination_protection
  name          = "stack-${local.stack_id}"
  project_id    = var.app
  variable_sets = ["1e124f1b-b7a1-4267-91f5-529c36ecf11f"]
  workspace     = "${var.env.account}_${var.env.region}_${local.stack_id}"

  configuration {
    is_sensitive  = false
    name          = "tags"
    schema_format = "JSON"
    type          = "terraform"
    value         = jsonencode(local.tags)
  }

  dynamic "configuration" {
    for_each = var.parameters

    content {
      is_sensitive = false
      name         = configuration.key
      type         = "terraform"
      value        = configuration.value
    }
  }

  without_template_settings {
    github_installation_id = "65491280"
    repository             = data.github_repository.this.html_url
    revision               = data.github_branch.this.branch
    terraform_version      = "1.5.7"
    type                   = "terraform"
  }
}

resource "env0_workflow_triggers" "this" {
  count = length(var.dependencies) > 0 ? 1 : 0

  downstream_environment_ids = var.dependencies
  environment_id             = env0_environment.this.id
}
