terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "berchevorg"

    workspaces {
      name = "filesysyem-fail"
    }
  }
}

resource "null_resource" "test" {
    triggers = {
        build_number = "${timestamp()}"
    }
}
