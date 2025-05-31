'use strict';
module.exports = (sequelize, DataTypes) => {
  const Inscripcion = sequelize.define('Inscripcion', {}, { timestamps: false });
  return Inscripcion;
};