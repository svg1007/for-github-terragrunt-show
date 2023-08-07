terraform {
  source = "${dirname(find_in_parent_folders())}/modules//custom/custom-ec2"

  extra_arguments "custom_vars" {
    commands = [
      "init",
      "apply",
      "plan"
    ]
  }
}

include "root" {
  path = find_in_parent_folders()
}

dependency "s3" {
  config_path = "../s3"
  mock_outputs = {
    s3_bucket_id = "something"
  }
}

include "common" {
  path   = "../common.hcl"
  expose = true
}

inputs = {
  resource_name = include.common.locals.resource_name
  tags          = include.common.locals.tags

  ec2_instance_defaults = {
    ami                         = "ami-0ec7f9846da6b0f61"
    instance_type               = "t3.micro"
    subnet_id                   = "subnet-12312312312312312"
    associate_public_ip_address = false
  }

  ec2_instance_items = {
    instance1 = {
      name = dependency.s3.outputs.s3_bucket_id
    }
  }

  keypair_create_private_key = true
}
