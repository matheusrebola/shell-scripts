# Script de Configuração de Servidor SSH com Autenticação por Chave

Este script automatiza a configuração de um servidor SSH para utilizar autenticação por chave pública. Ele gera uma chave SSH, configura o servidor SSH para permitir apenas a autenticação por chave, desativando a autenticação por senha, e reinicia o serviço SSH.

## Funcionalidades

- Gera uma chave SSH de 4096 bits para o usuário especificado.
- Configura o servidor SSH para permitir somente a autenticação por chave pública.
- Desativa a autenticação por senha e o login do usuário root via SSH.
- Reinicia o serviço SSH para aplicar as configurações.

## Como usar

### 1. Clonar o Repositório

Clone este repositório para sua máquina local:

```bash
git clone https://github.com/seu-usuario/configuracao-ssh-chaves.git
cd configuracao-ssh-chaves
### 2. Configurar o Script

Antes de executar o script, você pode configurar o nome do usuário que deseja habilitar para autenticação por chave.

No script configurar_ssh_chave.sh, edite a variável USUARIO para especificar o nome do usuário que usará o SSH com autenticação por chave: USUARIO="seu_usuario"

Certifique-se de que o usuário existe no sistema antes de executar o script.

### 3. Tornar o Script Executável

Dê permissão de execução ao script: chmod +x configurar_ssh_chave.sh

### 4. Executar o Script

Execute o script como superusuário (root) para configurar o SSH com autenticação por chave: sudo ./configurar_ssh_chave.sh

O script irá:

    Gerar uma chave SSH para o usuário especificado (se ainda não existir).
    Armazenar a chave pública no arquivo authorized_keys do usuário.
    Configurar o servidor SSH para usar autenticação por chave e desativar a autenticação por senha.
    Reiniciar o serviço SSH para aplicar as novas configurações.

### 5. Transferir a Chave Privada

Após a execução, você precisará transferir a chave privada (id_rsa) gerada para o cliente que irá se conectar ao servidor. Exemplo de comando para copiar a chave privada para o cliente local (no servidor): scp /home/seu_usuario/id_rsa usuario@cliente:/caminho/para/salvar/

#### Importante!: Nunca compartilhe a chave privada de forma insegura. Sempre proteja sua chave com permissões adequadas.

### 6. Conectar ao Servidor via SSH

No cliente que possui a chave privada, você pode se conectar ao servidor usando o seguinte comando: ssh -i /caminho/para/id_rsa seu_usuario@servidor

A autenticação será feita com a chave privada, sem necessidade de senha, desde que o SSH esteja corretamente configurado no servidor.

### Automatização

Para automatizar a criação de múltiplos usuários com autenticação por chave, basta modificar o script para incluir vários usuários na lista ou rodar o script várias vezes, alterando o nome do usuário.
