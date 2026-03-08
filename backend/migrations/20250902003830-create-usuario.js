'use strict';

/** @type {import('sequelize-cli').Migration} */
export default {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable("Usuarios", {
      id_usuario: { type: Sequelize.INTEGER, autoIncrement: true, primaryKey: true },
      nome: { type: Sequelize.STRING, allowNull: false },
      email: { type: Sequelize.STRING, allowNull: false, unique: true },
      senhaHash: { type: Sequelize.STRING, allowNull: false },
      dataNascimento: { type: Sequelize.DATEONLY },
      paisOrigem: { type: Sequelize.STRING },
      idiomaNativo: { type: Sequelize.STRING },
      dataCadastro: { type: Sequelize.DATE, defaultValue: Sequelize.NOW },
      ultimoLogin: { type: Sequelize.DATE },
      ativo: { type: Sequelize.BOOLEAN, defaultValue: true },
      createdAt: { type: Sequelize.DATE, allowNull: false, defaultValue: Sequelize.fn("NOW") },
      updatedAt: { type: Sequelize.DATE, allowNull: false, defaultValue: Sequelize.fn("NOW") }
    });
  },

  async down(queryInterface) {
    await queryInterface.dropTable("Usuarios");
  }
};

;
