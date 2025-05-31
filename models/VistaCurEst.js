'use strict';
module.exports = (sequelize, DataTypes) => {
  const VistaCurEst = sequelize.define('VistaCursoEstudiantes', {
    curso_id: DataTypes.INTEGER,
    curso_nombre: DataTypes.STRING,
    curso_nivel: DataTypes.ENUM('basico', 'intermedio', 'avanzado'),
    estudiante_id: DataTypes.INTEGER,
    estudiante_nombre: DataTypes.STRING,
    estudiante_estado: DataTypes.ENUM('activo', 'suspendido', 'graduado')
  }, {
    tableName: 'vista_curso_estudiantes',
    timestamps: false
  });

  return VistaCurEst;
};
