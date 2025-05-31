'use strict';
module.exports = (sequelize, DataTypes) => {
  const Curso = sequelize.define('Curso', {
    nombre: DataTypes.STRING,
    nivel: DataTypes.ENUM('basico', 'intermedio', 'avanzado')
  });

  Curso.associate = models => {
    Curso.belongsToMany(models.Estudiante, { through: 'Inscripcion' });
  };

  return Curso;
};