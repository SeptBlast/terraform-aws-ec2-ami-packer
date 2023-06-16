# terraform-aws-imagebuilder-pipeline
Terraform module for creating EC2 Image Builder Pipelines 

## Example
Here's what using the module will look like. You can add more parameters as needed.
```hcl
module "image_builder_pipeline" { 
  source = "module_source_path/image_pipeline"

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

----------------------------------------------------------------


## Outputs
| Name | Description |
|------|-------------|
|  arn | The ARN of the EC2 ImageBuilder Pipeline.|


## Reference to the documentation
| <a href="https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/resources/imagebuilder_image_pipeline">ImageBuilder Pipeline</a> |


## Optional Build Scheduling
Builds are scheduled by a cron pattern. The pipeline takes a schedule argument as follows:

```hcl
  schedule = {
    PipelineExecutionStartCondition = "EXPRESSION_MATCH_AND_DEPENDENCY_UPDATES_AVAILABLE"
    ScheduleExpression              = "cron(0 0 * * mon)"
  }
```

The default expects an upstream AMI as a parent image and will build weekly *only if an updated image is found upstream*. By setting `PipelineExecutionStartCondition = "EXPRESSION_MATCH_ONLY"`, the build pipeline will always run.

When scheduling linked jobs, it is important to be mindful of the cron schedules. If both pipelines run with `ScheduleExpression = "cron(0 0 * * mon)"`, the downstream build will always run one week late. Due to the testing phase and startup/teardown time, even a short EC2 Image Builder process can take over 15 minutes to run end to end. Complex test suites can take much longer.


