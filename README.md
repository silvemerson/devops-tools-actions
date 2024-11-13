# Custom GitHub Action with SonarScanner, kubectl, and Terraform

Esta ação executa análises de código com SonarScanner, aplica configurações de infraestrutura com Terraform e gerencia recursos Kubernetes com kubectl.

## Inputs

- `kubectl-args`: Argumentos opcionais para o comando `kubectl`.

## Environment Variables

- `SONAR_PROJECT_KEY`: Chave do projeto no SonarQube.
- `SONAR_SOURCES`: Diretório das fontes para análise.
- `SONAR_HOST_URL`: URL do servidor SonarQube.
- `SONAR_LOGIN`: Token de autenticação SonarQube.

## Exemplo de Uso

```yaml
jobs:
  run-custom-action:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3

      - name: Run custom action
        uses: your-username/your-action-repo@v1
        with:
          kubectl-args: "get namespaces"
        env:
          SONAR_PROJECT_KEY: "your_project_key"
          SONAR_SOURCES: "./src"
          SONAR_HOST_URL: "http://your-sonarqube-url"
          SONAR_LOGIN: ${{ secrets.SONAR_TOKEN }}
```
### 3. Versionamento e Criação de Tags

O GitHub Marketplace exige que ações estejam versionadas. Para isso:
1. Faça o commit das mudanças na ação no repositório.
2. Crie uma tag com o número da versão (por exemplo, `v1.0.0`).

Execute no terminal:

```bash
git add .
git commit -m "Initial release"
git tag -a v1.0.0 -m "Release version 1.0.0"
git push origin v1.0.0
```

