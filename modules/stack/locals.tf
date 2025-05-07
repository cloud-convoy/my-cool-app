locals {
  stack_id = coalesce(var.stack_name, "${var.id}-${random_id.suffix.b64_url}")

  tags = merge(var.tags, {
    ApplicationId = var.app
    Description   = coalesce(data.github_repository.this.description, var.description)
    RepositoryUrl = data.github_repository.this.html_url
  })
}
