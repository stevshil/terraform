resource "aws_instance" "ec2" {
  count                       = 2
  ami                         = var.image_id
  instance_type               = "t2.micro"
  key_name                    = var.sshkey
  security_groups             = var.sgs
  associate_public_ip_address = true
  subnet_id                   = var.subnets
  user_data                   = file("provision.sh")
  tags = merge(
    var.tags,
    map(
      "Name", join("", [var.tags.Name, count.index])
    )
  )

  # Copy files to remote to build dockers
  provisioner "file" {
    diruse = count == 0 ? "phpapp" : "phpdb"
    source = "${diruse}/Dockerfile"
    destination = "/home/ec2-user/Dockerfile"
  }
  provisioner "file" {
    diruse = count == 0 ? "phpapp" : "phpdb"
    source = "${diruse}/readme.sh"
    destination = "/home/ec2-user/Dockerfile"
  }
}
