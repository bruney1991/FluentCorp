export default {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable("Estudos", {
      id_estudo: { type: Sequelize.INTEGER, autoIncrement: true, primaryKey: true },
      id_usuario: { type: Sequelize.INTEGER, allowNull: false },
      id_idioma: { type: Sequelize.INTEGER, allowNull: false },
      data_inicio: { type: Sequelize.DATE, allowNull: false },
      horas_estudadas: { type: Sequelize.INTEGER, allowNull: false },
      createdAt: { type: Sequelize.DATE, allowNull: false, defaultValue: Sequelize.fn("NOW") },
      updatedAt: { type: Sequelize.DATE, allowNull: false, defaultValue: Sequelize.fn("NOW") }
    });

    // Constraints de FK
    await queryInterface.addConstraint('Estudos', {
      fields: ['id_usuario'],
      type: 'foreign key',
      name: 'fk_estudos_usuario',
      references: { table: 'Usuarios', field: 'id_usuario' },
      onUpdate: 'CASCADE',
      onDelete: 'CASCADE'
    });

    await queryInterface.addConstraint('Estudos', {
      fields: ['id_idioma'],
      type: 'foreign key',
      name: 'fk_estudos_idioma',
      references: { table: 'Idiomas', field: 'id_idioma' },
      onUpdate: 'CASCADE',
      onDelete: 'CASCADE'
    });
  },

  async down(queryInterface) {
    await queryInterface.dropTable("Estudos");
  }
};
