resource "aws_instance" "web1" {
  ami                    = var.image_id[var.region]
  instance_type          = var.instance_type
  key_name               = var.keyname
  vpc_security_group_ids = [var.sec_grp_id]
  subnet_id              = var.subnet_id
  tags                   = merge(var.tags, { Name = var.projectname })

  provisioner "remote-exec" {
    inline = ["/usr/bin/hostname"]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file(var.pemfile)
      host        = self.public_dns
    }
  }
}

resource "null_resource" "create_inventory" {
  depends_on = [aws_instance.web1]
  provisioner "local-exec" {
    command     = "echo -e '[webservers]\n${aws_instance.web1.public_dns}' >hosts"
    working_dir = "../ansibleprov/environments/${var.env}"
  }
}

resource "null_resource" "run_ansible" {
  depends_on = [null_resource.create_inventory]
  provisioner "local-exec" {
    command     = "ansible-playbook -i environments/${var.env} build.yml"
    working_dir = "../ansibleprov"
  }
}

resource "null_resource" "check_instance" {
  depends_on = [null_resource.run_ansible]
  provisioner "local-exec" {
    command = "curl -s ${aws_instance.web1.public_dns}"
  }
}

resource "null_resource" "delete_inventory" {
  depends_on = [null_resource.check_instance]
  provisioner "local-exec" {
    command     = "rm -f hosts"
    working_dir = "../ansibleprov/environments/${var.env}"
  }
}
