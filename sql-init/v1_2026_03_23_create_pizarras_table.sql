-- Tabla que contiene la información de las pizarras electrónicas
CREATE TABLE IF NOT EXISTS pizarras(
    id SERIAL PRIMARY KEY,
    ubicacion VARCHAR(50) NOT NULL,
    estado VARCHAR(15) NOT NULL CHECK (estado IN ('Operativa', 'En Reparación', 'Fuera de Servicio'))
);
