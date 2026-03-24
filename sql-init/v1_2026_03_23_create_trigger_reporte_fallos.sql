CREATE OR REPLACE FUNCTION fn_update_status()
RETURNS TRIGGER AS $$
    BEGIN
        UPDATE pizarras SET estado = 'En Reparación' WHERE id = NEW.id;

        RETURN NEW;

    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_update_status
    AFTER INSERT ON reporte_fallos
    FOR EACH ROW EXECUTE FUNCTION fn_update_status();

/*
    Por qué es preferible el uso de AFTER:
    De esta forma, garantizamos que el registro ya se ha insertado correctamente.
    Si el registro existe, podemos actualizarlo.
    BEFORE podría tomar un registro de un INSERT que aún no se hubiera procesado,
    pudiendo o no crearse ese INSERT. Por lo tanto, habría una actualización mal creada:
    una pizarra tendría un estado En Reparación para un registro que falló en crearse.
    Con AFTER, nos aseguramos que el INSERT exista y, una vez finalizado, procedemos a ejecutar el trigger.
*/
