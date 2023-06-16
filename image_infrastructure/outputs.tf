output "arn" {
  value       = aws_imagebuilder_infrastructure_configuration.this.arn
  description = "The ARN of the EC2 Image Builder infrastructure configuration."
}