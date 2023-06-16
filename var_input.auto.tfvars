aws_region = "us-west-2"

key_name = "pkhai-ami-builds"

security_group_ids = [
  "sg-0000000000000"
]

subnet_id = "subnet-0000000000"

iam_instance_role = "CLD-SS-Automation-Admin-NPRD"

components_list = {
  c1 = {
    component_version = "1.0.0"
    description       = "test"
    data              = "c1"
    name              = "mit-hardening-test"
  },
  c2 = {
    component_version = "1.0.0"
    description       = "test2"
    data              = "c2"
    name              = "mit-hardening-v-script"
  }

}

tags = {
  owner : "sample@example.com",
  managed_by : "Terraform"
}
