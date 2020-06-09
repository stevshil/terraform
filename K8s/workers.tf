resource "aws_instance" "worker" {
  count                  = 2
  ami                    = var.ami
  instance_type          = var.kube_type
  key_name               = var.sshkey
  subnet_id              = var.subnetid
  vpc_security_group_ids = var.sgids
  tags = merge(
    var.tags,
    map(
      "Name", join("", [var.tags.Name, "-Worker", count.index])
    )
  )
}

resource "aws_route53_record" "worker" {
  count   = 2
  zone_id = var.dnszone
  name    = "${var.prefix}-worker${count.index}.${var.dnssuffix}"
  type    = "A"
  ttl     = "60"
  records = [element(aws_instance.controller.*.public_ip, count.index)]
}

