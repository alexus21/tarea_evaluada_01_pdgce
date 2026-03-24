-- ================================================================
-- Script: v1_2026_03_24_insert_reporte_fallos.sql
-- Descripcion: Inserta datos de prueba en reportes_fallos
--              y demuestra el funcionamiento del trigger
-- ================================================================

-- Mostrar estado inicial de pizarras (ANTES del insert)
\echo '========================================'
\echo 'ESTADO INICIAL DE PIZARRAS (ANTES):'
\echo '========================================'
SELECT * FROM pizarras ORDER BY id;

-- Insertar reportes de fallos de prueba
-- Esto activara el trigger que cambiara el estado a 'En Reparacion'
\echo ''
\echo '========================================'
\echo 'INSERTANDO REPORTES DE FALLOS...'
\echo '========================================'

INSERT INTO reporte_fallos(fecha, descripcion, pizarra_id, tecnico_id, nivel_prioridad) VALUES
('2026-03-24', 'Pantalla encendida pero sin imagen', 1, 1, 3),
('2026-03-24', 'No responde al touch', 2, 2, 4),
('2026-03-24', 'Parpadeo intermitente', 3, NULL, 2),
('2026-03-24', 'Cable HDMI danado', 4, 3, 5),
('2026-03-24', 'Error de sistema al iniciar', 5, 4, 1);

\echo ''
\echo '========================================'
\echo 'REPORTES DE FALLOS INSERTADOS:'
\echo '========================================'
SELECT * FROM reporte_fallos ORDER BY id;

-- Mostrar estado final de pizarras (DESPUES del insert)
-- Las pizarras con reportes deben tener estado 'En Reparacion'
\echo ''
\echo '========================================'
\echo 'ESTADO FINAL DE PIZARRAS (DESPUES):'
\echo '========================================'
\echo 'Notese como las pizarras con reportes cambiaron a "En Reparacion"'
SELECT * FROM pizarras ORDER BY id;
