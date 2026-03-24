-- ================================================================
-- Script: v1_2026_03_24_test_cases.sql
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

-- ================================================================
-- TEST 1: Probar restriccion CHECK en nivel_prioridad (> 5 debe fallar)
-- ================================================================
\echo ''
\echo '========================================'
\echo 'TEST 1: CHECK nivel_prioridad > 5 (DEBE FALLAR)'
\echo '========================================'
\echo 'Intentando insertar con prioridad 6 (debe dar error)...'

-- Este INSERT debe fallar debido al CHECK constraint
INSERT INTO reporte_fallos(fecha, descripcion, pizarra_id, tecnico_id, nivel_prioridad) VALUES
('2026-03-24', 'Test prioridad invalida', 6, 1, 6);

\echo ''
\echo 'Resultado: Se esperaba un error de violacion de CHECK constraint'

-- ================================================================
-- TEST 2: Probar ON DELETE SET NULL (eliminar tecnico)
-- ================================================================
\echo ''
\echo '========================================'
\echo 'TEST 2: ON DELETE SET NULL (Eliminar tecnico)'
\echo '========================================'
\echo 'Estado ANTES de eliminar tecnico:'
SELECT id, nombre, especialidad FROM tecnicos WHERE id = 1;
\echo 'Reportes asociados al tecnico 1 ANTES:'
SELECT id, descripcion, tecnico_id FROM reporte_fallos WHERE tecnico_id = 1;

-- Eliminar tecnico con id = 1 (Juan Perez)
-- Los reportes deben mantener tecnico_id = NULL
DELETE FROM tecnicos WHERE id = 1;

\echo ''
\echo 'Tecnico eliminado. Verificando ON DELETE SET NULL...'
\echo 'Reportes asociados (ahora tecnico_id debe ser NULL):'
SELECT id, descripcion, tecnico_id FROM reporte_fallos WHERE tecnico_id IS NULL AND id IN (1,2,3,4,5);

-- ================================================================
-- TEST 3: Probar ON DELETE CASCADE (eliminar pizarra)
-- ================================================================
\echo ''
\echo '========================================'
\echo 'TEST 3: ON DELETE CASCADE (Eliminar pizarra)'
\echo '========================================'
\echo 'Total de reportes ANTES de eliminar pizarra 6:'
SELECT COUNT(*) as total_reportes FROM reporte_fallos;

\echo 'Eliminando pizarra con id = 6 (no tiene reportes)...'
DELETE FROM pizarras WHERE id = 6;

\echo ''
\echo 'Total de reportes DESPUES (debe ser el mismo, pizarra 6 no tenia reportes):'
SELECT COUNT(*) as total_reportes FROM reporte_fallos;

\echo ''
\echo 'Verificando pizarra 6 fue eliminada:'
SELECT * FROM pizarras WHERE id = 6;

-- ================================================================
-- RESUMEN FINAL
-- ================================================================
\echo ''
\echo '========================================'
\echo 'RESUMEN DE TESTS DE INTEGRIDAD:'
\echo '========================================'
\echo '1. CHECK nivel_prioridad: Valida solo valores 1-5'
\echo '2. ON DELETE SET NULL: Reportes mantienen al eliminar tecnico'
\echo '3. ON DELETE CASCADE: Reportes eliminados al eliminar pizarra'
\echo ''
\echo 'Estado final de todas las tablas:'
SELECT 'PIZARRAS:' as tabla, COUNT(*) as total FROM pizarras
UNION ALL
SELECT 'TECNICOS:', COUNT(*) FROM tecnicos
UNION ALL
SELECT 'REPORTES_FALLOS:', COUNT(*) FROM reporte_fallos;
