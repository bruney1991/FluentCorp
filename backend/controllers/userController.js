import { Usuario } from "../models/Usuario.js";


// Login
export const loginUser = async (req, res) => {
  const { email, senha } = req.body;

  try {
    const user = await Usuario.findOne({ where: { email } });
    if (!user) return res.status(404).json({ error: "Usuário não encontrado" });

    // Para senha real: compare com bcrypt
    if (user.senhaHash !== senha) return res.status(401).json({ error: "Senha incorreta" });

    return res.json({ user });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Erro no servidor" });
  }
};

// Cadastro
export const registerUser = async (req, res) => {
  const { nome, email, senha } = req.body;

  try {
    const existingUser = await Usuario.findOne({ where: { email } });
    if (existingUser) return res.status(400).json({ error: "Email já cadastrado" });

    const user = await Usuario.create({
      nome,
      email,
      senhaHash: senha, // futuramente bcrypt.hashSync(senha, 10)
    });

    return res.status(201).json({ user });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Erro ao criar usuário" });
  }
};
