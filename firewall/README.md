# Script de Configuração de Firewall com iptables

Este script configura um firewall básico utilizando `iptables`, aplicando regras de segurança que bloqueiam todo o tráfego de entrada, exceto para portas e serviços específicos. Ele é útil para proteger servidores Linux, liberando apenas o tráfego essencial (como SSH, HTTP e HTTPS) e rejeitando tudo o que não for permitido.

## Funcionalidades

- Bloqueia todo o tráfego de entrada por padrão.
- Libera portas específicas como SSH (22), HTTP (80), HTTPS (443) e DNS (53 UDP).
- Permite conexões já estabelecidas e relacionadas.
- Permite ping (ICMP).
- Limita tentativas de login via SSH para prevenir ataques de força bruta.
- Faz log dos pacotes rejeitados.
- Fácil personalização para adicionar ou remover regras de acordo com sua necessidade.

## Como usar

### 1. Clonar o Repositório

Clone este repositório para sua máquina local:

```bash
git clone https://github.com/seu-usuario/firewall-iptables.git
cd firewall-iptables

### 2. Configurar o Script

Abra o arquivo configura_firewall.sh para personalizar as regras conforme sua necessidade. Você pode:

    Alterar ou adicionar portas específicas na seção de regras.
    Personalizar o número de tentativas de login SSH permitidas antes de bloquear tentativas extras.

### 3. Tornar o Script Executável

Dê permissão de execução ao script: chmod +x configura_firewall.sh

### 4. Executar o Script

Execute o script como superusuário para aplicar as regras do firewall: sudo ./configura_firewall.sh

### 5. Verificar Regras Aplicadas

Para verificar se as regras foram aplicadas corretamente, use o seguinte comando: sudo iptables -L -v

### 6. Persistir as Regras (Opcional)

As regras aplicadas pelo iptables podem ser salvas para que sejam restauradas após a reinicialização do sistema.

    Para distribuições Ubuntu/Debian, as regras são salvas automaticamente pelo script com o comando iptables-save.

    Para distribuições CentOS/RHEL/Fedora, você pode salvar as regras manualmente: sudo service iptables save

### Personalização

Você pode personalizar o script para abrir ou fechar outras portas conforme necessário. Por exemplo, para liberar a porta 8080, adicione a seguinte linha no script: iptables -A INPUT -p tcp --dport 8080 -j ACCEPT

Caso precise ajustar o comportamento de logging, você pode alterar ou remover as regras de log no final do script.

### Automatização

Você pode configurar o script para ser executado automaticamente em cada reinicialização do sistema, adicionando-o ao cron ou aos scripts de inicialização do sistema.
