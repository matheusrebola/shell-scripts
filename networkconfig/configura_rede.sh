#!/bin/bash

# Variáveis de configuração
INTERFACE="eth0"                    # Nome da interface de rede (ex.: eth0, enp0s3, etc.)
IP_ADDRESS="192.168.1.100"           # Endereço IP a ser configurado
NETMASK="255.255.255.0"              # Máscara de rede
GATEWAY="192.168.1.1"                # Gateway padrão
DNS1="8.8.8.8"                       # Primeiro servidor DNS (Google DNS)
DNS2="8.8.4.4"                       # Segundo servidor DNS (Google DNS)

# Função para aplicar a configuração de rede
configurar_rede() {
    echo "Configurando a interface $INTERFACE com IP $IP_ADDRESS..."
    sudo ifconfig $INTERFACE $IP_ADDRESS netmask $NETMASK up
    echo "Configurando o gateway padrão como $GATEWAY..."
    sudo route add default gw $GATEWAY $INTERFACE
    echo "Configurando servidores DNS..."
    echo -e "nameserver $DNS1\nnameserver $DNS2" | sudo tee /etc/resolv.conf > /dev/null
    echo "Configuração de rede aplicada com sucesso!"
}

# Função para exibir a configuração atual
mostrar_configuracao() {
    echo "Configuração atual de rede da interface $INTERFACE:"
    ifconfig $INTERFACE
    echo "Gateway padrão:"
    netstat -rn | grep 'UG[ \t]' | awk '{print $2}'
    echo "Servidores DNS:"
    cat /etc/resolv.conf | grep "nameserver"
}

# Executar as funções
configurar_rede
mostrar_configuracao
