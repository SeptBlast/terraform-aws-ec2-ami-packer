#image pipeline 
resource "aws_imagebuilder_image_pipeline" "this" {
  description                      = var.description
  distribution_configuration_arn   = var.distribution_configuration
  image_recipe_arn                 = var.image_recipe
  infrastructure_configuration_arn = var.infrastructure_configuration
  name                             = var.name
  tags                             = var.tags
}