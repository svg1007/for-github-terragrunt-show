variable "resource_name" {
  type        = string
  description = "The name of the resource. It will be used as a name for mostly all of the resources deployed by this module."
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

##########
## EC2 module
##########

variable "ec2_instance_defaults" {
  description = "Map of default values which will be used for each item."
  type        = any
  default     = {}
}

variable "ec2_instance_items" {
  description = "Maps of items to create a wrapper from. Values are passed through to the module."
  type        = any
  default     = {}
}


##########
## AWS Keypair module
##########

variable "keypair_create" {
  description = "Determines whether resources will be created (affects all resources)"
  type        = bool
  default     = true
}

variable "keypair_key_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with `key_name`"
  type        = string
  default     = null
}

variable "keypair_public_key" {
  description = "The public key material"
  type        = string
  default     = ""
}

variable "keypair_create_private_key" {
  description = "Determines whether a private key will be created"
  type        = bool
  default     = false
}

variable "keypair_private_key_algorithm" {
  description = "Name of the algorithm to use when generating the private key. Currently-supported values are `RSA` and `ED25519`"
  type        = string
  default     = "RSA"
}

variable "keypair_private_key_rsa_bits" {
  description = "When algorithm is `RSA`, the size of the generated RSA key, in bits (default: `4096`)"
  type        = number
  default     = 4096
}
