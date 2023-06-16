# terraform-aws-imagebuilder-components

Terraform module for creating EC2 ImageBuilder Component

## Example

Here's what using the module will look like.

```hcl
module "image_builder_component" {
  source            = "app.terraform.io/SeptBlast-CIT/cld-aws-imagebuilder-pipelines/aws//image_component"
  version           = ">= 1.0.0"
  name               = "Name of component"
  platform           = "Linux"
  component_version  = "1.0.7"
  description        = ""
  data               = "${("data_path_filename")}"
  os_flavor          = "Path name of your data folder to the component"
  tags  = {
      Name  = ""
      Owner = ""
  }

}
```

---

## Outputs

| Name | Description                                |
| ---- | ------------------------------------------ |
| arn  | The ARN of the EC2 ImageBuilder Component. |

## Reference to the documentation

| <a href="https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/resources/imagebuilder_component">ImageBuilder Component</a> |
