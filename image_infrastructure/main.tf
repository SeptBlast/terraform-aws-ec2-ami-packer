#image infrastructure config 
resource "aws_imagebuilder_infrastructure_configuration" "this" {
  name                          = var.name
  description                   = var.description
  instance_profile_name         = var.iam_instance_profile_name
  instance_types                = var.instance_types
  key_pair                      = var.key_name
  security_group_ids            = var.security_group_ids
  sns_topic_arn                 = var.sns_topic_arn
  subnet_id                     = var.subnet_id
  tags                          = var.tags
  terminate_instance_on_failure = var.terminate_instance_on_failure

  logging {
      s3_logs {
        s3_bucket_name = var.s3_bucket_name
        s3_key_prefix  = var.s3_key_prefix
      }
  }
}