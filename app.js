const express = require('express');
const app = express();

app.use(express.json());

// Importar el controlador de cursos
const cursosController = require('./controllers/cursos');
app.use('/cursos', cursosController);

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Servidor escuchando en http://localhost:${PORT}`);
});