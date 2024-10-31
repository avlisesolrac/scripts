DECLARE @TSS_DE_NOTA_URL VARCHAR(255) = 'http://tss-homologacao.totvscloud.com.br:8261';
DECLARE @TSS_DO_TAF_URL VARCHAR(255) = 'http://taf-hmg.tss.cloudtotvs.com.br:8080';
DECLARE @ALIAS_DO_CLIENTE VARCHAR(255) = 'ALIAS_DO_CLIENTE';
DECLARE @URL_EXTERNA_DO_WF VARCHAR(255) = 'URL_EXTERNA_DO_WF';
DECLARE @URL_INTERNA_DO_WF VARCHAR(255) = 'URL_INTERNA_DO_WF';
DECLARE @URL_EXTERNA_DO_WF_HTTP VARCHAR(255) = 'URL_EXTERNA_DO_WF_HTTP';
DECLARE @URL_EXTERNA_DO_WF_BRWSR VARCHAR(255) = 'URL_EXTERNA_DO_WF';
DECLARE @URL_INTERNA_DO_REST VARCHAR(255) = 'URL_INTERNA_DO_REST';
DECLARE @URL_EXTERNA_DO_REST_TAF_FUTURO VARCHAR(255) = 'URL_EXTERNA_DO_REST_DO_TAF_DO_FUTURO';
DECLARE @URL_EXTERNA_DO_HTTP VARCHAR(255) = 'URL_EXTERNA_DO_HTTP_DO_TAF_DO_FUTURO';
DECLARE @PORTA_DBACCESS INT = 7891;

DECLARE @TableName NVARCHAR(MAX)
DECLARE @SQLQuery NVARCHAR(MAX)

DECLARE TableCursor CURSOR FOR
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME LIKE 'SX6%'

OPEN TableCursor

FETCH NEXT FROM TableCursor INTO @TableName

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Aqui voc� executa as atualiza��es para cada tabela SX6*
    -- ATUALIZA AS URLS DO TSS DE NOTA FISCAL ELETR�NICA
    SET @SQLQuery = 'UPDATE ' + QUOTENAME(@TableName) + ' SET X6_CONTEUD = @TSS_DE_NOTA_URL, X6_CONTSPA = @TSS_DE_NOTA_URL, X6_CONTENG = @TSS_DE_NOTA_URL WHERE X6_VAR = ''MV_SPEDURL''';
    EXEC sp_executesql @SQLQuery, N'@TSS_DE_NOTA_URL VARCHAR(255)', @TSS_DE_NOTA_URL;

    -- ATUALIZA AS URLS DO TSS DE NOTA FISCAL DE CUPOM ELETR�NICO
    SET @SQLQuery = 'UPDATE ' + QUOTENAME(@TableName) + ' SET X6_CONTEUD = @TSS_DE_NOTA_URL, X6_CONTSPA = @TSS_DE_NOTA_URL, X6_CONTENG = @TSS_DE_NOTA_URL WHERE X6_VAR = ''MV_NFCEURL''';
    EXEC sp_executesql @SQLQuery, N'@TSS_DE_NOTA_URL VARCHAR(255)', @TSS_DE_NOTA_URL;

    -- ATUALIZA AS URLS DO TSS DO TAF PARA TRANSMISS�O DO E-SOCIAL E REINF
    SET @SQLQuery = 'UPDATE ' + QUOTENAME(@TableName) + ' SET X6_CONTEUD = @TSS_DO_TAF_URL, X6_CONTSPA = @TSS_DO_TAF_URL, X6_CONTENG = @TSS_DO_TAF_URL WHERE X6_VAR = ''MV_TAFSURL''';
    EXEC sp_executesql @SQLQuery, N'@TSS_DO_TAF_URL VARCHAR(255)', @TSS_DO_TAF_URL;

    -- ATUALIZA PARA A PORTA PADR�O 7891 DO DBACCESS PARA A ROTINA DE AUTOCONTIDAS DO TAF.
    SET @SQLQuery = 'UPDATE ' + QUOTENAME(@TableName) + ' SET X6_CONTEUD = @PORTA_DBACCESS, X6_CONTSPA = @PORTA_DBACCESS, X6_CONTENG = @PORTA_DBACCESS WHERE X6_VAR = ''MV_TAFPORT''';
    EXEC sp_executesql @SQLQuery, N'@PORTA_DBACCESS INT', @PORTA_DBACCESS;

    -- ATUALIZA O NOME DO BANCO DE DADOS UTILIZADO NO TAF
    SET @SQLQuery = 'UPDATE ' + QUOTENAME(@TableName) + ' SET X6_CONTEUD = @ALIAS_DO_CLIENTE, X6_CONTSPA = @ALIAS_DO_CLIENTE, X6_CONTENG = @ALIAS_DO_CLIENTE WHERE X6_VAR = ''MV_TAFTALI''';
    EXEC sp_executesql @SQLQuery, N'@ALIAS_DO_CLIENTE VARCHAR(255)', @ALIAS_DO_CLIENTE;

    -- ATUALIZA O ENDERE�O INTERNO DO REST DO TAF
    SET @SQLQuery = 'UPDATE ' + QUOTENAME(@TableName) + ' SET X6_CONTEUD = @URL_INTERNA_DO_REST, X6_CONTSPA = @URL_INTERNA_DO_REST, X6_CONTENG = @URL_INTERNA_DO_REST WHERE X6_VAR = ''MV_TAFREST''';
    EXEC sp_executesql @SQLQuery, N'@URL_INTERNA_DO_REST VARCHAR(255)', @URL_INTERNA_DO_REST;

    -- ATUALIZA O ENDERE�O EXTERNO DO REST DO TAF DO FUTURO
    SET @SQLQuery = 'UPDATE ' + QUOTENAME(@TableName) + ' SET X6_CONTEUD = @URL_EXTERNA_DO_REST_TAF_FUTURO, X6_CONTSPA = @URL_EXTERNA_DO_REST_TAF_FUTURO, X6_CONTENG = @URL_EXTERNA_DO_REST_TAF_FUTURO WHERE X6_VAR = ''MV_BACKEND''';
    EXEC sp_executesql @SQLQuery, N'@URL_EXTERNA_DO_REST_TAF_FUTURO VARCHAR(255)', @URL_EXTERNA_DO_REST_TAF_FUTURO;

    -- ATUALIZA O ENDERE�O EXTERNO HTTP TAF DO FUTURO
    SET @SQLQuery = 'UPDATE ' + QUOTENAME(@TableName) + ' SET X6_CONTEUD = @URL_EXTERNA_DO_HTTP, X6_CONTSPA = @URL_EXTERNA_DO_HTTP, X6_CONTENG = @URL_EXTERNA_DO_HTTP WHERE X6_VAR = ''MV_GCTPURL''';
    EXEC sp_executesql @SQLQuery, N'@URL_EXTERNA_DO_HTTP VARCHAR(255)', @URL_EXTERNA_DO_HTTP;

    -- ATUALIZA O ENDERE�O EXTERNO DO WORKFLOW
    SET @SQLQuery = 'UPDATE ' + QUOTENAME(@TableName) + ' SET X6_CONTEUD = @URL_EXTERNA_DO_WF, X6_CONTSPA = @URL_EXTERNA_DO_WF, X6_CONTENG = @URL_EXTERNA_DO_WF WHERE X6_VAR = ''MV_WFHTTPE''';
    EXEC sp_executesql @SQLQuery, N'@URL_EXTERNA_DO_WF VARCHAR(255)', @URL_EXTERNA_DO_WF;

    -- ATUALIZA O ENDERE�O INTERNO DO WORKFLOW
    SET @SQLQuery = 'UPDATE ' + QUOTENAME(@TableName) + ' SET X6_CONTEUD = @URL_INTERNA_DO_WF, X6_CONTSPA = @URL_INTERNA_DO_WF, X6_CONTENG = @URL_INTERNA_DO_WF WHERE X6_VAR = ''MV_WFHTTPI''';
    EXEC sp_executesql @SQLQuery, N'@URL_INTERNA_DO_WF VARCHAR(255)', @URL_INTERNA_DO_WF;

    -- ATUALIZA O ENDERE�O DO WORKFLOW HTTP
    SET @SQLQuery = 'UPDATE ' + QUOTENAME(@TableName) + ' SET X6_CONTEUD = @URL_EXTERNA_DO_WF_HTTP, X6_CONTSPA = @URL_EXTERNA_DO_WF_HTTP, X6_CONTENG = @URL_EXTERNA_DO_WF_HTTP WHERE X6_VAR = ''MV_NGWFHT''';
    EXEC sp_executesql @SQLQuery, N'@URL_EXTERNA_DO_WF_HTTP VARCHAR(255)', @URL_EXTERNA_DO_WF_HTTP;

    -- ATUALIZA O ENDERE�O DO WORKFLOW VIA BROWSER
    SET @SQLQuery = 'UPDATE ' + QUOTENAME(@TableName) + ' SET X6_CONTEUD = @URL_EXTERNA_DO_WF_BRWSR, X6_CONTSPA = @URL_EXTERNA_DO_WF_BRWSR, X6_CONTENG = @URL_EXTERNA_DO_WF_BRWSR WHERE X6_VAR = ''MV_WFBRWSR''';
    EXEC sp_executesql @SQLQuery, N'@URL_EXTERNA_DO_WF_BRWSR VARCHAR(255)', @URL_EXTERNA_DO_WF_BRWSR;

    FETCH NEXT FROM TableCursor INTO @TableName
END

CLOSE TableCursor
DEALLOCATE TableCursor

-- SELECT PARA EXIBIR AS ALTERA��ES NA TABELA AP�S OS UPDATES:
SELECT X6_VAR, X6_CONTEUD, X6_CONTSPA, X6_CONTENG
FROM SX6010
WHERE X6_VAR IN ('MV_SPEDURL', 'MV_NFCEURL', 'MV_TAFSURL', 'MV_TAFPORT', 'MV_TAFTALI', 'MV_TAFREST', 'MV_BACKEND', 'MV_GCTPURL', 'ZZ_WFIPEXT', 'ZZ_WFQHOST', 'MV_WFBRWSR', 'MV_WFHTTPE', 'MV_WFHTTPI', 'MV_NGWFHT');