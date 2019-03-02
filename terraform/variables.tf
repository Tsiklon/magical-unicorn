variable "public_key_path" {
  description = <<DESCRIPTION
Path to the SSH public key to be used for authentication.
Ensure this keypair is added to your local SSH agent so provisioners can
connect.
Example: ~/.ssh/terraform.pub
DESCRIPTION
}

variable "key_name" {
  description = "Desired name of AWS key pair"
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "eu-west-1"
}

# Ubuntu 18.04 LTS (x64) - February 2019 image
variable "aws_amis" {
  default = {
    eu-west-1 = "ami-0c21eb76a5574aa2f"
  }
}
