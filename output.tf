output "node" {
  value = "${ var.hostname } : ${ aws_instance.node.public_ip } (${ aws_instance.node.public_dns })"
}

