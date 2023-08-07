##########
## AWS EC2 instance module
##########
module "ec2_instance" {
  source = "../../community/ec2/wrappers"

  defaults = var.ec2_instance_defaults
  items    = var.ec2_instance_items
}
 
##########
## AWS Keypair module
##########
module "keypair" {
  source = "../../community/keypair"

  create                = var.keypair_create
  key_name              = var.resource_name
  key_name_prefix       = var.keypair_key_name_prefix
  public_key            = var.keypair_public_key
  create_private_key    = var.keypair_create_private_key
  private_key_algorithm = var.keypair_private_key_algorithm
  private_key_rsa_bits  = var.keypair_private_key_rsa_bits

  tags = var.tags
}