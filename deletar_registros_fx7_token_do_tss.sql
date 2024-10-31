SELECT * FROM FX7010

DECLARE @tableName NVARCHAR(128)
DECLARE @sql NVARCHAR(MAX)

-- Cursor para iterar por todas as tabelas que começam com 'FX7'
DECLARE table_cursor CURSOR FOR
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME LIKE 'FX7%' AND TABLE_TYPE = 'BASE TABLE'

OPEN table_cursor
FETCH NEXT FROM table_cursor INTO @tableName

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Verificar se a tabela tem as colunas R_E_C_D_E_L_ e R_E_C_N_O_
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_NAME = @tableName 
               AND COLUMN_NAME IN ('R_E_C_D_E_L_', 'R_E_C_N_O_'))
    BEGIN
        -- Montar o SQL dinâmico para atualizar as colunas
        SET @sql = 'UPDATE ' + @tableName + 
                   ' SET D_E_L_E_T_ = ''*'', R_E_C_D_E_L_ = R_E_C_N_O_ ' + 
                   ' WHERE R_E_C_D_E_L_ = 0'
        
        -- Executar o SQL dinâmico
        EXEC sp_executesql @sql
    END

    FETCH NEXT FROM table_cursor INTO @tableName
END

-- Fechar e liberar o cursor
CLOSE table_cursor
DEALLOCATE table_cursor

SELECT * FROM FX7010