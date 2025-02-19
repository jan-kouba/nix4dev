terraform {
  required_providers {
    local = {
      source = "registry.terraform.io/hashicorp/local"
      version = "2.5.2"
    }
  }
}

resource "local_file" "test" {
  content  = "This was created by terraform!"
  filename = "${path.module}/../../test-file"
}
