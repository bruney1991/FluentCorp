import { Usuario } from "../models/Usuario.js";
import { Estudo } from "../models/Estudo.js";
import { Progresso } from "../models/Progresso.js";
import { Meta } from "../models/Meta.js";
import { Idioma } from "../models/Idioma.js";

// Usuario → Estudo
Usuario.hasMany(Estudo, { foreignKey: "id_usuario" });
Estudo.belongsTo(Usuario, { foreignKey: "id_usuario" });

// Usuario → Progresso
Usuario.hasMany(Progresso, { foreignKey: "id_usuario" });
Progresso.belongsTo(Usuario, { foreignKey: "id_usuario" });

// Usuario → Meta
Usuario.hasMany(Meta, { foreignKey: "id_usuario" });
Meta.belongsTo(Usuario, { foreignKey: "id_usuario" });

// Idioma → Estudo
Idioma.hasMany(Estudo, { foreignKey: "id_idioma" });
Estudo.belongsTo(Idioma, { foreignKey: "id_idioma" });

// Idioma → Progresso
Idioma.hasMany(Progresso, { foreignKey: "id_idioma" });
Progresso.belongsTo(Idioma, { foreignKey: "id_idioma" });

// Idioma → Meta
Idioma.hasMany(Meta, { foreignKey: "id_idioma" });
Meta.belongsTo(Idioma, { foreignKey: "id_idioma" });

export { Usuario, Estudo, Progresso, Meta, Idioma };
