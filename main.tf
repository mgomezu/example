terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  token = ""
}

resource "github_repository" "example" {
  name        = "example"
  description = "My awesome codebase"
  visibility = "public"
  auto_init = true
}

resource "github_branch" "development" {
  repository = github_repository.example.name
  branch     = "development"
}

resource "github_branch_default" "default"{
  repository = github_repository.example.name
  branch     = github_branch.development.branch
}

resource "github_branch" "QA" {
  repository = github_repository.example.name
  branch     = "QA"
}

resource "github_branch" "Testing" {
  repository = github_repository.example.name
  branch     = "Testing"
}