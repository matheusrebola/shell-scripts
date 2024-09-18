# Script de Configuração de Rede (IP, Gateway e DNS)

Este script shell permite configurar rapidamente as definições de rede em uma máquina Linux, incluindo o endereço IP estático, máscara de rede, gateway padrão e servidores DNS. É útil para configurar redes em ambientes de servidor ou em qualquer máquina que precise de uma configuração de rede específica.

## Funcionalidades

- Configura um endereço IP estático para uma interface de rede específica.
- Define o gateway padrão da rede.
- Configura servidores DNS (por padrão, Google DNS: 8.8.8.8 e 8.8.4.4).
- Exibe a configuração atual de rede da interface.

## Como usar

### 1. Clonar o Repositório

Clone este repositório para sua máquina local:

```bash
git clone https://github.com/seu-usuario/configuracao-rede.git
cd configuracao-rede

### 2. Configurar o Script

Abra o arquivo configura_rede.sh e edite as variáveis no topo do arquivo conforme necessário:

    INTERFACE: Nome da interface de rede (exemplo: eth0, enp0s3, wlan0).
    IP_ADDRESS: O endereço IP estático a ser configurado (exemplo: 192.168.1.100).
    NETMASK: Máscara de rede (exemplo: 255.255.255.0).
    GATEWAY: O gateway padrão da rede (exemplo: 192.168.1.1).
    DNS1: O primeiro servidor DNS (exemplo: 8.8.8.8 para Google DNS).
    DNS2: O segundo servidor DNS (exemplo: 8.8.4.4 para Google DNS).

Exemplo de configuração:
INTERFACE="eth0"
IP_ADDRESS="192.168.1.100"
NETMASK="255.255.255.0"
GATEWAY="192.168.1.1"
DNS1="8.8.8.8"
DNS2="8.8.4.4"

### 3. Tornar o Script Executável

Dê permissão de execução ao script: chmod +x configura_rede.sh

### 4. Executar o Script

Execute o script como superusuário para aplicar as configurações de rede: sudo ./configura_rede.sh

### 5. Verificar a Configuração

Após a execução, o script exibirá a configuração atual da interface de rede, incluindo o endereço IP, gateway e servidores DNS configurados.

### Personalização

Se você precisar configurar um IP dinâmico (DHCP) ou ajustar a configuração de rede para múltiplas interfaces, você pode adaptar o script. Para IP dinâmico, você pode substituir o comando de configuração de IP pelo seguinte: sudo dhclient INTERFACE

Isso configurará a interface para obter um IP automaticamente via DHCP.

### Automatização

Para automatizar a configuração de rede após reinicializações, você pode adicionar o script ao cron ou ao /etc/network/interfaces em distribuições baseadas em Debian/Ubuntu.
