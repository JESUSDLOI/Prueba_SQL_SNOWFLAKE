CREATE OR REPLACE PROCEDURE JESUS_DE_LA_OLIVA.secretos.MI_TABLA_CONTADOR()
RETURNS STRING
LANGUAGE SQL
AS
$$
DECLARE
    ultimo_valor NUMBER;
BEGIN
    -- Crear tabla si no existe
    EXECUTE IMMEDIATE '
        CREATE TABLE IF NOT EXISTS JESUS_DE_LA_OLIVA.secretos.MI_TABLA_CONTADOR (
            ID_SEQ NUMBER
        );
    ';

    -- Obtener el último valor insertado
    SELECT COALESCE(MAX(ID_SEQ), 0)
    INTO :ultimo_valor
    FROM JESUS_DE_LA_OLIVA.secretos.MI_TABLA_CONTADOR;

    -- Insertar el siguiente valor
    INSERT INTO JESUS_DE_LA_OLIVA.secretos.MI_TABLA_CONTADOR (ID_SEQ)
    VALUES (:ultimo_valor + 1);

    RETURN 'Insertado valor: ' || (ultimo_valor + 1);
END;
$$;
