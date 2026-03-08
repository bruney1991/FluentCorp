'use strict';

/** @type {import('sequelize-cli').Migration} */
export default {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable("Metas", {
      id_meta: { type: Sequelize.INTEGER, autoIncrement: true, primaryKey: true },
      id_usuario: { type: Sequelize.INTEGER, allowNull: false },
      id_idioma: { type: Sequelize.INTEGER, allowNull: false },
      descricao: { type: Sequelize.STRING },
      data_limite: { type: Sequelize.DATE },
      concluida: { type: Sequelize.BOOLEAN, defaultValue: false },
      createdAt: { type: Sequelize.DATE, allowNull: false, defaultValue: Sequelize.fn("NOW") },
      updatedAt: { type: Sequelize.DATE, allowNull: false, defaultValue: Sequelize.fn("NOW") }
    });

    // Constraints de FK
    await queryInterface.addConstraint('Metas', {
      fields: ['id_usuario'],
      type: 'foreign key',
      name: 'fk_metas_usuario',
      references: { table: 'Usuarios', field: 'id_usuario' },
      onUpdate: 'CASCADE',
      onDelete: 'CASCADE'
    });

    await queryInterface.addConstraint('Metas', {
      fields: ['id_idioma'],
      type: 'foreign key',
      name: 'fk_metas_idioma',
      references: { table: 'Idiomas', field: 'id_idioma' },
      onUpdate: 'CASCADE',
      onDelete: 'CASCADE'
    });
  },

  async down(queryInterface) {
    await queryInterface.dropTable("Metas");
  }
};

