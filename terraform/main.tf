terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "berchevorg"

    workspaces {
      name = "filesystem-error"
    }
  }
}

resource "null_resource" "test" {
    triggers = {
        build_number = "${timestamp()}"
    }
}

resource "random_pet" "name" {
 length    = "8"
 separator = "-"
}