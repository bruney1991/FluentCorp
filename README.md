<div align="center">

# 🗣️ $\color{purple}{\text{Fluent Corp | Aplicativo de Idiomas}}$ 📱
![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)
![Node.js](https://img.shields.io/badge/Node.js-339933?logo=node.js&logoColor=white)
![Sequelize](https://img.shields.io/badge/Sequelize-52B0E7?logo=sequelize&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?logo=mysql&logoColor=white)  
</div>

💻 **Descrição:** Aplicativo de aprendizado de idiomas desenvolvido como projeto acadêmico no **SENAC**

🔗 [Veja o landing page online](https://bruney1991.github.io/FluentCorp/)

<div align="center">
  <h3>📱 Preview da Aplicação</h3>
  <img src="./docs/images/app_demo.gif?v=1" alt="Demonstração do Fluent Corp" width="300">
</div>

## ✨ $\color{purple}{\text{Funcionalidades}}$

O **Fluent Corp** foi projetado para oferecer uma experiência de aprendizado fluida e integrada, unindo uma interface moderna a um backend:

* 🔐 **Autenticação de Usuários:** Sistema completo de cadastro e login, com armazenamento seguro de credenciais no banco de dados.
* 📚 **Trilhas de Idiomas Corporativos:** Acesso a módulos de estudo com foco em vocabulário de negócios, reuniões e apresentações.
* 🚀 **Consumo de API REST:** Frontend em Flutter totalmente integrado ao backend Node.js para carregamento dinâmico de conteúdos.
* 🗄️ **Persistência de Dados (ORM):** Gerenciamento eficiente de informações do usuário e progresso através do Sequelize e MySQL.
* 📱 **Interface Responsiva:** Design moderno em Flutter, otimizado para garantir a melhor experiência do usuário (UX).
* ⚙️ **Arquitetura Escalável:** Estrutura de pastas organizada seguindo as melhores práticas de desenvolvimento Full-Stack.


## 🛠️ $\color{purple}{\text{Tecnologias Utilizadas}}$

O **FluentCorp** é composto por três camadas principais:

**📱 Mobile ([Flutter](https://flutter.dev/))** Interface do usuário e interação com o sistema.

**⚙️ Backend ([Node.js](https://nodejs.org/) + [Sequelize](https://sequelize.org/))** API responsável pelas regras de negócio e comunicação com o banco de dados.

**🗄 Banco de Dados ([MySQL](https://www.mysql.com/))** Responsável por armazenar os dados da aplicação.

### Fluxo da aplicação

Flutter App → Node.js API → MySQL

## 📋 $\color{purple}{\text{Pré-requisitos}}$ 

⚠️ $\color{red}{\text{Antes de começar, certifique-se de ter instalado em sua máquina:}}$  

✔️ **Git**\
✔️ **Node.js (versão recomendada: 16.x ou superior)**\
✔️ **Flutter**\
✔️ **npm (gerenciador de pacotes)**

<details>
<summary>

## $\color{purple}{\text{Clique aqui para o passo a passo de Clonagem e Instalação}}$ 🚀
</summary>

### 1️⃣ $\color{purple}{\text{Clonar o Repositório}}$ 
```bash
git clone https://github.com/bruney1991/FluentCorp.git
cd FluentCorp
```

### 2️⃣ $\color{purple}{\text{Instalar Sequelize e Dependências}}$ 
```bash
npm install sequelize sequelize-cli mysql2
```

### 3️⃣ $\color{purple}{\text{Inicializar Sequelize no projeto}}$
```bash 
npx sequelize-cli init
```
_Isso cria a estrutura de pastas:_

```
📦 FluentCorp/
 ┣ 📂 backend/              # API Node.js + Sequelize
 ┃ ┣ 📂 migrations/         # Scripts que criam/alteram tabelas
 ┃ ┣ 📂 models/             # Modelos Sequelize
 ┃ ┣ 📂 controllers/        # Regras de negócio
 ┃ ┣ 📂 routes/             # Rotas da API
 ┃ ┣ 📜 package.json
 ┃ ┗ 📜 server.js
 ┃
 ┣ 📂 mobile/               # Aplicativo Flutter
 ┃ ┣ 📂 lib/
 ┃ ┣ 📂 android/
 ┃ ┣ 📂 ios/
 ┃ ┣ 📂 web/
 ┃ ┣ 📜 pubspec.yaml
 ┃ ┗ ...
 ┃
 ┣ 📂 docs/              # Landing page (GitHub Pages)
 ┃ ┣ 📂 images/
 ┃ ┗ 📜 index.html
 ┃
 ┗ 📜 README.md             # Documentação do projeto

```

### 4️⃣ $\color{purple}{\text{Configurar config/config.json}}$
```json
{
  "development": {
    "username": "usuario",
    "password": "minhasenha",
    "database": "aplicacao",
    "host": "localhost",
    "dialect": "mysql"
  },
  "test": {
    "username": "root",
    "password": null,
    "database": "database_test",
    "host": "localhost",
    "dialect": "mysql"
  },
  "production": {
    "username": "root",
    "password": null,
    "database": "database_production",
    "host": "localhost",
    "dialect": "mysql"
  }
}
```

### 5️⃣ $\color{purple}{\text{Aplicar as migrations}}$
```bash
npx sequelize-cli db:migrate
```

### 6️⃣ $\color{purple}{\text{Executar o Backend}}$
```bash
cd backend
npm install
npm start
```

### 7️⃣ $\color{purple}{\text{Executar o App Flutter}}$
```bash
cd mobile
flutter pub get
flutter doctor
flutter run
```
</details>

## $\color{purple}{\text{👥 Integrantes}}$
-👨🏻‍🎓 Bruney Mota Trindade    
-👨🏻‍🎓 João Caio Da Silva Santos  
-👩🏻‍🎓 Maria Eduarda Alves Gaia  
-👩🏻‍🎓 Maria Eduarda Natal Comelli 
