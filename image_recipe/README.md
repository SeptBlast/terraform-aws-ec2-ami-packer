# terraform-aws-imagebuilder-recipe
Terraform module for creating EC2 Image Builder Recipe

## Example
Here's what using the module will look like. 
```hcl
module "image_builder_recipe" { 
  source = "module_source_path/image_recipe"

  name                    = "Name of the recipe"     
  description             = "Image Recipe for NPRD Amazon Linux AMI"
  volume_size             = 8
  volume_type             = "gp3"
  iops                    = 3000
  parent_image            = "arn:aws:imagebuilder:us-west-2:aws:image/amazon-linux-2-x86/x.x.x"
  platform                = "Linux"
  recipe_version          = "1.0.0"
  components              = flatten([
                                [
                                  {arn = "arn:aws:imagebuilder:us-west-2:aws:component/aws-cli-version-2-linux/1.0.3/1"},
                                  {arn = "arn:aws:imagebuilder:us-west-2:aws:component/python-3-linux/1.0.2/1" }
                                ]
                                    ])
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
|  arn | The ARN of the EC2 ImageBuilder Recipe.|


## Reference to the documentation
| <a href="https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/resources/imagebuilder_image_recipe">ImageBuilder Recipe</a> |
