-- 1. Documentación para la tabla 'tecnicos'
COMMENT ON TABLE tecnicos IS 'Almacena la información del personal técnico responsable del mantenimiento y reparación de las infraestructuras docentes de la UJI.';

-- 2. Documentación para la columna 'estado' de la tabla 'pizarras'
COMMENT ON COLUMN pizarras.estado IS 'Indica la condición operativa actual del equipo. Su valor está limitado por una restricción CHECK a: Operativa, En Reparación o Fuera de Servicio.';