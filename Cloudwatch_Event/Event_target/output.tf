output "event_target_ids" {
  value = aws_cloudwatch_event_target.this[*].id
}