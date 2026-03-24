-- Tabla para contener los datos de los técnicos encargados de las pizarras.
CREATE TABLE IF NOT EXISTS tecnicos(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    especialidad VARCHAR(50) NOT NULL
);
