-- Tabla que contiene la información de las pizarras electrónicas
CREATE TABLE IF NOT EXISTS reporte_fallos(
    id SERIAL PRIMARY KEY,
    fecha DATE NOT NULL DEFAULT CURRENT_DATE,
    descripcion VARCHAR(50) NOT NULL,
    pizarra_id INT NOT NULL,
    tecnico_id INT,
    CONSTRAINT fk_reporte_fallos_pizarras
        FOREIGN KEY (pizarra_id) REFERENCES pizarras(id)
            ON DELETE CASCADE,
    CONSTRAINT fk_reporte_fallos_tecnicos
        FOREIGN KEY (tecnico_id) REFERENCES tecnicos(id)
            ON DELETE SET NULL
);
