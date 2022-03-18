provider "aws" {
  region = var.region
}

terraform {
  required_version = ">= 0.12"
}

resource "aws_instance" "node" {
  ami                    = data.aws_ami.aws_x86_64.id
  instance_type          = var.instance_type
  vpc_security_group_ids = ["ssh_node"]
  key_name               = var.keys.key_name
  monitoring             = true
  availability_zone      = local.availability_zone

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
  zone_id = var.aws_route53_infra_hpc_zoneid
  name    = "${ local.hostname }.infra.eessi-hpc.org"
  type    = "A"
  ttl     = "300"
  records = [aws_eip.node.public_ip]
}
