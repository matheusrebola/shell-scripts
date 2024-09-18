# Script de Monitoramento de Serviços em Execução

Este script monitora o status de serviços essenciais como servidores web (Apache, Nginx), bancos de dados (MySQL, PostgreSQL) e outros serviços, verificando se estão em execução e registrando os resultados em um arquivo de log.

## Funcionalidades

- Verifica o status de múltiplos serviços, como servidores web e bancos de dados.
- Registra o status de cada serviço (ativo ou inativo) em um arquivo de log.
- Notifica diretamente no terminal se algum serviço não estiver em execução.

## Como usar

### 1. Clonar o Repositório

Clone este repositório para sua máquina local:

```bash
git clone https://github.com/seu-usuario/monitoramento-servicos.git
cd monitoramento-servicos

### 2. Configurar o Script

Abra o arquivo monitorar_servicos.sh e edite a lista de serviços que deseja monitorar:

    SERVICOS: Insira os nomes dos serviços que você quer monitorar. Os nomes dos serviços devem ser os mesmos que aparecem ao rodar systemctl status nome-do-servico. Exemplo:
    
SERVICOS=("apache2" "nginx" "mysql" "postgresql")

### 3. Tornar o Script Executável

Dê permissão de execução ao script: chmod +x monitorar_servicos.sh

### 4. Executar o Script

Execute o script como superusuário para monitorar os serviços: sudo ./monitorar_servicos.sh

O script verificará o status de cada serviço listado e exibirá o resultado no terminal. Ele também registrará os resultados em um arquivo de log, que pode ser encontrado no caminho especificado no script (padrão: /var/log/monitoramento_servicos.log).

### 5. Verificar os Logs

Os resultados do monitoramento são registrados no arquivo de log. Para visualizar o log, execute o comando: sudo cat /var/log/monitoramento_servicos.log

O log exibirá o horário de cada verificação e o status de cada serviço (ativo ou inativo).

### Personalização

    Adicionar Serviços: Para adicionar mais serviços à lista, basta incluir o nome do serviço no array SERVICOS. O nome deve ser o mesmo utilizado pelo systemctl.

    Alterar o Local do Log: Você pode modificar a variável LOG_FILE no script para alterar o local onde os logs serão armazenados. Exemplo: LOG_FILE="/caminho/personalizado/monitoramento_servicos.log"

### Automatização

Você pode automatizar a execução deste script em intervalos regulares usando o cron. Para adicionar o script ao cron, siga os passos abaixo:
    Edite o crontab com o comando: sudo crontab -e

Adicione a linha abaixo ao final do arquivo para executar o script a cada 10 minutos: */10 * * * * /caminho/para/monitorar_servicos.sh

Isso permitirá monitorar os serviços de forma contínua e automática, registrando os resultados no log regularmente.
