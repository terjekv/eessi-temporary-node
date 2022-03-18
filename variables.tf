
locals {
    hostname      = "${ var.hostname }.testing"
    ami           =  data.aws_ami.aws_aarch64.id
    availability_zone = "eu-central-1a"
}

variable "region" {
  default = "eu-central-1"
}

variable "instance_type" {
    description = "The AWS instance type (x86_64 only) of the host to be created."
}

variable "hostname" {
    description = "The name of the host to be created."
}

variable "volume_size" {
    default = 20
    description = "Root disk size in gigabytes, defaults to '20'."
}

variable "aws_route53_infra_zoneid" {
  default = "Z08669212W005E4G61IF8"
}
