
module "image_builder_component" {
  source = "./image_component"

  name              = "NPRD-MIT-AmzLnx-InitialSetupBasicHardening"
  platform          = "Linux"
  component_version = "1.0.8"
  description       = "Component for Amz linux initial setup and basic hardening"
  data              = ("InitialSetupBasicHardening.yml")
  tags = {
    Name  = "NPRD-MIT-AmzLnx-InitialSetupBasicHard"
    Owner = "Khaip"
  }

}

module "image_builder_distribution" {
  source = "./image_distribution"

  name            = "NPRD-Amazon-Linux-Distribution"
  ami_description = "Distribution settings for NPRD Amazon Linux AMI"
  ami_tags = {
    "AMI unique key" = "NPRD_AmazonLinux2",
    "Creator"        = "sample@example.com",
    "OwnerID"        = "MIT_CLOUD_OPS",
    "Platform"       = "Linux",
    "Name"           = "NPRD-Amazon-Linux-Distribution",
    "ami_type"       = "Standard",
    "OS"             = "AmazonLinux2"
  }
  ami_region = var.aws_region
  tags = {
    Name = "NPRD-Amazon-Linux-Distribution"
  }
}

module "image_builder_infrastructure" {
  source = "./image_infrastructure"

  name                          = "AMI-Builds-InfraConfig"
  description                   = "Infrastrucuture Configuration for AMI Builds"
  iam_instance_profile_name     = var.iam_instance_role
  instance_types                = ["t2.small"]
  key_name                      = var.key_name
  security_group_ids            = var.security_group_ids
  subnet_id                     = var.subnet_id
  terminate_instance_on_failure = true
  s3_bucket_name                = "nprd-mit-image-builder"
  s3_key_prefix                 = "/"
  tags = {
    Name = "AMI-Builds-InfraConfig"
  }

}

module "image_builder_recipe" {
  source = "./image_recipe"

  name           = "NPRD-AmazonLinux-Recipe"
  description    = "Image Recipe for NPRD Amazon Linux AMI"
  volume_size    = 8
  volume_type    = "gp3"
  iops           = 3000
  parent_image   = "arn:aws:imagebuilder:us-west-2:aws:image/amazon-linux-2-x86/x.x.x"
  platform       = "Linux"
  recipe_version = "1.0.0"
  components = flatten([
    [
      { arn = "arn:aws:imagebuilder:us-west-2:aws:component/aws-cli-version-2-linux/1.0.3/1" },
      { arn = "arn:aws:imagebuilder:us-west-2:aws:component/python-3-linux/1.0.2/1" }
    ]
  ])
  tags = {
    Name = "NPRD-AmazonLinux-Recipe"
  }
}

module "image_builder_pipeline" {
  source = "./image_pipeline"

  name                         = "NPRD-NonAD-AmazonLinux"
  description                  = "Imagebuilder pipeline for NPRD NonAD AmazonLinux. This is for ENCAP and Affiliated Accounts"
  image_recipe                 = module.image_builder_recipe.arn
  infrastructure_configuration = module.image_builder_infrastructure.arn
  distribution_configuration   = module.image_builder_distribution.arn
  tags = {
    Name = "NPRD-NonAD-AmazonLinux"
  }

}

