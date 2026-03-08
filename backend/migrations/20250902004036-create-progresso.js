'use strict';

/** @type {import('sequelize-cli').Migration} */
export default {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable("Progressos", {
      id_progresso: { type: Sequelize.INTEGER, autoIncrement: true, primaryKey: true },
      id_usuario: { type: Sequelize.INTEGER, allowNull: false },
      id_idioma: { type: Sequelize.INTEGER, allowNull: false },
      aulas_concluidas: { type: Sequelize.INTEGER },
      exercicios_concluidos: { type: Sequelize.INTEGER },
      pontuacao_total: { type: Sequelize.INTEGER },
      ultima_atualizacao: { type: Sequelize.DATE },
      createdAt: { type: Sequelize.DATE, allowNull: false, defaultValue: Sequelize.fn("NOW") },
      updatedAt: { type: Sequelize.DATE, allowNull: false, defaultValue: Sequelize.fn("NOW") }
    });

    // Constraints de FK
    await queryInterface.addConstraint('Progressos', {
      fields: ['id_usuario'],
      type: 'foreign key',
      name: 'fk_progressos_usuario',
      references: { table: 'Usuarios', field: 'id_usuario' },
      onUpdate: 'CASCADE',
      onDelete: 'CASCADE'
    });

    await queryInterface.addConstraint('Progressos', {
      fields: ['id_idioma'],
      type: 'foreign key',
      name: 'fk_progressos_idioma',
      references: { table: 'Idiomas', field: 'id_idioma' },
      onUpdate: 'CASCADE',
      onDelete: 'CASCADE'
    });
  },

  async down(queryInterface) {
    await queryInterface.dropTable("Progressos");
  }
};

;
