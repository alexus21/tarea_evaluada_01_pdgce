-- Módulo 1: Creación de Objetos y Lógica Programable (DDL Avanzado)
\i /docker-entrypoint-initdb.d/v1_2026_03_23_create_tecnicos_table.sql
\i /docker-entrypoint-initdb.d/v1_2026_03_23_create_pizarras_table.sql
\i /docker-entrypoint-initdb.d/v1_2026_03_23_create_reporte_fallos_table.sql
\i /docker-entrypoint-initdb.d/v1_2026_03_23_create_trigger_reporte_fallos.sql

\i /docker-entrypoint-initdb.d/v1_2026_03_23_insert_tecnicos.sql
\i /docker-entrypoint-initdb.d/v1_2026_03_23_insert_pizarras.sql

-- Módulo 2: Modificación y Evolución del Esquema
\i /docker-entrypoint-initdb.d/v2_2026_03_24_alter_reporte_fallos_add_prioridad.sql
\i /docker-entrypoint-initdb.d/v2_2026_03_24_create_indexes.sql

-- Módulo 3: Mantenimiento Rutinario y Salud de la Base de Datos
\i /docker-entrypoint-initdb.d/v1_2026_03_23_mantenimiento.sql

-- Módulo 4: Documentación y Metadatos (Catálogo)
\i /docker-entrypoint-initdb.d/v1_2026_03_23_documentacion.sql

\i /docker-entrypoint-initdb.d/v1_2026_03_24_test_cases.sql
