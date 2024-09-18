#!/bin/bash

# Configurações
LOG_DIR="/caminho/para/logs"  # Diretório onde os arquivos de log estão armazenados
DAYS_TO_KEEP=7                # Número de dias para manter os arquivos
LOG_EXTENSION="*.log"         # Extensão dos arquivos a serem apagados (ex: .log, .tmp, etc.)

# Função de log
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}

log "Iniciando processo de limpeza de logs..."

# Verificando se o diretório de logs existe
if [ ! -d "$LOG_DIR" ]; then
    log "Erro: Diretório de logs não encontrado!"
    exit 1
fi

# Excluindo arquivos de log antigos
log "Removendo arquivos com mais de $DAYS_TO_KEEP dias em $LOG_DIR"
find "$LOG_DIR" -type f -name "$LOG_EXTENSION" -mtime +$DAYS_TO_KEEP -exec rm {} \;

# Verificando se o comando find foi bem-sucedido
if [ $? -eq 0 ]; then
    log "Limpeza de logs concluída com sucesso."
else
    log "Erro ao limpar os logs!"
    exit 1
fi
