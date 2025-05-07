data "github_repository" "this" {
  name = var.id

  lifecycle {
    postcondition {
      condition     = length(self.template) > 0
      error_message = ""
    }

    postcondition {
      condition     = self.template[0].repository == "stack"
      error_message = ""
    }
  }
}

data "github_branch" "this" {
  branch     = "main"
  repository = data.github_repository.this.name
}
