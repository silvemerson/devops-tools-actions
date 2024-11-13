# entrypoint.sh
#!/bin/bash
set -e

# Exemplo de uso do SonarScanner, Terraform e kubectl
echo "Running SonarScanner analysis..."
sonar-scanner -Dsonar.projectKey=$SONAR_PROJECT_KEY \
              -Dsonar.sources=$SONAR_SOURCES \
              -Dsonar.host.url=$SONAR_HOST_URL \
              -Dsonar.login=$SONAR_LOGIN

echo "Running Terraform..."
terraform init
terraform plan
terraform apply -auto-approve

echo "Running kubectl..."
kubectl $@
