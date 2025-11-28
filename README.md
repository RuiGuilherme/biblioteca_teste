# Biblioteca - Ambiente com Docker e Testes SQL

## ✅ Pré-requisitos
- Docker instalado
- Docker Compose instalado
- DBeaver (ou outro cliente SQL) para executar consultas

## ✅ Subindo o ambiente com Docker
1. Faça git clone do projeto
2. No terminal, navegue até a pasta raiz do projeto:
   ```bash
   cd biblioteca_teste
   ```
3. Execute o comando para subir o container:
   ```bash
   docker-compose up -d
   ```
4. Aguarde alguns segundos para o banco ser inicializado com as tabelas e dados de exemplos.

## ✅ Verificando se o banco está rodando
- Execute:
  ```bash
  docker ps
  ```
- Você deve ver um container chamado `biblioteca_db` rodando.

## ✅ Conectando pelo DBeaver
1. Abra o DBeaver e crie uma nova conexão MySQL.
2. Configure os parâmetros:
   - **Host:** `localhost`
   - **Porta:** `3306`
   - **Banco:** `Biblioteca`
   - **Usuário:** `biblioteca_user`
   - **Senha:** `biblioteca_pass`
3. Teste a conexão e salve.

## ✅ Executando os scripts de teste
- Os scripts estão na pasta `testes`: (Preferencialmente, execute na ordem indicada no nome do arquivo e dentro do arquivo)
  - `01_select.sql` → Consultas com SELECT, JOIN, WHERE, ORDER BY.
  - `02_delete_update.sql` → Comandos UPDATE e DELETE.

### Como executar:
- No DBeaver, abra a conexão com o banco `Biblioteca`.
- Abra cada arquivo `.sql`, copie o código para o DbEaver e execute manualmente os scripts.

## ✅ Estrutura do projeto
```
biblioteca_testes/
├── docker-compose.yml
├── scripts/
│   ├── 01_criar_base_entidades.sql
│   ├── 02_inserir_livros_exemplares.sql
│   ├── 03_inserir_usuarios.sql
│   └── 04_inserir_emprestimos.sql
└── testes/
    ├── 01_select.sql
    ├── 02_delete_update.sql
```

## ✅ Observações
- Os testes **não são executados automaticamente** no `docker-compose up`. Você deve rodá-los manualmente via DBeaver ou outro cliente SQL.
