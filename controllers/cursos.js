const express = require('express');
const router = express.Router();
const { Curso, Estudiante } = require('../models');

// Crear un Curso con estudiantes asociados (por IDs)
router.post('/', async (req, res) => {
  try {
    const { nombre, nivel, estudiantesIds } = req.body;

    if (!nombre || !nivel) {
      return res.status(400).json({ error: "Nombre y nivel son obligatorios" });
    }
    if (!['basico', 'intermedio', 'avanzado'].includes(nivel)) {
      return res.status(400).json({ error: "Nivel inválido" });
    }

    const curso = await Curso.create({ nombre, nivel });

    if (Array.isArray(estudiantesIds) && estudiantesIds.length > 0) {
      const estudiantesValidos = await Estudiante.findAll({
        where: { id: estudiantesIds }
      });
      if (estudiantesValidos.length !== estudiantesIds.length) {
        return res.status(400).json({ error: "Uno o más estudiantes no existen" });
      }
      await curso.addEstudiantes(estudiantesIds);
    }

    const cursoConEstudiantes = await Curso.findByPk(curso.id, {
      include: Estudiante
    });

    res.status(201).json(cursoConEstudiantes);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
});

// Obtener todos los cursos con sus estudiantes asociados
const { VistaCurEst } = require('../models');

router.get('/', async (req, res) => {
  try {
    const vista = await VistaCurEst.findAll();
    res.json(vista);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Actualizar un Curso y sus estudiantes asociados
router.put('/:id', async (req, res) => {
  try {
    const { nombre, nivel, estudiantes } = req.body;
    const curso = await Curso.findByPk(req.params.id);
    if (!curso) return res.status(404).json({ error: 'Curso no encontrado' });

    await curso.update({ nombre, nivel });
    if (Array.isArray(estudiantes)) {
      await curso.setEstudiantes(estudiantes);
    }

    const cursoActualizado = await Curso.findByPk(curso.id, { include: Estudiante });
    res.json(cursoActualizado);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
});

// Eliminar un Curso y sus inscripciones
router.delete('/:id', async (req, res) => {
  const curso = await Curso.findByPk(req.params.id);
  if (!curso) return res.status(404).json({ error: 'Curso no encontrado' });

  await curso.destroy();
  res.status(204).send();
});

module.exports = router;