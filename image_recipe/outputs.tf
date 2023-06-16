output "arn" {
  description = "ARN of the EC2 Image Builder Recipe"
  value       = aws_imagebuilder_image_recipe.this.arn
}