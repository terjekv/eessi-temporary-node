provider "aws" {
  region = "eu-central-1"
}

terraform {
  required_version = ">= 0.12"
}

resource "aws_instance" "node" {
  ami                    = data.aws_ami.x86_64.id
  instance_type          = var.instance_type
  vpc_security_group_ids = ["ssh_node"]
#  key_name               = var.keys.key_name
  monitoring             = true
  availability_zone      = "eu-central-1a"

  root_block_device {
    volume_size = 20
  }

  lifecycle {
    ignore_changes = [ami, user_data]
  }

  tags = {
#    Owner = var.localuser
    Name = "[TESTING] ${ var.hostname }"
    Backup = "true"
  }
}

resource "aws_route53_record" "core_infra" {
  zone_id = "Z08669212W005E4G61IF8"
  name    = "${ var.hostname }.testing.infra.eessi-hpc.org"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.node.public_ip]
}
