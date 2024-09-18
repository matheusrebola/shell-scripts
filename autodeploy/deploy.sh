#!/bin/bash

# Configurações
REPO_DIR="/caminho/para/seu/repositorio"   # Diretório do repositório
SERVICE_NAME="nome-do-servico"             # Nome do serviço que será reiniciado (ex: nome do serviço systemd)

# Função de log
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}

log "Iniciando processo de deploy..."

# Navegar até o diretório do repositório
log "Navegando até o diretório do repositório: $REPO_DIR"
cd "$REPO_DIR" || { log "Erro: Diretório não encontrado!"; exit 1; }

# Verificar mudanças locais
log "Verificando se há mudanças não comitadas localmente..."
if [[ -n $(git status --porcelain) ]]; then
    log "Erro: Existem mudanças não comitadas. Favor commitá-las ou stash antes de continuar."
    exit 1
fi

# Atualizar repositório com o último commit
log "Fazendo pull do repositório..."
git pull origin main || { log "Erro ao executar git pull!"; exit 1; }

# Fazer build da aplicação (ajuste conforme a necessidade)
log "Iniciando processo de build..."
# Exemplo: Maven, Node, etc.
# mvn clean package
# npm install && npm run build

log "Build concluído com sucesso!"

# Reiniciar o serviço (ajuste para seu caso)
log "Reiniciando o serviço: $SERVICE_NAME"
sudo systemctl restart "$SERVICE_NAME" || { log "Erro ao reiniciar o serviço!"; exit 1; }

log "Deploy concluído com sucesso!"
