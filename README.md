<div align="center">

# 🗣️ $\color{purple}{\text{Fluent Corp | Aplicativo de Idiomas}}$ 📱
![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)
![Node.js](https://img.shields.io/badge/Node.js-339933?logo=node.js&logoColor=white)
![Sequelize](https://img.shields.io/badge/Sequelize-52B0E7?logo=sequelize&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?logo=mysql&logoColor=white)  
</div>

💻 **Descrição:** Aplicativo de aprendizado de idiomas desenvolvido como projeto acadêmico no **SENAC**.

🔗 [Veja o landing page online](https://bruney1991.github.io/FluentCorp/)
   
   *Integrantes do grupo:*  
-👨🏻‍🎓 Bruney Mota Trindade    
-👨🏻‍🎓 Joao Caio Da Silva Santos  
-👩🏻‍🎓 Maria Eduarda Alves Gaia  
-👩🏻‍🎓 Maria Eduarda Natal Comelli 


## 🛠️ $\color{purple}{\text{Projeto Node.js + Sequelize + Flutter}}$

O **FluentCorp** é composto por três camadas principais:

**📱 Mobile (Flutter)**  
Interface do usuário e interação com o sistema.

**⚙️ Backend (Node.js + Sequelize)**  
API responsável pelas regras de negócio e comunicação com o banco de dados.

**🗄 Banco de Dados (MySQL)**  
Responsável por armazenar os dados da aplicação.

### Fluxo da aplicação

Flutter App → Node.js API → MySQL

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
cd FluentCorp
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
