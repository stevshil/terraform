init:
	@terraform init

apply:
	@terraform apply --auto-approve

plan:
	@terraform fmt
	@terraform plan

clean:
	@terraform destroy --auto-approve

fix:
	@terraform plan -target=$(target)
	@read -p "Apply this change? " RESPONSE; \

	@if [ "$$RESPONSE" == "y" ]; then \
		terraform apply --auto-approve -target=$(target); \
	fi; \
