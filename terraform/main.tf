resource "null_resource" "packer" {
    triggers = {
        build_number = "${timestamp()}"
    }
}
