-- ================================================================
-- Modulo 2: Optimizacion mediante Indices (Diseno Fisico)
-- Script: v2_2026_03_24_create_indexes.sql
-- Descripcion: Crea indices secundarios para optimizar consultas
-- ================================================================

-- 3.2. Optimizacion mediante Indices
-- Segun el Capitulo 8.1.2 de Marques, la representacion fisica es crucial
-- para el rendimiento del acceso a los datos

-- Indice 1: Para la columna fecha en reporte_fallos
-- Permite busquedas rapidas por rango de fechas y ordenamiento cronologico
CREATE INDEX idx_reporte_fallos_fecha ON reporte_fallos(fecha);

-- Indice 2: Para el identificador del tecnico asignado
-- Optimiza consultas que filtran o agrupan por tecnico
CREATE INDEX idx_reporte_fallos_tecnico ON reporte_fallos(tecnico_id);

/*
ANALISIS: Impacto de los indices en el Planificador de Consultas

Los indices creados afectan significativamente al Planificador de Consultas de PostgreSQL:

1. Index Scan vs Sequential Scan:
   - SIN indices: El planificador debe realizar un Sequential Scan (recorrido secuencial)
     leyendo todas las tuplas de la tabla para encontrar los registros coincidentes.
   - CON indices: El planificador puede elegir un Index Scan, accediendo directamente
     a las filas que cumplen la condicion mediante la estructura B-Tree del indice.

2. Rendimiento de lectura vs costo de escritura:

   - VENTAJAS LECTURA:
     * Consultas con WHERE fecha = '...' o tecnico_id = X son O(log n) en lugar de O(n)
     * ORDER BY fecha se beneficia del indice pre-ordenado
     * JOINs con tecnicos se aceleran mediante el indice en tecnico_id

   - COSTOS ESCRITURA:
     * Cada INSERT requiere actualizar ambos indices (operaciones adicionales de escritura)
     * Cada DELETE tambien debe eliminar las entradas correspondientes en los indices
     * Cada UPDATE en columnas indexadas requiere modificar la estructura del indice

3. Balance del administrador:
   Segun el Capitulo 1.5, el administrador debe balancear:
   - El "coste del equipamiento adicional" (espacio en disco para almacenar indices)
   - El beneficio en operaciones de lectura (consultas mas rapidas)
   - El impacto negativo en operaciones de escritura (INSERT/UPDATE/DELETE mas lentos)

   REGLA GENERAL: Crear indices solo en columnas frecuentemente usadas en:
   - Clauses WHERE
   - Condiciones JOIN
   - Clauses ORDER BY
   - No indexar columnas con muchas actualizaciones y pocas consultas
*/
