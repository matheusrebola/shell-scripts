#!/bin/bash

# Configurações
LOG_FILE="/var/log/monitoramento_sistema.log"  # Local do arquivo de log
CPU_THRESHOLD=80                               # Limite de uso de CPU em porcentagem
MEMORY_THRESHOLD=80                            # Limite de uso de memória em porcentagem
CHECK_INTERVAL=5                               # Intervalo de verificação em segundos

# Função de log
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> $LOG_FILE
}

# Função para verificar o uso de CPU
check_cpu_usage() {
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
        log "ALERTA: Uso de CPU alto! Uso atual: ${CPU_USAGE}%"
    else
        log "Uso de CPU: ${CPU_USAGE}%"
    fi
}

# Função para verificar o uso de memória
check_memory_usage() {
    MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    if (( $(echo "$MEMORY_USAGE > $MEMORY_THRESHOLD" | bc -l) )); then
        log "ALERTA: Uso de memória alto! Uso atual: ${MEMORY_USAGE}%"
    else
        log "Uso de Memória: ${MEMORY_USAGE}%"
    fi
}

log "Iniciando monitoramento de CPU e Memória..."

# Loop infinito para monitorar continuamente
while true; do
    check_cpu_usage
    check_memory_usage
    sleep $CHECK_INTERVAL
done
