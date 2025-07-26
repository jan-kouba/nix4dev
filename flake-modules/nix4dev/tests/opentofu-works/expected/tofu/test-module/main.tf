terraform {
  required_providers {
    local = {
      source  = "registry.opentofu.org/hashicorp/local"
      version = "2.5.2"
    }
  }
}

resource "local_file" "test" {
  content         = "This was created by opentofu!\n"
  filename        = "${path.module}/../../test-file"
  file_permission = "0666"
}
