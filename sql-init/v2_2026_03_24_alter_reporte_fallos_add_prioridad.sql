-- ================================================================
-- Modulo 2: Modificacion y Evolucion del Esquema
-- Script: v2_2026_03_24_alter_reporte_fallos_add_prioridad.sql
-- Descripcion: Anade la columna nivel_prioridad para categorizar fallos
-- ================================================================

-- 3.1. Alteracion de Tablas (ALTER TABLE)
-- Ante la necesidad de categorizar los fallos por prioridad,
-- se anade la columna nivel_prioridad con tipo NUMERIC(1,0)
-- y una restriccion CHECK que limita los valores al rango 1-5

ALTER TABLE reporte_fallos
ADD COLUMN nivel_prioridad NUMERIC(1,0)
CHECK (nivel_prioridad BETWEEN 1 AND 5);

/*
Justificacion del tipo NUMERIC(1,0):
- NUMERIC es preciso para valores numericos donde la exactitud es requerida
- (1,0) indica 1 digito total con 0 decimales, permitiendo valores de 0 a 9
- El CHECK limita a valores entre 1 y 5:
  * 1 = Muy baja prioridad
  * 2 = Baja prioridad
  * 3 = Prioridad media
  * 4 = Alta prioridad
  * 5 = Critica / Urgente
*/
