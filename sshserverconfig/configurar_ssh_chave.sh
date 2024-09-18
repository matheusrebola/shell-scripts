#!/bin/bash

# Variáveis de Configuração
USUARIO="seu_usuario"   # Substitua pelo nome do usuário desejado
PASTA_HOME="/home/$USUARIO"
PASTA_SSH="$PASTA_HOME/.ssh"
ARQUIVO_AUTORIZED_KEYS="$PASTA_SSH/authorized_keys"
CONFIG_SSHD="/etc/ssh/sshd_config"
CHAVE_PRIVADA="$PASTA_HOME/id_rsa"
CHAVE_PUBLICA="$CHAVE_PRIVADA.pub"

# Função para criar chave SSH
gerar_chave_ssh() {
    if [ ! -f "$CHAVE_PRIVADA" ]; then
        echo "Gerando chave SSH para o usuário $USUARIO..."
        ssh-keygen -t rsa -b 4096 -f "$CHAVE_PRIVADA" -N "" -C "$USUARIO"
        cat "$CHAVE_PUBLICA" >> "$ARQUIVO_AUTORIZED_KEYS"
        chown -R $USUARIO:$USUARIO "$PASTA_SSH"
        chmod 700 "$PASTA_SSH"
        chmod 600 "$ARQUIVO_AUTORIZED_KEYS"
        echo "Chave SSH gerada e configurada com sucesso."
    else
        echo "Chave SSH já existe em $CHAVE_PRIVADA."
    fi
}

# Função para configurar o servidor SSH
configurar_servidor_ssh() {
    echo "Configurando servidor SSH para autenticação por chave..."
    
    # Faz backup do arquivo de configuração
    cp "$CONFIG_SSHD" "$CONFIG_SSHD.bak"

    # Configurações de autenticação por chave
    sed -i 's/#\?PasswordAuthentication .*/PasswordAuthentication no/' "$CONFIG_SSHD"
    sed -i 's/#\?PubkeyAuthentication .*/PubkeyAuthentication yes/' "$CONFIG_SSHD"
    sed -i 's/#\?PermitRootLogin .*/PermitRootLogin no/' "$CONFIG_SSHD"

    # Reinicia o serviço SSH para aplicar as mudanças
    systemctl restart ssh
    echo "Configuração do servidor SSH completa e serviço reiniciado."
}

# Função principal
main() {
    if [ "$(whoami)" != "root" ]; then
        echo "Execute este script como root."
        exit 1
    fi

    # Criação das pastas e arquivos necessários
    if [ ! -d "$PASTA_SSH" ]; then
        mkdir -p "$PASTA_SSH"
    fi

    # Gerar chave SSH e configurar servidor
    gerar_chave_ssh
    configurar_servidor_ssh

    echo "Configuração de SSH com autenticação por chave concluída."
}

# Executar função principal
main
