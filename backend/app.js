const express = require('express');
const bodyParser = require('body-parser');
const database = require('http://localhost:8080'); // Simulação de conexão com DB
const ProductRepository = require('./productRepository');
const CreateProductUseCase = require('./createProductUseCase');
const ProductController = require('./productController');

const app = express();
app.use(bodyParser.json());

// Inicializando os componentes
const productRepository = new ProductRepository(database);
const createProductUseCase = new CreateProductUseCase(productRepository);
const productController = new ProductController(createProductUseCase);

// Rotas
app.post('/products', (req, res) => productController.handleCreateProduct(req, res));

// Iniciando o servidor
app.listen(3000, () => {
  console.log('Servidor rodando na porta 3000');
});