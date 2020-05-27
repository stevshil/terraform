resource "null_resource" "waitfordb" {
  provisioner "local-exec" {
    command = "until mysql -h ${module.db.this_db_instance_address} -u ${var.dbuser} -p${var.dbpassword} -e 'show databases'; do sleep 30; done"
  }
}

resource "null_resource" "clonerepo" {
  depends_on = [null_resource.waitfordb]
  provisioner "local-exec" {
    command = "git clone https://bitbucket.org/stevshil/petclinicmysqlopenshift.git"
  }
}

resource "null_resource" "loadschema" {
  depends_on = [null_resource.waitfordb, null_resource.clonerepo]
  provisioner "local-exec" {
    command = "mysql -h ${module.db.this_db_instance_address} -u ${var.dbuser} -p${var.dbpassword} < petclinicmysqlopenshift/src/main/resources/db/mysql/schema.sql"
  }
}

resource "null_resource" "loaddata" {
  depends_on = [null_resource.loadschema]
  provisioner "local-exec" {
    command = "mysql -h ${module.db.this_db_instance_address} -u ${var.dbuser} -p${var.dbpassword} petclinic < petclinicmysqlopenshift/src/main/resources/db/mysql/data.sql"
  }
}
