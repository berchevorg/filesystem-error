apply-prod:
	terraform workspace select prod
	echo ${AWS_ACCOUNT_ID} && terraform apply -var-file=example.tfvars