# terraform-aws-imagebuilder-Distribution

Terraform module for creating EC2 Image Builder Distribution Configuration

## Example

Here's what using the module will look like. You can add more parameters as needed.

```hcl
module "image_builder_distribution"{
  source            = "app.terraform.io/SeptBlast-CIT/cld-aws-imagebuilder-pipelines/aws//image_distribution"
  version           = ">= 1.0.0"

  name               = "Name of distribution"
  description        = "Distribution settings for NPRD Amazon Linux AMI"
  ami_name           = "NonAD-V{{imagebuilder:buildVersion}}_AmazonLinux2_{{imagebuilder:buildDate}}"
  ami_tags = {
    "AMI unique key" = "",
    "Creator"        = "sample@example.com",
    "OwnerID"        = "MIT_CLOUD_OPS",
    "Platform"       = "Linux",
    "Name"           = "Amazon-Linux-Distribution",
    "ami_type"       = "Standard",
    "OS"             = "AmazonLinux2"
  }
  ami_region         = var.aws_region
  tags  = {
      Name = ""
      Owner = ""
  }
}
```

---

## Outputs

| Name | Description                                   |
| ---- | --------------------------------------------- |
| arn  | The ARN of the EC2 ImageBuilder Distribution. |

## Reference to the documentation

| <a href="https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/resources/imagebuilder_distribution_configuration">ImageBuilder Distribution Configuration</a> |
