#!/bin/bash

# Variáveis de configuração
SOURCE_DIR="/caminho/para/o/diretorio/origem"  # Diretório que será feito backup
BACKUP_DIR="/caminho/para/o/diretorio/backup"  # Diretório onde o backup será armazenado
DATE=$(date +"%Y-%m-%d_%H-%M-%S")  # Data e hora para o nome do arquivo de backup
BACKUP_FILE="backup_$DATE.tar.gz"   # Nome do arquivo de backup

# Criando diretório de backup, se não existir
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
fi

# Fazendo backup (compactando os arquivos)
tar -czvf "$BACKUP_DIR/$BACKUP_FILE" "$SOURCE_DIR"

# Verificando se o backup foi bem-sucedido
if [ $? -eq 0 ]; then
    echo "Backup realizado com sucesso! Arquivo salvo em: $BACKUP_DIR/$BACKUP_FILE"
else
    echo "Erro ao realizar o backup!"
    exit 1
fi

# Remover backups antigos (opcional: manter backups de 7 dias)
find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +7 -exec rm {} \;

echo "Limpeza de backups antigos realizada."

