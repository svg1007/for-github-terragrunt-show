terraform {
  source = "${dirname(find_in_parent_folders())}/modules//community/s3"

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

include "common" {
  path = "../common.hcl"
  expose = true
}

inputs = {
  resource_name = include.common.locals.resource_name
  tags          = include.common.locals.tags

  block_public_acls       = false
  ignore_public_acls      = false
  restrict_public_buckets = false
  attach_public_policy    = true
  block_public_policy     = true
}