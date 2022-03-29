variable "instance_type" {
    description = "The AWS instance type (x86_64 only) of the host to be created."
    default = "t3.medium"
}

variable "hostname" {
    description = "The name of the host to be created."
}

variable "volume_size" {
    default = 20
    description = "Root disk size in gigabytes, defaults to '20'."
}