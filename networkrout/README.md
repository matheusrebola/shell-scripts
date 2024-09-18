# Script de Monitoramento de Conectividade de Rede (Ping e Traceroute)

Este script monitora a conectividade de rede realizando testes de `ping` e `traceroute` para um destino especificado, como um endereço IP ou um domínio. Ele é útil para verificar se a rede está ativa e se há problemas no caminho até o destino.

## Funcionalidades

- **Ping**: Verifica a conectividade com um destino enviando pacotes ICMP e exibindo o tempo de resposta.
- **Traceroute**: Exibe o caminho que os pacotes percorrem até o destino, mostrando os roteadores intermediários.
- **Logs**: Os resultados dos testes são registrados em um arquivo de log para análise posterior.

## Como usar

### 1. Clonar o Repositório

Clone este repositório para sua máquina local:

```bash
git clone https://github.com/seu-usuario/monitoramento-conectividade.git
cd monitoramento-conectividade

### 2. Configurar o Script

Abra o arquivo monitorar_conectividade.sh e edite as variáveis no topo do arquivo conforme necessário:

    DESTINO: IP ou domínio de destino para os testes de conectividade (por exemplo, 8.8.8.8 ou google.com).
    PING_COUNT: O número de pacotes ping a serem enviados (padrão: 4).
    LOG_FILE: Local onde os resultados dos testes serão salvos (padrão: /var/log/monitoramento_rede.log).

Exemplo de configuração:
DESTINO="8.8.8.8"
PING_COUNT=4
LOG_FILE="/var/log/monitoramento_rede.log"

### 3. Tornar o Script Executável

Dê permissão de execução ao script: chmod +x monitorar_conectividade.sh

### 4. Executar o Script

Execute o script como superusuário para realizar os testes de ping e traceroute: sudo ./monitorar_conectividade.sh

O script irá executar os testes de conectividade e registrar os resultados no arquivo de log especificado. Após a execução, ele exibirá mensagens indicando o sucesso ou falha dos testes e informará que os resultados estão disponíveis no log.

### 5. Verificar os Logs

Os resultados do ping e do traceroute serão registrados no arquivo de log. Você pode visualizar o log com o seguinte comando: sudo cat /var/log/monitoramento_rede.log

O log mostrará tanto o tempo de resposta do ping quanto o caminho percorrido pelos pacotes no traceroute.

### Personalização

Você pode personalizar o script para testar diferentes destinos ou alterar o número de pacotes de ping enviados. Também pode alterar a frequência com que os testes são executados ao usar o cron para automatizar o processo (veja a seção sobre automatização abaixo).

### Automatização

Para automatizar a execução deste script em intervalos regulares (por exemplo, a cada 5 minutos), você pode adicioná-lo ao cron. Siga as instruções abaixo:
    Abra o crontab para edição: sudo crontab -e

Adicione a seguinte linha ao final do arquivo para executar o script a cada 5 minutos: */5 * * * * /caminho/para/monitorar_conectividade.sh

Isso permitirá monitorar a conectividade de rede de forma contínua e automática, registrando os resultados regularmente no arquivo de log.
