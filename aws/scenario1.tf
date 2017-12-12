provider "aws" {
 region = "${var.aws_region}"
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-west-2"
}

variable "subnet_id" {
  description = "Subnet Id"
  default = "subnet-1943137c"
}

variable "public_ssh_key_name" {
  description = "Name of the public SSH key used to connect to the virtual guest"
}

variable "public_ssh_key" {
  description = "Public SSH key used to connect to the virtual guest"
}


variable "aws_amis" {
  default = {
    us-west-2 = "ami-f4533694"
  }
}



resource "aws_key_pair" "icp_singlenode_key" {
    key_name = "${var.public_ssh_key_name}"
    public_key = "${var.public_ssh_key}"
}

resource "tls_private_key" "ssh" {
  algorithm = "RSA"
}
resource "aws_key_pair" "temp_public_key" {
  key_name   = "${var.public_key_name}-temp"
  public_key = "${tls_private_key.ssh.public_key_openssh}"
}

resource "aws_instance" "icp_singlenode" {
    instance_type = "t2.xlarge"
    ami = "${lookup(var.aws_amis, var.aws_region)}"
    subnet_id = "${var.subnet_id}"
    vpc_security_group_ids = ["sg-4555e839"]
    key_name = "${aws_key_pair.icp_singlenode_key.id}"

    associate_public_ip_address = true

    root_block_device {
        volume_type = "standard"
        volume_size = 150
    }
}