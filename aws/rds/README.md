# Creating an RDS

This RDS code is more about being able to determine if I am creating a new DB or one from an existing backup.

The intention is that if I'm building a new environment requiring an empty database schema I will want to run the SQL scripts after the RDS has been created and I can connect to it to run the scripts.

If we've been running for a while and there has been a major disaster causing our DB to be unusable then I want to restore from the last working snapshot (backup).

# Requirements

* On system that will run terraform
  - GIT
  - MySQL
* Terraform modules
  - https://registry.terraform.io/modules/terraform-aws-modules/rds/aws/2.15.0
  - 
