# terraform-aws-imagebuilder-Infrastructure
Terraform module for creating EC2 Image Builder Infrastructure Configuration

## Example
Here's what using the module will look like. You can add more parameters as needed.
```hcl
module "image_builder_infrastructure" {
  source = "module_source_path/image_infrastructure"

  name                          = "Name of infrastructure_configuration"
  description                   = ""
  iam_instance_profile_name     = var.iam_instance_role
  instance_types                = ["t2.small"]
  key_name                      = var.key_name
  security_group_ids            = var.security_group_ids
  subnet_id                     = var.subnet_id
  terminate_instance_on_failure = true
  s3_bucket_name                = "nprd-mit-image-builder"
  s3_key_prefix                 = "/"
  tags = { 
      Name = ""
      Owner = ""
  }
  
}

```

----------------------------------------------------------------


## Outputs
| Name | Description |
|------|-------------|
|  arn | The ARN of the EC2 ImageBuilder Infrastructure.|



## Reference to the documentation
| <a href="https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/resources/imagebuilder_infrastructure_configuration">ImageBuilder Infrastructure Configuration</a> |


