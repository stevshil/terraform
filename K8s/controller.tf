data "template_file" "servers" {
  template = file("controller.tmpl")
  vars = {
    masterip  = aws_instance.master.private_ip
    worker1ip = element(aws_instance.worker.*.private_ip, 0)
    worker2ip = element(aws_instance.worker.*.private_ip, 1)
  }
}

resource "aws_instance" "controller" {
  ami                    = var.ami
  instance_type          = var.controller_type
  key_name               = var.sshkey
  subnet_id              = var.subnetid
  vpc_security_group_ids = var.sgids
  user_data              = file("controller.sh")
  tags = merge(
    var.tags,
    map(
      "Name", join("", [var.tags.Name, "-Controller"])
    )
  )

  provisioner "file" {
    source      = var.sshkeyfile
    destination = "/home/ec2-user/tf_rsa"

    connection {
      user        = "ec2-user"
      type        = "ssh"
      host        = self.public_ip
      private_key = file(var.sshkeyfile)
    }
  }

  provisioner "file" {
    content     = data.template_file.servers.rendered
    destination = "/home/ec2-user/inventory.ini"

    connection {
      user        = "ec2-user"
      type        = "ssh"
      host        = self.public_ip
      private_key = file(var.sshkeyfile)
    }
  }

  provisioner "remote-exec" {
    inline = [
      "#!/bin/bash -xv",
      "until grep 'Up .* seconds' /var/log/cloud-init-output.log; do sleep 10; done",
      "sudo mv /home/ec2-user/tf_rsa /root/.ssh/id_rsa",
      "sudo chown root:root /root/.ssh/id_rsa",
      "sudo chmod 600 /root/.ssh/id_rsa",
      "echo -e 'cd /root/kubespray\nnohup /usr/local/bin/ansible-playbook -i /home/ec2-user/inventory.ini --become --become-user=root /root/kubespray/cluster.yml >build.log 2>build.err &' >/home/ec2-user/buildcluster",
      "chmod 755 /home/ec2-user/buildcluster",
      "sleep 5"
    ]

    connection {
      user        = "ec2-user"
      type        = "ssh"
      host        = self.public_ip
      private_key = file(var.sshkeyfile)
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 5",
      "nohup /home/ec2-user/buildcluster &"
    ]

    connection {
      user        = "ec2-user"
      type        = "ssh"
      host        = self.public_ip
      private_key = file(var.sshkeyfile)
    }
  }
}

resource "aws_route53_record" "controller" {
  zone_id = var.dnszone
  name    = "${var.prefix}-control.${var.dnssuffix}"
  type    = "A"
  ttl     = "60"
  records = [aws_instance.controller.public_ip]
}
