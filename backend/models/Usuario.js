import { DataTypes } from "sequelize";
import sequelize from "../config/database.js";

const Usuario = sequelize.define(
  "Usuario",
  {
    id_usuario: {
      type: DataTypes.INTEGER,
      primaryKey: true,   // 🔑 define como chave primária
      autoIncrement: true, // 🔑 se for auto_increment no MySQL
      allowNull: false,
    },
    nome: {
      type: DataTypes.STRING(100),
      allowNull: false,
    },
    email: {
      type: DataTypes.STRING(100),
      allowNull: false,
      unique: true,
    },
    senhaHash: {
      type: DataTypes.STRING(255),
      allowNull: false,
    },
    paisOrigem: {
      type: DataTypes.STRING(100),
    },
    idiomaNativo: {
      type: DataTypes.STRING(100),
    },
    dataNascimento: {
      type: DataTypes.DATEONLY,
    },
  },
  {
    tableName: "Usuarios", // nome exato da tabela no banco
    timestamps: true,      // createdAt / updatedAt
  }
);

export { Usuario } ;