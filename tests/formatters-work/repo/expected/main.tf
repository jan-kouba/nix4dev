resource "local_file" "test" {
  content  = "This was created by terraform!"
  filename = "${path.module}/../../test-file"
}
