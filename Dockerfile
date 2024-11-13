# Dockerfile
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

# Copia o script da ação para o contêiner
COPY entrypoint.sh /entrypoint.sh

# Permissões para o ponto de entrada
RUN chmod +x /entrypoint.sh

# Define o ponto de entrada para a GitHub Action
ENTRYPOINT ["/entrypoint.sh"]
