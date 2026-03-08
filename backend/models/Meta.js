import { DataTypes, Model } from "sequelize";
import sequelize from "../config/database.js";
import Usuario from "./Usuario.js";

class Meta extends Model {}

Meta.init({
  id_meta: {
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
  descricao: {
    type: DataTypes.STRING,
    allowNull: false
  },
  data_limite: {
    type: DataTypes.DATEONLY,
    allowNull: false
  },
  concluida: {
    type: DataTypes.BOOLEAN,
    defaultValue: false
  }
}, {
  sequelize,
  modelName: "Meta",
  tableName: "metas",
  timestamps: false
});

// Associação: 1 Usuario -> N Metas
Usuario.hasMany(Meta, { foreignKey: "id_usuario" });
Meta.belongsTo(Usuario, { foreignKey: "id_usuario" });

export default Meta;
