# Lista de Tarefas (Todo List) - Phoenix LiveView

**Aluno:** Thallyson Gabriel Martins Correia Fontenele

**Link do Tutorial:** [Tutorial no Notion](https://www.notion.so/LINK_DO_TUTORIAL)

## 📋 Descrição

Aplicação de lista de tarefas (Todo List) desenvolvida com **Phoenix Framework** e **Phoenix LiveView**, demonstrando o modelo reativo server-side sem necessidade de JavaScript customizado.

### 🛠️ Tecnologias Utilizadas

- **Elixir** - Linguagem de programação funcional
- **Phoenix Framework** - Framework web para Elixir
- **Phoenix LiveView** - Biblioteca para interfaces reativas em tempo real
- **Ecto** - Wrapper de banco de dados e query builder
- **SQLite** - Banco de dados leve e eficiente
- **Tailwind CSS** - Framework CSS utilitário
- **DaisyUI** - Biblioteca de componentes UI para Tailwind

## ✨ Funcionalidades

- ✅ Adicionar novas tarefas
- ✅ Marcar tarefas como concluídas (com checkbox)
- ✅ Excluir tarefas existentes
- ✅ Persistência de dados no banco SQLite
- ✅ Interface reativa e atualização em tempo real
- ✅ Mensagens flash de feedback

## 📦 Pré-requisitos

Certifique-se de ter instalado em sua máquina:

- **Elixir** 1.19.4 ou superior ([Download](https://elixir-lang.org/install.html))
- **Erlang/OTP** 28 ou superior (instalado automaticamente com Elixir)
- **Node.js** 24.11.1 ou superior ([Download](https://nodejs.org/))
- **Git** para controle de versão

## 🚀 Como Rodar

### 1. Clone o repositório

```bash
git clone https://github.com/thallyson1997/elixir_todo_list.git
cd elixir_todo_list
```

### 2. Instale as dependências do Elixir

```bash
mix deps.get
```

### 3. Instale as dependências do Node.js

```bash
cd assets
npm install
cd ..
```

### 4. Crie o banco de dados

```bash
mix ecto.create
```

### 5. Execute as migrações

```bash
mix ecto.migrate
```

### 6. Inicie o servidor Phoenix

```bash
mix phx.server
```

Ou inicie dentro do IEx (console interativo do Elixir):

```bash
iex -S mix phx.server
```

### 7. Acesse a aplicação

Abra seu navegador e acesse: [http://localhost:4000](http://localhost:4000)

## 📚 Estrutura do Projeto

```
elixir_todo_list/
├── lib/
│   ├── elixir_todo_list/
│   │   ├── application.ex       # Supervisão da aplicação
│   │   ├── repo.ex              # Configuração do Ecto
│   │   └── task.ex              # Schema da tarefa
│   └── elixir_todo_list_web/
│       ├── live/
│       │   └── todo_live.ex     # LiveView principal
│       └── components/
├── priv/
│   └── repo/
│       └── migrations/          # Migrações do banco de dados
├── assets/                      # Assets front-end (CSS, JS)
├── config/                      # Arquivos de configuração
└── mix.exs                      # Dependências do projeto
```

## 🎓 Aprendizados

Este projeto demonstra os seguintes conceitos:

- **LiveView**: Interfaces reativas sem JavaScript customizado
- **Ecto**: Mapeamento objeto-relacional e validações
- **Changesets**: Validação e transformação de dados
- **Pattern Matching**: Tratamento seguro de casos (case/match)
- **Processos Elixir**: Comunicação via WebSocket
- **Persistência**: CRUD completo com SQLite

## 📖 Recursos

- [Documentação do Phoenix](https://hexdocs.pm/phoenix)
- [Documentação do LiveView](https://hexdocs.pm/phoenix_live_view)
- [Guia do Ecto](https://hexdocs.pm/ecto)
- [Elixir School](https://elixirschool.com/pt)

## 📝 Licença

Projeto acadêmico desenvolvido para fins educacionais.
