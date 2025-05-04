.PHONY: deploy destroy simulate install wait

install:
	clear
	@echo "📦 Installing Python dependencies..."
	@pip install --quiet boto3 pandas
	@echo "✅ All dependencies installed successfully."
	@sleep 2
	clear

wait:
	@echo "⏳ Waiting for AWS services to stabilize..."
	@bash -c 'secs=20; \
	echo -n "Waiting $$secs seconds... "; \
	while [ $$secs -gt 0 ]; do \
	  printf "\r⏳ Waiting %02d seconds... " "$$secs"; \
	  sleep 1; \
	  secs=$$((secs - 1)); \
	done; \
	clear; \
	echo "✅ Services are ready!"'

deploy: install
	@echo "🚀 Provisioning infrastructure with Terraform..."
	@cd infrastructure && terraform init -input=false
	@cd infrastructure && terraform apply -auto-approve
	@echo "✅ Infrastructure provisioned successfully!"
	
	@make simulate

simulate:
	clear
	@make wait
	@sleep 2
	clear
	@echo "📡 Running the simulator..."
	@sleep 2
	clear
	@cd src && python browsing_simulator.py

destroy:
	clear
	@echo "🧹 Cleaning up resources..."
	@sleep 2
	@cd infrastructure && terraform destroy -auto-approve
	@echo "✅ All cleaned up!"