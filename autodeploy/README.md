# Script de Automatização de Deploy com Git

Este script realiza o processo de deploy automatizado de uma aplicação. Ele executa as seguintes etapas:

1. Verifica se o repositório local está sincronizado com o remoto.
2. Realiza o `git pull` para obter as últimas atualizações.
3. Executa o build da aplicação (caso necessário).
4. Reinicia o serviço configurado para aplicar as mudanças.

## Pré-requisitos

- Acesso ao repositório Git.
- Permissões adequadas para reiniciar o serviço (via `systemctl` ou outro mecanismo).
- Ferramentas de build instaladas (Maven, Node.js, etc.) caso necessário.
- Permissões sudo configuradas para reiniciar o serviço.

## Como usar

### 1. Clonar o Repositório

Clone este repositório para sua máquina local:

```bash
git clone https://github.com/seu-usuario/deploy-automatizado.git
cd deploy-automatizado

### 2. Configurar o Script

Abra o arquivo deploy.sh e configure os seguintes parâmetros:

    REPO_DIR: O caminho para o diretório do repositório que será atualizado.
    SERVICE_NAME: Nome do serviço que será reiniciado (exemplo: serviço systemd ou qualquer outro).

### 3. Tornar o Script Executável

Dê permissão de execução ao script: chmod +x deploy.sh

### 4. Executar o Script

Execute o script manualmente para realizar o deploy: ./deploy.sh

### 5. Automatizar com Cron (opcional)

Para automatizar o deploy em intervalos regulares, você pode usar o cron. Por exemplo, para executar o deploy diariamente às 3h da manhã:
    Abra o crontab para edição: crontab -e

Adicione a seguinte linha ao final do arquivo:
    0 3 * * * /caminho/para/deploy.sh >> /caminho/para/log_de_deploy.log 2>&1

Isso irá executar o script todos os dias às 3h da manhã e armazenar o log de execução em um arquivo.
### Personalização do Build
O script inclui um comando de build comentado (exemplos para Maven ou Node.js). Dependendo da tecnologia da sua aplicação, ajuste a seção de build do script para a ferramenta que você estiver usando, por exemplo:

    Para aplicações Java (Maven): mvn clean package
    Para aplicações Node.js: npm install && npm run build

Para outras tecnologias, substitua a linha com o comando adequado.
