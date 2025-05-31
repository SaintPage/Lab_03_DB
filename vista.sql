-- Está en el VistaCurEst en models, pero igual puse el query aquí =P

CREATE OR REPLACE VIEW vista_curso_estudiantes AS
SELECT 
  c.id AS curso_id,
  c.nombre AS curso_nombre,
  c.nivel AS curso_nivel,
  e.id AS estudiante_id,
  e.nombre AS estudiante_nombre,
  e.estado AS estudiante_estado
FROM "Cursos" c
JOIN "Inscripcions" i ON i."CursoId" = c.id
JOIN "Estudiantes" e ON e.id = i."EstudianteId";