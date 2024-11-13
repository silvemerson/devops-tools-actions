#!/bin/bash


if [[ "$1" =~ ^kubectl ]]; then
    echo "Executando kubectl: $1"
    eval "$1"
else
    echo "Comando kubectl inválido ou não permitido."
fi

if [[ "$2" =~ ^sonar-scanner ]]; then
    echo "Executando SonarScanner: $2"
    eval "$2"
else
    echo "Comando SonarScanner inválido ou não permitido."
fi

if [[ "$2" =~ ^terraform ]]; then
    echo "Executando Terraform: $2"
    eval "$2"
else
    echo "Comando Terraform inválido ou não permitido."
fi
