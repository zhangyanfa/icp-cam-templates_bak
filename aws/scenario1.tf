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

resource "aws_key_pair" "cam_public_key" {
    key_name = "${var.public_ssh_key_name}"
    public_key = "${var.public_ssh_key}"
}

resource "aws_instance" "cam_centos_micro" {
    instance_type = "t2.micro"
    ami = "${lookup(var.aws_amis, var.aws_region)}"
    subnet_id = "${var.subnet_id}"
    key_name = "${aws_key_pair.cam_public_key.id}"

    associate_public_ip_address = true

    block_device {
        device_name = "/dev/xvda1"
        volume_type = "gp2"
        volume_size = 150
    }
}