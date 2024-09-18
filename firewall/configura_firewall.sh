#!/bin/bash

# Função de log
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}

log "Iniciando configuração do firewall..."

# Zerar todas as regras existentes
log "Limpando regras existentes..."
iptables -F
iptables -X
iptables -Z

# Definir políticas padrão para DROP (bloquear tudo por padrão)
log "Definindo política padrão para DROP..."
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Permitir tráfego de loopback (localhost)
log "Permitir tráfego em loopback (localhost)..."
iptables -A INPUT -i lo -j ACCEPT

# Permitir tráfego já estabelecido
log "Permitir tráfego estabelecido..."
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Permitir ping (ICMP)
log "Permitir ping (ICMP)..."
iptables -A INPUT -p icmp -j ACCEPT

# Permitir SSH (porta 22)
log "Permitindo acesso SSH na porta 22..."
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Permitir HTTP (porta 80) e HTTPS (porta 443)
log "Permitindo HTTP (porta 80) e HTTPS (porta 443)..."
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Adicionar outras portas (se necessário)
# Exemplo: liberar a porta 8080
# iptables -A INPUT -p tcp --dport 8080 -j ACCEPT

# Permitir tráfego DNS (porta 53 UDP)
log "Permitindo DNS (porta 53 UDP)..."
iptables -A INPUT -p udp --dport 53 -j ACCEPT

# Limitar tentativas de conexão SSH (opcional)
log "Limitando tentativas de conexão SSH para evitar brute force..."
iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --set
iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --update --seconds 60 --hitcount 10 -j DROP

# Log de pacotes rejeitados (opcional)
log "Habilitando log para pacotes rejeitados..."
iptables -A INPUT -j LOG --log-prefix "IPTables-Reject: " --log-level 4

# Bloquear todo o restante
log "Bloqueando todo o tráfego não permitido..."
iptables -A INPUT -j REJECT
iptables -A FORWARD -j REJECT

log "Configuração do firewall concluída."

# Salvar as regras do iptables
log "Salvando as regras..."
# No Ubuntu/Debian
iptables-save > /etc/iptables/rules.v4
# No CentOS/RHEL/Fedora
# service iptables save

log "Regras do firewall salvas com sucesso!"
