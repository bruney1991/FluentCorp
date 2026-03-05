# 🗣️ $\color{purple}{\text{Fluent Corp | Aplicativo de Idiomas}}$ 📱

   *Integrantes do grupo:*  
   
-👨🏻‍🎓 Bruney Mota Trindade    
-👨🏻‍🎓 Joao Caio Da Silva Santos  
-👩🏻‍🎓 Maria Eduarda Alves Gaia  
-👩🏻‍🎓 Maria Eduarda Natal Comelli 


## 🛠️ $\color{purple}{\text{Projeto Node.js + Sequelize + Flutter}}$

#### Este projeto consiste em um backend desenvolvido em Node.js com Sequelize para interação com o banco de dados e um frontend em Flutter.

## 📋 $\color{purple}{\text{Pré-requisitos}}$ 

⚠️ $\color{red}{\text{Antes de começar, certifique-se de ter instalado em sua máquina:}}$  

✔️ **Git**\
✔️ **Node.js (versão recomendada: 16.x ou superior)**\
✔️ **Flutter**\
✔️ **npm (gerenciador de pacotes)**

 **Para clonar o repositório , siga os passos abaixo:**
```bash
git clone https://github.com/bruney1991/FluentCorp
```
```bash
cd APP_IDIOMAS
```

### 📥 $\color{purple}{\text{Instalar dependências}}$ 
### 1️⃣ $\color{purple}{\text{Instalar Sequelize e CLI localmente no projeto}}$ 

```bash
npm install sequelize sequelize-cli mysql2
```
### 2️⃣ $\color{purple}{\text{Inicializar Sequelize no projeto}}$
```bash 
npx sequelize-cli init
```
_Isso cria a estrutura de pastas:_

```
📦 seu-projeto/
 ┣ 📂 backend/             # Código do Node.js + Sequelize
 ┃ ┣ 📂 migrations/        # Scripts que criam/alteram tabelas
 ┃ ┣ 📂 models/            # Modelos Sequelize
 ┃ ┣ 📂 controllers/       # Regras de negócio
 ┃ ┣ 📂 routes/            # Rotas da API
 ┃ ┣ 📜 package.json
 ┃ ┗ 📜 server.js
 ┃ ┣ 📂 lib/
 ┃ ┣ 📜 pubspec.yaml
 ┃ ┗ ...
 ┗ 📜 README.md            # Documentação do projeto

```

### 3️⃣ $\color{purple}{\text{Configurar config/config.json}}$
```
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

### 4️⃣ $\color{purple}{\text{Aplicar todas as migrations}}$

```bash
npx sequelize-cli db:migrate
```
### 5️⃣ $\color{purple}{\text{Instalar dependências do Flutter}}$

```bash
flutter pub get
```
```bash
flutter doctor
```
```bash
flutter run
```
