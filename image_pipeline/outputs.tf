output "arn" {
  value       = aws_imagebuilder_image_pipeline.this.arn
  description = "The ARN of the EC2 Image Builder pipeline."
}