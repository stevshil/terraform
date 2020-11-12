# Terraform remote state example

## The layout

In this project we have 2 seperate Terraform module, but one of the modules relies on data coming from the other, but requires it's own state.

```
.
+-- vpc
|   +-- backend.tf
|   +-- provider.tf
|   +-- variables.tf
|   +-- vpc.tf
|   +-- security.tf
|   +-- outputs.tf
+-- server
    +-- backend.tf
    +-- provider.tf
    +-- main.tf
    +-- variables.tf
    +-- webserver.tf
    +-- outputs.tf
+-- setenv
+-- Makefile
```

## Running the code

This project uses a **Makefile** to run the relevant commands to manage the project.

Example:

```
make infra ENV=dev
```

This will build the infrastructure for the project using the dev.tfvars files.

## The VPC

The code in this directory is the start of the project and creates the network infrastructure and the security group required by the project.

It makes use of an S3 bucket to store the state and enable the project to be ran across multiple systems ensuring that the state is always up to date.

You can check the plan using;

```
make planinfra ENV=qa
```

To build the infrastructure with your own tfvars file, let's say you call it qa.tfvars;

```
make infra ENV=qa
```

You can then view the state with;

```
make showinfra
```

This will show you the remote Terraform state that is stored in your S3 bucket.

**NOTE:** To ensure that the *webserver* code can use the variable you'll notice our **outputs.tf** file.  This file creates an Outputs section in the state file that will allow us to use these attribute names in the *webserver* code.

## The Webserver

Notice that in this directory we have a backend.tf which points to a different folder in the S3 bucket so that we can store the state in a shared location for this part of our environment.

You can view the state for the webserver using;

```
make showsrv
```

For this part of the project to work though it requires the state of the **vpc** folder, which is done through the **main.tf** file.  In this file we have used the **data** element and the **terraform_remote_state** directive to tell Terraform that we wish to use state from another project, and named it **infra**.  As part of the configuration we tell Terraform where that state is stored.

In the **webserver.tf** you'll notice the use of 2 attributes from the remote state on lines 6 and 7;

```
vpc_security_group_ids = [data.terraform_remote_state.infra.outputs.web_sec_id]
```

```
subnet_id              = data.terraform_remote_state.infra.outputs.subnet_ids[0]
```

In our **vpc/outputs.tf** we created a variable called **web_sec_id** and another called **subnet_ids**

You'll also notice that when we wish to use these we include the **outputs** word to tell the remote state where we are wishing to get the data from.  It is easier to ensure you have outputs from your other terraform code since it is easier.

## The Makefile

Each section is denoted as;

```
name:
```

Where the value before the colon is used after the command **make**, for example if we want to initialize terraform for the whole environment we have an **init** section that calls both **initinfra** and **initsrv** as follows;

```
make init
```
