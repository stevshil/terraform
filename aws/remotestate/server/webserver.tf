
resource "aws_instance" "web1" {
  ami                    = var.image_id[var.region]
  instance_type          = var.instance_type
  key_name               = var.keyname
  vpc_security_group_ids = [data.terraform_remote_state.infra.outputs.web_sec_id]
  subnet_id              = data.terraform_remote_state.infra.outputs.subnet_ids[0]
  user_data              = <<EOF
    #!/bin/bash
    yum -y install httpd
    systemctl enable httpd
    systemctl start httpd
    echo "<h1>Welcome to Steve's web server</h1>" >/var/www/html/index.html
  EOF

  tags = merge(var.tags, { Name = "${var.projectname} ${var.env} VPC Demo" })
}
