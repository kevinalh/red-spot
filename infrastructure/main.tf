terraform {
  required_providers {
    heroku = {
      source  = "heroku/heroku"
      version = "4.1.0"
    }
  }
  required_version = ">= 0.14.8"
}

provider "heroku" {}

resource "heroku_app" "default" {
  name   = "redspot-processor"
  region = "us"
}

resource "heroku_addon" "database" {
  app  = heroku_app.default.name
  plan = "heroku-postgresql:hobby-dev"
}
