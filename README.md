# DevOps Tools - SonarScanner, Terraform, and Kubectl GitHub Action

Este repositório contém uma ação do GitHub personalizada que executa **SonarScanner**, **kubectl**, e **Terraform** em um contêiner Docker.

A ação permite executar esses comandos essenciais de DevOps diretamente em seu pipeline do GitHub Actions de forma simples e integrada.

## Tecnologias Utilizadas

- **SonarScanner**: Ferramenta para análise de código estático e qualidade de código.
- **kubectl**: Ferramenta de linha de comando para interagir com clusters Kubernetes.
- **Terraform**: Ferramenta de infraestrutura como código para provisionamento e gerenciamento de recursos.

## Dockerfile

Este repositório utiliza um Dockerfile para criar uma imagem Docker personalizada que inclui as ferramentas necessárias.

### Dockerfile

```dockerfile
FROM ubuntu:latest

# Instala pacotes básicos e ferramentas necessárias
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    wget \
    gnupg \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Instalação do SonarScanner
RUN wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.8.0.2856-linux.zip \
    && unzip sonar-scanner-cli-4.8.0.2856-linux.zip -d /opt \
    && rm sonar-scanner-cli-4.8.0.2856-linux.zip \
    && ln -s /opt/sonar-scanner-4.8.0.2856-linux/bin/sonar-scanner /usr/local/bin/sonar-scanner

# Instalação do kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl \
    && rm kubectl

# Instalação do Terraform
RUN wget https://releases.hashicorp.com/terraform/1.5.7/terraform_1.5.7_linux_amd64.zip \
    && unzip terraform_1.5.7_linux_amd64.zip -d /usr/local/bin/ \
    && rm terraform_1.5.7_linux_amd64.zip

# Adiciona o SonarScanner ao PATH
ENV PATH="/opt/sonar-scanner-4.8.0.2856-linux/bin:${PATH}"

# Define o ponto de entrada para a GitHub Action
ENTRYPOINT ["/entrypoint.sh"]
