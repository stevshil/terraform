all: infra srv

init: initinfra initsrv

initinfra:
	cd vpc && terraform init

initsrv:
	cd server && terraform init

infra:
	@echo "Building/Updating infrastructure"
	cd vpc && terraform apply -auto-approve -var-file=$(ENV).tfvars

srv:
	@echo "Building/Updating the web server"
	cd server && terraform apply -auto-approve -var-file=$(ENV).tfvars

delete:	rmsrv rminfra

rmsrv:
	@echo "Deleting the web server"
	cd server && terraform destroy -auto-approve -var-file=$(ENV).tfvars

rminfra:
	@echo "Deleting the infrastructure"
	cd vpc && terraform destroy -auto-approve -var-file=$(ENV).tfvars

plan: planinfra plansrv

planinfra:
	@echo  "Planing the infrastructure"
	cd vpc && terraform plan -var-file=$(ENV).tfvars
	cd ..

plansrv:
	@echo "Planning the web server"
	cd server && terraform plan -var-file=$(ENV).tfvars

show: showinfra showsrv

showinfra:
	cd vpc && terraform show

showsrv:
	cd server && terraform show
