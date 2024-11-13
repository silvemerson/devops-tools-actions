#!/bin/bash

# Executando o SonarScanner
if [ -n "$SONAR_PROJECT_KEY" ] && [ -n "$SONAR_SOURCES" ] && [ -n "$SONAR_HOST_URL" ] && [ -n "$SONAR_LOGIN" ]; then
  echo "Running SonarScanner with project key: $SONAR_PROJECT_KEY"
  sonar-scanner \
    -Dsonar.projectKey=$SONAR_PROJECT_KEY \
    -Dsonar.sources=$SONAR_SOURCES \
    -Dsonar.host.url=$SONAR_HOST_URL \
    -Dsonar.login=$SONAR_LOGIN
else
  echo "No SonarScanner execution configured. Make sure to provide all required environment variables."
fi

# Executando kubectl
if [ -n "$KUBECTL_COMMAND" ]; then
  echo "Running kubectl with command: $KUBECTL_COMMAND"
  kubectl $KUBECTL_COMMAND
else
  echo "No kubectl command provided. Please specify the Kubernetes commands."
fi

# Executando Terraform
if [ -n "$TERRAFORM_COMMAND" ]; then
  echo "Running Terraform with command: $TERRAFORM_COMMAND"
  terraform $TERRAFORM_COMMAND
else
  echo "No Terraform command provided. Make sure to specify valid Terraform commands."
fi
