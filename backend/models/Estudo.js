import { DataTypes, Model } from "sequelize";
import sequelize from "../config/database.js";
import Usuario from "./Usuario.js";

class Estudo extends Model {}

Estudo.init({
  id_estudo: {
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
  data_inicio: {
    type: DataTypes.DATEONLY,
    defaultValue: DataTypes.NOW
  },
  horas_estudadas: {
    type: DataTypes.INTEGER,
    defaultValue: 0
  }
}, {
  sequelize,
  modelName: "Estudo",
  tableName: "estudos",
  timestamps: false
});

// Associação: 1 Usuario -> N Estudos
Usuario.hasMany(Estudo, { foreignKey: "id_usuario" });
Estudo.belongsTo(Usuario, { foreignKey: "id_usuario" });

export default Estudo;
