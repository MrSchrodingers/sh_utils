# Gerador de Estrutura e Conteúdo do Projeto

Este repositório contém dois scripts em shell que auxiliam na visualização e exportação da estrutura de diretórios e dos conteúdos dos arquivos de um projeto.

## Scripts

### 1. script_tree.sh

Este script gera um arquivo de texto representando a estrutura em árvore do diretório atual.  
O arquivo de saída é criado dinamicamente com o nome da pasta atual concatenado com `_tree.txt`.

#### Funcionamento:
- Exibe o nome da pasta raiz seguido de uma barra (`/`).
- Utiliza o comando `find` para listar os arquivos e diretórios, ignorando as pastas `node_modules`, `.next` e `.git`.
- Formata a saída com o `sed`, para dar um efeito visual de árvore.

#### Como usar:
1. Dê permissão de execução ao script:
   ```bash
   chmod +x script_tree.sh
   ```
2. Execute o script:
   ```bash
   ./script_tree.sh
   ```
   
Após a execução, será gerado um arquivo, por exemplo, `meu_projeto_tree.txt`, contendo a estrutura do projeto.

---

### 2. script_content.sh

Este script gera um arquivo JSON que contém o caminho e o conteúdo dos arquivos do projeto.  
O arquivo de saída é criado dinamicamente com o nome da pasta atual concatenado com `_content.json`.

#### Funcionamento:
- Inicia o arquivo JSON com um colchete de abertura (`[`).
- Utiliza o comando `find` para localizar todos os arquivos, ignorando as pastas `node_modules`, `.next` e `.git`.
- Para cada arquivo encontrado:
  - Se for um arquivo de texto, lê seu conteúdo e o converte para uma string JSON com codificação UTF-8.
  - Se não for um arquivo de texto, codifica seu conteúdo em base64.
- Fecha o JSON com um colchete de encerramento (`]`).

#### Como usar:
1. Dê permissão de execução ao script:
   ```bash
   chmod +x script_content.sh
   ```
2. Execute o script:
   ```bash
   ./script_content.sh
   ```
   
Após a execução, será gerado um arquivo, por exemplo, `meu_projeto_content.json`, contendo a estrutura e o conteúdo dos arquivos do projeto.

---

## Pré-requisitos

- **Bash**: Os scripts foram desenvolvidos para serem executados em ambiente Bash.
- **Python 3**: Necessário para a conversão de conteúdo dos arquivos de texto para JSON.
- **Utilitários Unix**: `find`, `sed`, `base64` e `file` devem estar disponíveis no sistema.

---

## Observações

- **Permissões**: Certifique-se de que os scripts possuem permissão de execução.
- **Execução**: Execute os scripts a partir do diretório raiz do seu projeto para que a estrutura gerada seja correta.
- **Exclusões**: Os scripts ignoram as pastas `node_modules`, `.next` e `.git` para evitar processar arquivos desnecessários.

---

## Contribuições

Sinta-se à vontade para abrir *issues* e *pull requests* para sugestões, melhorias ou correções nos scripts.

---

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

---

Com esses scripts, você poderá visualizar a estrutura do seu projeto e gerar um JSON contendo os arquivos e seus conteúdos, facilitando tarefas de documentação e análise do projeto.