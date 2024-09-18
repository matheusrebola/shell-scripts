#!/bin/bash

# Lista de serviços a serem monitorados
SERVICOS=("apache2" "nginx" "mysql" "postgresql")

# Local do arquivo de log
LOG_FILE="/var/log/monitoramento_servicos.log"

# Função de log
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> $LOG_FILE
}

# Função para monitorar serviços
monitorar_servicos() {
    for SERVICO in "${SERVICOS[@]}"; do
        echo "Verificando status do serviço: $SERVICO..."
        if systemctl is-active --quiet $SERVICO; then
            log "$SERVICO está em execução."
            echo "$SERVICO está em execução."
        else
            log "$SERVICO NÃO está em execução."
            echo "$SERVICO NÃO está em execução!"
        fi
    done
}

# Executar o monitoramento
monitorar_servicos
