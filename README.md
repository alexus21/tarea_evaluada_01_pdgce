# Sistema de Reporte de Fallos en Pizarras Electrónicas

**Departamento de Ingeniería y Arquitectura**

---

## Requisitos Previos

- Docker
- Docker Compose
- Git (para clonar el repositorio)

---

## Instalación y Ejecución

### 1. Clonar el Repositorio

```bash
git clone https://github.com/yurdeth/practica-uji-sistema-reporte-fallos.git
cd practica-uji-sistema-reporte-fallos
```

### 2. Levantar los Servicios

```bash
docker compose up -d
```

Este comando iniciará dos contenedores:
- **postgres17**: PostgreSQL 17 en el puerto 5434
- **pgadmin**: Interfaz web de administración en el puerto 5050

### 3. Verificar que los Contenedores Están Corriendo

```bash
docker compose ps
```

Se debería ver algo como:
```
NAME                IMAGE              STATUS
postgres17          postgres:17        Up
pgadmin            dpage/pgadmin4     Up
```

---

## Acceso a la Base de Datos

### Mediante pgAdmin (Interfaz Web)

1. Abrir el navegador en: http://localhost:5050
2. Iniciar sesión:
   - **Email**: admin@admin.com
   - **Contraseña**: admin123
3. Agregar un nuevo servidor:
   - **Nombre**: PostgreSQL 17 (o el nombre que se prefiera)
   - **Host**: postgres17 (o localhost si se conecta desde fuera del contenedor)
   - **Puerto**: 5432
   - **Usuario**: postgres
   - **Contraseña**: admin123
   - **Base de datos**: db_eboard_bug_report

### Mediante psql (Línea de Comandos)

```bash
docker exec -it postgres17 psql -U postgres -d db_eboard_bug_report
```

---

## Ejecución Manual de Scripts (si es necesario)

**Nota:** Al levantar los servicios por primera vez, el archivo `main.sql` se ejecuta automáticamente y crea todas las tablas, triggers y demás objetos de la base de datos. No es necesario ejecutarlo manualmente a menos que se detecte que los objetos no se crearon correctamente.

Si por alguna razón los scripts no se ejecutaron automáticamente al iniciar los contenedores, se pueden ejecutar manualmente:

```bash
# Ejecutar el script principal (carga todos los demás)
docker exec -it postgres17 psql -U postgres -d db_eboard_bug_report -f /docker-entrypoint-initdb.d/main.sql
```

---

## Verificar que el Sistema Funciona Correctamente

Una vez dentro de la base de datos (mediante pgAdmin o psql), se debe ejecutar:

```sql
-- Ver las tablas creadas
\dt

-- Ver los triggers creados
SELECT tgname FROM pg_trigger WHERE tgname LIKE '%pizarra%';

-- Ver la estructura de la tabla reporte_fallos
\d+ reporte_fallos

-- Ver los datos iniciales
SELECT * FROM tecnicos;
SELECT * FROM pizarras;
```

---

## Estructura de Scripts SQL

| Archivo | Descripción |
|---------|-------------|
| `main.sql` | Punto de entrada único que llama a todos los demás scripts en orden |
| `v1_2026_03_23_create_tecnicos_table.sql` | Crea la tabla tecnicos |
| `v1_2026_03_23_create_pizarras_table.sql` | Crea la tabla pizarras |
| `v1_2026_03_23_create_reporte_fallos_table.sql` | Crea la tabla reporte_fallos |
| `v1_2026_03_23_create_trigger_reporte_fallos.sql` | Crea función PL/pgSQL y trigger de actualización de estado de pizarra |
| `v1_2026_03_23_insert_tecnicos.sql` | Inserta datos iniciales de técnicos |
| `v1_2026_03_23_insert_pizarras.sql` | Inserta datos iniciales de pizarras |

---

## Autores

- Hugo Alexander Ulloa Serpas - US21003
- Josué Isaac Herrera Campos - HC21018


