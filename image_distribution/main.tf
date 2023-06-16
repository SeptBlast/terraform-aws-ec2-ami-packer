# image distribution config 
resource "aws_imagebuilder_distribution_configuration" "this" {
  name = var.name
  description = var.description
  distribution {
    ami_distribution_configuration {
        description = var.ami_description
        ami_tags    = var.ami_tags

    name = coalesce(var.ami_name, format("%s-{{ imagebuilder:buildDate }}", var.name))
      launch_permission {
        user_ids = var.user_ids
      }
  
    }
    # container_distribution_configuration {
    #     description       = var.container_description
    #     container_tags    = var.container_tags
        
    #   target_repository {   
    #     repository_name = var.repository_name != null ? var.repository_name : "default-repo-name"
    #     service         = "ECR"
    #   }
    # }
  region = var.ami_region
  
  }
  tags = var.tags
}

