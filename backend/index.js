import readline from 'readline';
import sequelize from './config/database.js';
import { Usuario } from './models/Usuario.js';
import bcrypt from 'bcrypt';

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const perguntar = (pergunta) => {
  return new Promise((resolve) => rl.question(pergunta, (resposta) => resolve(resposta)));
};

// Função para converter dd-mm-yyyy → yyyy-mm-dd
const formatarData = (data) => {
  const [dia, mes, ano] = data.split('-');
  return `${ano}-${mes}-${dia}`;
};

(async () => {
  try {
    await sequelize.authenticate();
    console.log("\n✅ Conexão com BD realizada!\n");

    const nome = await perguntar("Nome: ");
    const email = await perguntar("Email: ");
    const senha = await perguntar("Senha: ");
    const paisOrigem = await perguntar("País de origem: ");
    const idiomaNativo = await perguntar("Idioma nativo: ");
    const dataNascimentoInput = await perguntar("Data de nascimento (dd-mm-yyyy): ");

    const dataNascimento = formatarData(dataNascimentoInput);

    const senhaHash = await bcrypt.hash(senha, 10); // hash da senha

    const user = await Usuario.create({
      nome,
      email,
      senhaHash,
      paisOrigem,
      idiomaNativo,
      dataNascimento
    });

    console.log("\n🎉Usuário criado com sucesso:");
    console.log(JSON.stringify(user, null, 2));

    rl.close();
  } catch (err) {
    console.error("Erro:", err);
    rl.close();
  } finally {
    await sequelize.close();
  }
})();
