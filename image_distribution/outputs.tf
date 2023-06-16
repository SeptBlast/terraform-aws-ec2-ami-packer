output "arn" {
  value       = aws_imagebuilder_distribution_configuration.this.arn
  description = "The ARN of the EC2 Image Builder component."
}