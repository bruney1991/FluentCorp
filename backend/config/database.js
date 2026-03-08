import { Sequelize } from 'sequelize';

// Configurações do banco de dados
const sequelize = new Sequelize('aplicacao', 'root', 'root', {
  host: '127.0.0.1',
  dialect: 'mysql',
  logging: console.log,
  define: {
    timestamps: true,
    freezeTableName: true
  }
});

// Testa a conexão
(async () => {
  try {
    await sequelize.authenticate();
    console.log('✅Conexão com o banco de dados estabelecida com sucesso!');
  } catch (err) {
    console.error('Erro ao conectar ao banco de dados:', err);
  }
})();

// **export padrão do Sequelize**
export default sequelize;
