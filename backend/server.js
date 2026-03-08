import express from 'express';
import cors from 'cors';
import { Usuario } from './models/Usuario.js';

const app = express();

app.use(cors());
app.use(express.json());

// 🔹 Rota login
app.post('/api/users/login', async (req, res) => {
  const { email, senha } = req.body;

  try {
    let usuario = await Usuario.findOne({ where: { email } });

    if (usuario) {
      if (usuario.senhaHash === senha) {
        res.json({ status: 'ok', user: usuario });
      } else {
        res.status(401).json({ status: 'erro', message: 'Senha incorreta' });
      }
    } else {
      res.status(404).json({ status: 'erro', message: 'Usuário não encontrado' });
    }
  } catch (err) {
    console.error(err);
    res.status(500).json({ status: 'erro', message: 'Erro no servidor' });
  }
});

// 🔹 Rota cadastro
app.post('/api/users/register', async (req, res) => {
  const { nome, email, senha } = req.body;

  try {
    const existingUser = await Usuario.findOne({ where: { email } });
    if (existingUser) {
      return res.status(400).json({ status: 'erro', message: 'Email já cadastrado' });
    }

    const novoUsuario = await Usuario.create({
      nome,
      email,
      senhaHash: senha,
    });

    res.status(201).json({ status: 'ok', user: novoUsuario });
  } catch (err) {
    console.error(err);
    res.status(500).json({ status: 'erro', message: 'Erro no servidor' });
  }
});

// 🔹 Atualizar usuário
app.put('/api/users/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const [updated] = await Usuario.update(req.body, { where: { id_usuario: id } });

    if (updated) {
      const updatedUser = await Usuario.findByPk(id);
      res.json(updatedUser);
    } else {
      res.status(404).json({ message: 'Usuário não encontrado' });
    }
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// 🔹 Deletar usuário
app.delete('/api/users/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const deleted = await Usuario.destroy({ where: { id_usuario: id } });

    if (deleted) {
      res.json({ message: 'Usuário deletado' });
    } else {
      res.status(404).json({ message: 'Usuário não encontrado' });
    }
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// 🔹 Teste rápido
app.get('/api/message', (req, res) => {
  res.json({ message: 'Servidor Node.js rodando!' });
});

// 🔹 Lista usuarios no banco
app.get('/usuarios', async (req, res) => {
  try {
    const usuarios = await Usuario.findAll();
    res.json(usuarios);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Erro no servidor' });
  }
});

// 🔹 Inicializa servidor
const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Servidor rodando em http://localhost:${PORT}`);
});
