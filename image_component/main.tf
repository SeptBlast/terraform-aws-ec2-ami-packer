# image components
resource "aws_imagebuilder_component" "this" {
  name        = var.name
  description = var.description
  platform    = var.platform
  version     = var.component_version
  data        = "${file("${path.module}/data/${var.os_flavor}/${var.data}.yml")}"
  tags        = var.tags
}
