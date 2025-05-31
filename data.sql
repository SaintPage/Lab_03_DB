-- Insert de cursos
INSERT INTO "Cursos" (id, nombre, nivel, "createdAt", "updatedAt") VALUES
(1, 'Matemáticas Básicas', 'basico', NOW(), NOW()),
(2, 'Física Intermedia', 'intermedio', NOW(), NOW()),
(3, 'Programación Avanzada', 'avanzado', NOW(), NOW()),
(4, 'Química Básica', 'basico', NOW(), NOW()),
(5, 'Literatura Intermedia', 'intermedio', NOW(), NOW()),
(6, 'Bases de Datos', 'avanzado', NOW(), NOW());

-- Insert de estudiantes
INSERT INTO "Estudiantes" (id, nombre, estado, "createdAt", "updatedAt") VALUES
(1, 'Ana Pérez', 'activo', NOW(), NOW()),
(2, 'Luis Gómez', 'activo', NOW(), NOW()),
(3, 'María López', 'graduado', NOW(), NOW()),
(4, 'Carlos Díaz', 'suspendido', NOW(), NOW()),
(5, 'Elena Torres', 'activo', NOW(), NOW()),
(6, 'Jorge Ramírez', 'activo', NOW(), NOW()),
(7, 'Sofía Morales', 'activo', NOW(), NOW()),
(8, 'Pedro Castillo', 'graduado', NOW(), NOW()),
(9, 'Lucía Fernández', 'activo', NOW(), NOW()),
(10, 'David Mendoza', 'activo', NOW(), NOW());

-- Ana Pérez, inscrita en Mate y Física
INSERT INTO "Inscripcions" ("CursoId", "EstudianteId", "createdAt", "updatedAt") VALUES
(1, 1, NOW(), NOW()),
(2, 1, NOW(), NOW());

-- Luis Gómez, inscrito en Física, Progra, y Base
INSERT INTO "Inscripcions" ("CursoId", "EstudianteId", "createdAt", "updatedAt") VALUES
(2, 2, NOW(), NOW()),
(3, 2, NOW(), NOW()),
(6, 2, NOW(), NOW());

-- María López, inscrita en Literatura y Química
INSERT INTO "Inscripcions" ("CursoId", "EstudianteId", "createdAt", "updatedAt") VALUES
(5, 3, NOW(), NOW()),
(4, 3, NOW(), NOW());

-- Carlos Díaz, inscrito en Química (Qué vago)
INSERT INTO "Inscripcions" ("CursoId", "EstudianteId", "createdAt", "updatedAt") VALUES
(4, 4, NOW(), NOW());

-- Elena Torres, inscrita en Progra y Base
INSERT INTO "Inscripcions" ("CursoId", "EstudianteId", "createdAt", "updatedAt") VALUES
(3, 5, NOW(), NOW()),
(6, 5, NOW(), NOW());

-- Jorge Ramírez, inscrito en Mate (otro vago)
INSERT INTO "Inscripcions" ("CursoId", "EstudianteId", "createdAt", "updatedAt") VALUES
(1, 6, NOW(), NOW());

-- Sofía Morales, inscrita en todos los cursos (wow)
INSERT INTO "Inscripcions" ("CursoId", "EstudianteId", "createdAt", "updatedAt") VALUES
(1, 7, NOW(), NOW()),
(2, 7, NOW(), NOW()),
(3, 7, NOW(), NOW()),
(4, 7, NOW(), NOW()),
(5, 7, NOW(), NOW()),
(6, 7, NOW(), NOW());

-- Pedro Castillo, inscrito en Literatura (otro vago más)
INSERT INTO "Inscripcions" ("CursoId", "EstudianteId", "createdAt", "updatedAt") VALUES
(5, 8, NOW(), NOW());

-- Lucía Fernández, inscrita en Física y Progra
INSERT INTO "Inscripcions" ("CursoId", "EstudianteId", "createdAt", "updatedAt") VALUES
(2, 9, NOW(), NOW()),
(3, 9, NOW(), NOW());

-- David Mendoza, inscrito en Mate y Química
INSERT INTO "Inscripcions" ("CursoId", "EstudianteId", "createdAt", "updatedAt") VALUES
(1, 10, NOW(), NOW()),
(4, 10, NOW(), NOW());