'use strict';
module.exports = (sequelize, DataTypes) => {
  const Estudiante = sequelize.define('Estudiante', {
    nombre: DataTypes.STRING,
    estado: DataTypes.ENUM('activo', 'suspendido', 'graduado')
  });

  Estudiante.associate = models => {
    Estudiante.belongsToMany(models.Curso, { through: 'Inscripcion' });
  };

  return Estudiante;
};