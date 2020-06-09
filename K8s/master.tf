resource "aws_instance" "master" {
  ami                    = var.ami
  instance_type          = var.kube_type
  key_name               = var.sshkey
  subnet_id              = var.subnetid
  vpc_security_group_ids = var.sgids
  tags = merge(
    var.tags,
    map(
      "Name", join("", [var.tags.Name, "-Master"])
    )
  )
}

resource "aws_route53_record" "master" {
  zone_id = var.dnszone
  name    = "${var.prefix}-master.${var.dnssuffix}"
  type    = "A"
  ttl     = "60"
  records = [aws_instance.master.public_ip]
}

