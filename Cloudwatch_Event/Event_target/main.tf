

resource "aws_cloudwatch_event_target" "this" {
  rule                         = var.rule
  target_id                    = var.target_id
  arn                          = var.arn
  role_arn                     = var.role_arn
  dead_letter_config {
    arn = var.dead_letter_arn
  }

  retry_policy {  
    maximum_event_age_in_seconds = var.maximum_event_age_in_seconds
    maximum_retry_attempts       = var.maximum_retry_attempts
  }
  
}