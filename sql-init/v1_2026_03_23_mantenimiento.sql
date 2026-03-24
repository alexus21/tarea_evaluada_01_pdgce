VACUUM ANALYZE reporte_fallos;
/*
El uso de VACUUM ANALYZE de forma combinada es la estrategia ideal para mantener la salud de la 
base de datos en entornos con alta rotación de datos (inserciones y borrados frecuentes):

Por parte de VACUUM (Limpieza): Se encarga de reclamar el espacio físico ocupado por los registros 
obsoletos ("tuplas muertas" generadas por el ON DELETE CASCADE o actualizaciones). 
Esto evita la fragmentación y el crecimiento innecesario de los ficheros de datos en el disco.

Por parte de ANALYZE (Estadísticas): Al ejecutarse inmediatamente después de la limpieza, actualiza 
los metadatos de distribución de la tabla con la estructura de datos real. 
Esto es vital para el Planificador de Consultas, ya que con estadísticas frescas, 
el optimizador puede elegir la ruta de acceso más eficiente 
(por ejemplo, decidir si es más rápido usar un Index Scan a través de los índices creados en el Módulo 2 o recurrir a un Sequential Scan).*/