DECLARE
    TSS_DE_NOTA_URL VARCHAR2(255) := 'http://tss-homologacao.totvscloud.com.br:8261';
    TSS_DO_TAF_URL VARCHAR2(255) := 'http://taf-hmg.tss.cloudtotvs.com.br:8080';
    ALIAS_DO_CLIENTE VARCHAR2(255) := 'ALIAS_DO_CLIENTE';
    URL_EXTERNA_DO_WF VARCHAR2(255) := 'URL_EXTERNA_DO_WF';
    URL_INTERNA_DO_WF VARCHAR2(255) := 'URL_INTERNA_DO_WF';
    URL_EXTERNA_DO_WF_HTTP VARCHAR2(255) := 'URL_EXTERNA_DO_WF_HTTP';
    URL_EXTERNA_DO_WF_BRWSR VARCHAR2(255) := 'URL_EXTERNA_DO_WF';
    URL_INTERNA_DO_REST VARCHAR2(255) := 'URL_INTERNA_DO_REST';
    URL_EXTERNA_DO_REST_TAF_FUTURO VARCHAR2(255) := 'URL_EXTERNA_DO_REST_DO_TAF_DO_FUTURO';
    URL_EXTERNA_DO_HTTP VARCHAR2(255) := 'URL_EXTERNA_DO_HTTP_DO_TAF_DO_FUTURO';
    PORTA_DBACCESS NUMBER := 7891;

    TableName VARCHAR2(255);
    SQLQuery VARCHAR2(1000);
    
    CURSOR TableCursor IS
        SELECT TABLE_NAME
        FROM USER_TABLES
        WHERE TABLE_NAME LIKE 'SX6%';
        
BEGIN
    OPEN TableCursor;
    LOOP
        FETCH TableCursor INTO TableName;
        EXIT WHEN TableCursor%NOTFOUND;
        
        -- ATUALIZA AS URLS DO TSS DE NOTA FISCAL ELETRÔNICA
        SQLQuery := 'UPDATE ' || TableName || ' SET X6_CONTEUD = :TSS_DE_NOTA_URL, X6_CONTSPA = :TSS_DE_NOTA_URL, X6_CONTENG = :TSS_DE_NOTA_URL WHERE X6_VAR = ''MV_SPEDURL''';
        EXECUTE IMMEDIATE SQLQuery USING TSS_DE_NOTA_URL, TSS_DE_NOTA_URL, TSS_DE_NOTA_URL;
        
        -- ATUALIZA AS URLS DO TSS DE NOTA FISCAL DE CUPOM ELETRÔNICO
        SQLQuery := 'UPDATE ' || TableName || ' SET X6_CONTEUD = :TSS_DE_NOTA_URL, X6_CONTSPA = :TSS_DE_NOTA_URL, X6_CONTENG = :TSS_DE_NOTA_URL WHERE X6_VAR = ''MV_NFCEURL''';
        EXECUTE IMMEDIATE SQLQuery USING TSS_DE_NOTA_URL, TSS_DE_NOTA_URL, TSS_DE_NOTA_URL;
        
        -- ATUALIZA AS URLS DO TSS DO TAF PARA TRANSMISSÃO DO E-SOCIAL E REINF
        SQLQuery := 'UPDATE ' || TableName || ' SET X6_CONTEUD = :TSS_DO_TAF_URL, X6_CONTSPA = :TSS_DO_TAF_URL, X6_CONTENG = :TSS_DO_TAF_URL WHERE X6_VAR = ''MV_TAFSURL''';
        EXECUTE IMMEDIATE SQLQuery USING TSS_DO_TAF_URL, TSS_DO_TAF_URL, TSS_DO_TAF_URL;
        
        -- ATUALIZA PARA A PORTA PADRÃO 7891 DO DBACCESS PARA A ROTINA DE AUTOCONTIDAS DO TAF
        SQLQuery := 'UPDATE ' || TableName || ' SET X6_CONTEUD = :PORTA_DBACCESS, X6_CONTSPA = :PORTA_DBACCESS, X6_CONTENG = :PORTA_DBACCESS WHERE X6_VAR = ''MV_TAFPORT''';
        EXECUTE IMMEDIATE SQLQuery USING PORTA_DBACCESS, PORTA_DBACCESS, PORTA_DBACCESS;
        
        -- ATUALIZA O NOME DO BANCO DE DADOS UTILIZADO NO TAF
        SQLQuery := 'UPDATE ' || TableName || ' SET X6_CONTEUD = :ALIAS_DO_CLIENTE, X6_CONTSPA = :ALIAS_DO_CLIENTE, X6_CONTENG = :ALIAS_DO_CLIENTE WHERE X6_VAR = ''MV_TAFTALI''';
        EXECUTE IMMEDIATE SQLQuery USING ALIAS_DO_CLIENTE, ALIAS_DO_CLIENTE, ALIAS_DO_CLIENTE;
        
        -- ATUALIZA O ENDEREÇO INTERNO DO REST DO TAF
        SQLQuery := 'UPDATE ' || TableName || ' SET X6_CONTEUD = :URL_INTERNA_DO_REST, X6_CONTSPA = :URL_INTERNA_DO_REST, X6_CONTENG = :URL_INTERNA_DO_REST WHERE X6_VAR = ''MV_TAFREST''';
        EXECUTE IMMEDIATE SQLQuery USING URL_INTERNA_DO_REST, URL_INTERNA_DO_REST, URL_INTERNA_DO_REST;
        
        -- ATUALIZA O ENDEREÇO EXTERNO DO REST DO TAF DO FUTURO
        SQLQuery := 'UPDATE ' || TableName || ' SET X6_CONTEUD = :URL_EXTERNA_DO_REST_TAF_FUTURO, X6_CONTSPA = :URL_EXTERNA_DO_REST_TAF_FUTURO, X6_CONTENG = :URL_EXTERNA_DO_REST_TAF_FUTURO WHERE X6_VAR = ''MV_BACKEND''';
        EXECUTE IMMEDIATE SQLQuery USING URL_EXTERNA_DO_REST_TAF_FUTURO, URL_EXTERNA_DO_REST_TAF_FUTURO, URL_EXTERNA_DO_REST_TAF_FUTURO;
        
        -- ATUALIZA O ENDEREÇO EXTERNO HTTP TAF DO FUTURO
        SQLQuery := 'UPDATE ' || TableName || ' SET X6_CONTEUD = :URL_EXTERNA_DO_HTTP, X6_CONTSPA = :URL_EXTERNA_DO_HTTP, X6_CONTENG = :URL_EXTERNA_DO_HTTP WHERE X6_VAR = ''MV_GCTPURL''';
        EXECUTE IMMEDIATE SQLQuery USING URL_EXTERNA_DO_HTTP, URL_EXTERNA_DO_HTTP, URL_EXTERNA_DO_HTTP;
        
        -- ATUALIZA O ENDEREÇO EXTERNO DO WORKFLOW
        SQLQuery := 'UPDATE ' || TableName || ' SET X6_CONTEUD = :URL_EXTERNA_DO_WF, X6_CONTSPA = :URL_EXTERNA_DO_WF, X6_CONTENG = :URL_EXTERNA_DO_WF WHERE X6_VAR = ''MV_WFHTTPE''';
        EXECUTE IMMEDIATE SQLQuery USING URL_EXTERNA_DO_WF, URL_EXTERNA_DO_WF, URL_EXTERNA_DO_WF;
        
        -- ATUALIZA O ENDEREÇO INTERNO DO WORKFLOW
        SQLQuery := 'UPDATE ' || TableName || ' SET X6_CONTEUD = :URL_INTERNA_DO_WF, X6_CONTSPA = :URL_INTERNA_DO_WF, X6_CONTENG = :URL_INTERNA_DO_WF WHERE X6_VAR = ''MV_WFHTTPI''';
        EXECUTE IMMEDIATE SQLQuery USING URL_INTERNA_DO_WF, URL_INTERNA_DO_WF, URL_INTERNA_DO_WF;
        
        -- ATUALIZA O ENDEREÇO DO WORKFLOW HTTP
        SQLQuery := 'UPDATE ' || TableName || ' SET X6_CONTEUD = :URL_EXTERNA_DO_WF_HTTP, X6_CONTSPA = :URL_EXTERNA_DO_WF_HTTP, X6_CONTENG = :URL_EXTERNA_DO_WF_HTTP WHERE X6_VAR = ''MV_NGWFHT''';
        EXECUTE IMMEDIATE SQLQuery USING URL_EXTERNA_DO_WF_HTTP, URL_EXTERNA_DO_WF_HTTP, URL_EXTERNA_DO_WF_HTTP;
        
        -- ATUALIZA O ENDEREÇO DO WORKFLOW VIA BROWSER
        SQLQuery := 'UPDATE ' || TableName || ' SET X6_CONTEUD = :URL_EXTERNA_DO_WF_BRWSR, X6_CONTSPA = :URL_EXTERNA_DO_WF_BRWSR, X6_CONTENG = :URL_EXTERNA_DO_WF_BRWSR WHERE X6_VAR = ''MV_WFBRWSR''';
        EXECUTE IMMEDIATE SQLQuery USING URL_EXTERNA_DO_WF_BRWSR, URL_EXTERNA_DO_WF_BRWSR, URL_EXTERNA_DO_WF_BRWSR;
        
    END LOOP;
    CLOSE TableCursor;
END;


-- SELECT PARA EXIBIR AS ALTERAÇÕES NA TABELA APÓS OS UPDATES:
SELECT X6_VAR, X6_CONTEUD, X6_CONTSPA, X6_CONTENG
FROM SX6010
WHERE X6_VAR IN ('MV_SPEDURL', 'MV_NFCEURL', 'MV_TAFSURL', 'MV_TAFPORT', 'MV_TAFTALI', 'MV_TAFREST', 'MV_BACKEND', 'MV_GCTPURL', 'ZZ_WFIPEXT', 'ZZ_WFQHOST', 'MV_WFBRWSR', 'MV_WFHTTPE', 'MV_WFHTTPI', 'MV_NGWFHT');


SELECT * FROM XX0 WHERE R_E_C_D_E_L_ = 0;

--- UPDATE PARA AJUSTAR O IP E PORTA NA XX0 
UPDATE XX0 SET XX0_IP = '127.0.0.1', XX0_PORTA = 6800 WHERE R_E_C_D_E_L_ = 0

SELECT * FROM XX0 WHERE R_E_C_D_E_L_ = 0;