#!/bin/bash

# Exemplo de execução do SonarScanner
if [ -n "$SONAR_PROJECT_KEY" ]; then
  echo "Running SonarScanner..."
  sonar-scanner
else
  echo "No SonarScanner execution configured."
fi

# Exemplo de execução do kubectl (verifica se os argumentos estão disponíveis)
if [ -n "$KUBECTL_ARGS" ]; then
  echo "Running kubectl with args: $KUBECTL_ARGS"
  kubectl $KUBECTL_ARGS
else
  echo "No kubectl arguments provided."
fi

# Exemplo de execução do Terraform (verifica se o comando de terraform está disponível)
if [ -n "$TERRAFORM_ARGS" ]; then
  echo "Running Terraform with args: $TERRAFORM_ARGS"
  terraform $TERRAFORM_ARGS
else
  echo "No Terraform arguments provided."
fi
