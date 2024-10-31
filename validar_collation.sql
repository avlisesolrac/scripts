SELECT t.name TableName, c.name ColumnName, collation_name
FROM sys.columns c
Inner join sys.tables t on c.objetc_id = t.object_id where collation_name <> ‘Latin1_General_Bin’;

SELECT t.name AS NomeTabela, 
       c.name AS NomeColuna, 
       c.collation_name AS NomeColação
FROM sys.columns c
INNER JOIN sys.tables t ON c.object_id = t.object_id 
WHERE c.collation_name <> 'Latin1_General_Bin';