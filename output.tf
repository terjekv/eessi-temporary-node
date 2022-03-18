output "node" {
  value = "${ var.hostname } : ${ aws_eip.node.public_ip } (${ aws_eip.node.public_dns })"
}

