#!/bin/bash

# Configurações
DESTINO="8.8.8.8"         # Destino para teste de conectividade (Google DNS)
PING_COUNT=4              # Número de pacotes ping a serem enviados
LOG_FILE="/var/log/monitoramento_rede.log"  # Local do arquivo de log

# Função de log
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> $LOG_FILE
}

# Função para testar conectividade com ping
testar_ping() {
    echo "Testando conectividade com $DESTINO usando ping..."
    PING_RESULT=$(ping -c $PING_COUNT $DESTINO)
    if [ $? -eq 0 ]; then
        log "Ping bem-sucedido para $DESTINO. Resultado:\n$PING_RESULT"
        echo "Ping bem-sucedido. Verifique o log para mais detalhes."
    else
        log "Falha no ping para $DESTINO. Resultado:\n$PING_RESULT"
        echo "Falha no ping. Verifique o log para mais detalhes."
    fi
}

# Função para traçar rota com traceroute
testar_traceroute() {
    echo "Traçando rota até $DESTINO usando traceroute..."
    TRACEROUTE_RESULT=$(traceroute $DESTINO)
    log "Resultado do traceroute para $DESTINO:\n$TRACEROUTE_RESULT"
    echo "Traceroute concluído. Verifique o log para mais detalhes."
}

# Executar as funções de monitoramento
testar_ping
testar_traceroute
