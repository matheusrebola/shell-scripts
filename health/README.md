# Script de Monitoramento de Uso de CPU e Memória

Este script monitora o uso de CPU e memória do sistema em intervalos regulares e registra alertas em um arquivo de log quando o uso excede determinados limites. Ele é útil para monitorar servidores ou sistemas que precisam ser vigiados em relação ao uso de recursos.

## Funcionalidades

- Monitora o uso de CPU e memória em tempo real.
- Envia alertas para um arquivo de log quando o uso de CPU ou memória ultrapassa os limites configurados.
- Personalizável para alterar o intervalo de verificação e os limites de uso.
- Pode ser executado continuamente para monitoramento a longo prazo.

## Como usar

### 1. Clonar o Repositório

Clone este repositório para sua máquina local:

```bash
git clone https://github.com/seu-usuario/monitoramento-sistema.git
cd monitoramento-sistema

### 2. Configurar o Script

Abra o arquivo monitoramento_sistema.sh e configure as seguintes variáveis conforme necessário:

    CPU_THRESHOLD: Define o limite de uso de CPU em porcentagem que, se excedido, irá gerar um alerta (padrão: 80%).
    MEMORY_THRESHOLD: Define o limite de uso de memória em porcentagem que, se excedido, irá gerar um alerta (padrão: 80%).
    CHECK_INTERVAL: Define o intervalo em segundos entre as verificações de uso de CPU e memória (padrão: 5 segundos).

### 3. Tornar o Script Executável

Dê permissão de execução ao script: chmod +x monitoramento_sistema.sh

### 4. Executar o Script

Execute o script como superusuário para que ele possa gravar no diretório de logs: sudo ./monitoramento_sistema.sh

O script começará a monitorar o uso de CPU e memória e registrará os resultados no arquivo /var/log/monitoramento_sistema.log. Ele continuará monitorando até que seja interrompido manualmente (usando Ctrl + C).

### 5. Verificar os Logs

Os resultados do monitoramento, incluindo qualquer alerta gerado, serão registrados no arquivo /var/log/monitoramento_sistema.log. Você pode visualizar o log com o seguinte comando: sudo cat /var/log/monitoramento_sistema.log

### Personalização

Se você quiser monitorar o sistema em intervalos diferentes ou ajustar os limites para os alertas de uso de CPU e memória, basta editar os valores de CPU_THRESHOLD, MEMORY_THRESHOLD e CHECK_INTERVAL no script.

Por exemplo:
    Para monitorar a cada 10 segundos, altere: CHECK_INTERVAL=10

Para gerar alertas quando o uso de CPU exceder 90%, altere: CPU_THRESHOLD=90

### Automatização

Se você quiser que o script seja executado automaticamente em intervalos regulares, pode adicioná-lo ao cron. Para configurar o cron para rodar a cada 5 minutos, siga os passos abaixo:
    Abra o crontab para edição: sudo crontab -e

Adicione a seguinte linha ao final do arquivo: */5 * * * * /caminho/para/monitoramento_sistema.sh

Isso executará o script a cada 5 minutos.
