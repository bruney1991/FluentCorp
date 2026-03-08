import { DataTypes, Model } from "sequelize";
import sequelize from "../config/database.js";

class Idioma extends Model {}

Idioma.init({
  id_idioma: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true
  },
  nome_idioma: {
    type: DataTypes.STRING,
    allowNull: false
  },
  nivel_proficiencia: {
    type: DataTypes.STRING, // Ex: "iniciante", "intermediário", "avançado"
    allowNull: false
  }
}, {
  sequelize,
  modelName: "Idioma",
  tableName: "idiomas",
  timestamps: false
});

export default Idioma;
