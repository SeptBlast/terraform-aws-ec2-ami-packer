# image recipe
resource "aws_imagebuilder_image_recipe" "this" {
  block_device_mapping {
    device_name = var.device_name
    ebs {
      delete_on_termination = var.delete_on_termination
      volume_size           = var.volume_size
      volume_type           = var.volume_type
      iops                  = var.iops
      throughput            = var.throughput
    }
  }

  dynamic "systems_manager_agent" {
    for_each = var.platform == "Linux" ? { "default" = true } : {}
    content {
      name                  = "systems_manager_agent"
      uninstall_after_build = var.uninstall_after_build
    }
  }

  dynamic "component" {
    for_each = var.component_arns
    content {
      component_arn = component.value.arn
    }
  }


  /*component {
        component_arn = var.component_arns[0]
  }*/
  /*dynamic component {
    for_each = toset(var.component_arns)
    content {
      component_arn = each.value
    }
  }
  */

  name              = var.name
  parent_image      = var.parent_image
  version           = var.recipe_version
  working_directory = var.working_directory
  tags              = var.tags
}
