\i /docker-entrypoint-initdb.d/v1_2026_03_23_create_tecnicos_table.sql
\i /docker-entrypoint-initdb.d/v1_2026_03_23_create_pizarras_table.sql
\i /docker-entrypoint-initdb.d/v1_2026_03_23_create_reporte_fallos_table.sql

-- Modulo 2: Alteracion de tabla para anadir prioridad
\i /docker-entrypoint-initdb.d/v2_2026_03_24_alter_reporte_fallos_add_prioridad.sql

-- Modulo 2: Creacion de indices para optimizacion
\i /docker-entrypoint-initdb.d/v2_2026_03_24_create_indexes.sql

\i /docker-entrypoint-initdb.d/v1_2026_03_23_create_trigger_reporte_fallos.sql
\i /docker-entrypoint-initdb.d/v1_2026_03_23_insert_tecnicos.sql
\i /docker-entrypoint-initdb.d/v1_2026_03_23_insert_pizarras.sql
\i /docker-entrypoint-initdb.d/v1_2026_03_24_insert_reporte_fallos.sql
\i /docker-entrypoint-initdb.d/v1_2026_03_23_mantenimiento.sql
\i /docker-entrypoint-initdb.d/v1_2026_03_23_documentacion.sql