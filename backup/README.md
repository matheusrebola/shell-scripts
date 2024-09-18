# Backup Automatizado com Shell Script

Este projeto é um simples script shell que realiza o backup de um diretório especificado, compacta o conteúdo em um arquivo `.tar.gz` e o salva em um diretório de backup. O script também realiza a limpeza automática de backups antigos.

## Funcionalidades
- Faz backup de um diretório de origem.
- Compacta o backup em um arquivo `.tar.gz` com data e hora no nome.
- Remove backups antigos (opcional: ajustável para manter backups de 7 dias por padrão).
- Pode ser automatizado com `cron` para executar em intervalos regulares.

## Pré-requisitos
- Sistema operacional Linux ou qualquer sistema compatível com bash.
- Permissão de leitura no diretório de origem e de escrita no diretório de backup.
- Ferramentas básicas como `tar` e `find` devem estar instaladas (geralmente já vêm por padrão).

## Como usar

### 1. Clonar o Repositório

Clone este repositório para a sua máquina local:

```bash
git clone https://github.com/seu-usuario/backup-automatizado.git
cd backup-automatizado

### 2. Editar o Script

Abra o script backup_automatizado.sh e configure os seguintes parâmetros:

    SOURCE_DIR: Diretório que você deseja fazer backup.
    BACKUP_DIR: Diretório onde os arquivos de backup serão armazenados.

### 3. Tornar o Script Executável

Dê permissão de execução ao script: chmod +x backup_automatizado.sh

### 4. Executar o Script

Execute o script manualmente para realizar o backup: ./backup_automatizado.sh

### 5. Automatizar com Cron (opcional)

Para automatizar o backup e executá-lo periodicamente, use o cron. Por exemplo, para executar o backup todos os dias às 2h da manhã:

    Abra o crontab para edição: crontab -e

Adicione a seguinte linha ao final do arquivo: 
0 2 * * * /caminho/para/backup_automatizado.sh >> /caminho/para/log_de_backup.log 2>&1

Isso irá executar o script todos os dias às 2h da manhã e armazenar o log de execução em um arquivo.
