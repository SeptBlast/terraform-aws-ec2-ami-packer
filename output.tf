output "image_component_arn" {
  value       = module.image_builder_component.arn
  description = "The ARN of the EC2 Image Builder component."
}
output "image_recipe_arn" {
  value       = module.image_builder_recipe.arn
  description = "The ARN of the EC2 Image Builder recipe."
}

output "image_distribution_arn" {
  value       = module.image_builder_distribution.arn
  description = "The ARN of the EC2 Image Builder distribution."
}

output "image_infrastructure_arn" {
  value       = module.image_builder_infrastructure.arn
  description = "The ARN of the EC2 Image Builder infrastructure."
}

output "image_pipeline_arn" {
  value       = module.image_builder_pipeline.arn
  description = "The ARN of the EC2 Image Builder pipeline."
}