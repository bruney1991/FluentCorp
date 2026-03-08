import { DataTypes, Model } from "sequelize";
import sequelize from "../config/database.js";
import Usuario from "./Usuario.js";

class Progresso extends Model {}

Progresso.init({
  id_progresso: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true
  },
  id_usuario: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: Usuario,
      key: "idUsuario"
    }
  },
  id_idioma: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  aulas_concluidas: {
    type: DataTypes.INTEGER,
    defaultValue: 0
  },
  exercicios_concluidos: {
    type: DataTypes.INTEGER,
    defaultValue: 0
  },
  pontuacao_total: {
    type: DataTypes.INTEGER,
    defaultValue: 0
  },
  ultima_atualizacao: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  }
}, {
  sequelize,
  modelName: "Progresso",
  tableName: "progresso",
  timestamps: false
});

// Associação: 1 Usuario -> N Progresso
Usuario.hasMany(Progresso, { foreignKey: "id_usuario" });
Progresso.belongsTo(Usuario, { foreignKey: "id_usuario" });

export default Progresso;
