# terraform-aws-cld-aws-imagebuilder-pipelines

Terraform module to provision and configure EC2 ImageBuilder Pipelines.

## Example

Here's what using the module will look like. Note that this module needs at least one recipe and component to be useful. See examples below for details.

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

module "image_builder_distribution"{
  source            = "app.terraform.io/SeptBlast-CIT/cld-aws-imagebuilder-pipelines/aws//image_distribution"
  version           = ">= 1.0.0"

  name               = "Name of distribution"
  ami_description    = ""
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

module "image_builder_infrastructure" {
  source            = "app.terraform.io/SeptBlast-CIT/cld-aws-imagebuilder-pipelines/aws//image_infrastructure"
  version           = ">= 1.0.0"

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

module "image_builder_recipe" {
  source            = "app.terraform.io/SeptBlast-CIT/cld-aws-imagebuilder-pipelines/aws//image_recipe"
  version           = ">= 1.0.0"

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

module "image_builder_pipeline" {
  source            = "app.terraform.io/SeptBlast-CIT/cld-aws-imagebuilder-pipelines/aws//image_pipeline"
  version           = ">= 1.0.0"

  name                         = "Name of the image pipeline"
  description                  = ""
  image_recipe                 = module.image_builder_recipe.arn
  infrastructure_configuration = module.image_builder_infrastructure.arn
  distribution_configuration   = module.image_builder_distribution.arn
  schedule_expression          = ""
  tags = {
      Name = ""
      Owner = ""
  }

}


```

## About

Allows the creation of EC2 Image Builder Pipelines from components, recipe, distribution_configuration, infrastructure_configuration and pipeline.
