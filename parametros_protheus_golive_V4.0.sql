DECLARE @TSS_DE_NOTA_URL VARCHAR(255) = 'http://tss-protheus.totvscloud.com.br:8301';
DECLARE @TSS_DO_TAF_URL VARCHAR(255) = 'http://taf-prd.tss.cloudtotvs.com.br:8080';
DECLARE @ALIAS_DO_CLIENTE VARCHAR(255) = 'ALIAS_DO_CLIENTE';
DECLARE @URL_EXTERNA_DO_WF VARCHAR(255) = 'URL_EXTERNA_DO_WF';
DECLARE @URL_INTERNA_DO_WF VARCHAR(255) = 'URL_INTERNA_DO_WF';
DECLARE @URL_EXTERNA_DO_WF_HTTP VARCHAR(255) = 'URL_EXTERNA_DO_WF_HTTP';
DECLARE @URL_EXTERNA_DO_WF_BRWSR VARCHAR(255) = 'URL_EXTERNA_DO_WF';
DECLARE @URL_INTERNA_DO_REST VARCHAR(255) = 'URL_INTERNA_DO_REST';
DECLARE @URL_EXTERNA_DO_REST_TAF_FUTURO VARCHAR(255) = 'URL_EXTERNA_DO_REST_DO_TAF_DO_FUTURO';
DECLARE @URL_EXTERNA_DO_HTTP VARCHAR(255) = 'URL_EXTERNA_DO_HTTP_DO_TAF_DO_FUTURO';
DECLARE @PORTA_DBACCESS INT = 7891;

-- SELECT PARA EXIBIR O CONTEUDO DOS PARÂMETROS ANTES DOS UPDATES:
SELECT X6_CONTEUD, X6_CONTSPA, X6_CONTENG
FROM SX6010
WHERE X6_VAR IN ('MV_SPEDURL', 'MV_NFCEURL', 'MV_TAFSURL', 'MV_TAFPORT', 'MV_TAFTALI', 'MV_TAFREST', 'MV_BACKEND', 'MV_GCTPURL', 'ZZ_WFIPEXT', 'ZZ_WFQHOST', 'MV_WFBRWSR', 'MV_WFHTTPE', 'MV_WFHTTPI', 'MV_NGWFHT');


-- ATUALIZA AS URLS DO TSS DE NOTA FISCAL ELETRÔNICA
UPDATE SX6010
SET 
    X6_CONTEUD = @TSS_DE_NOTA_URL,
    X6_CONTSPA = @TSS_DE_NOTA_URL,
    X6_CONTENG = @TSS_DE_NOTA_URL
WHERE X6_VAR = 'MV_SPEDURL';

-- ATUALIZA AS URLS DO TSS DE NOTA FISCAL DE CUPOM ELETRÔNICO
UPDATE SX6010
SET 
    X6_CONTEUD = @TSS_DE_NOTA_URL,
    X6_CONTSPA = @TSS_DE_NOTA_URL,
    X6_CONTENG = @TSS_DE_NOTA_URL
WHERE X6_VAR = 'MV_NFCEURL';

-- ATUALIZA AS URLS DO TSS DO TAF PARA TRANSMISSÃO DO E-SOCIAL E REINF
UPDATE SX6010
SET 
    X6_CONTEUD = @TSS_DO_TAF_URL,
    X6_CONTSPA = @TSS_DO_TAF_URL,
    X6_CONTENG = @TSS_DO_TAF_URL
WHERE X6_VAR = 'MV_TAFSURL';

-- ATUALIZA PARA A PORTA PADRÃO 7891 DO DBACCESS PARA A ROTINA DE AUTOCONTIDAS DO TAF.
UPDATE SX6010
SET 
    X6_CONTEUD = @PORTA_DBACCESS,
    X6_CONTSPA = @PORTA_DBACCESS,
    X6_CONTENG = @PORTA_DBACCESS
WHERE X6_VAR = 'MV_TAFPORT';

-- ATUALIZA O NOME DO BANCO DE DADOS UTILIZADO NO TAF
UPDATE SX6010
SET 
    X6_CONTEUD = @ALIAS_DO_CLIENTE,
    X6_CONTSPA = @ALIAS_DO_CLIENTE,
    X6_CONTENG = @ALIAS_DO_CLIENTE
WHERE X6_VAR = 'MV_TAFTALI';

-- ATUALIZA O ENDEREÇO INTERNO DO REST DO TAF
UPDATE SX6010
SET 
    X6_CONTEUD = @URL_INTERNA_DO_REST,
    X6_CONTSPA = @URL_INTERNA_DO_REST,
    X6_CONTENG = @URL_INTERNA_DO_REST
WHERE X6_VAR = 'MV_TAFREST';

-- ATUALIZA O ENDEREÇO EXTERNO DO REST DO TAF DO FUTURO
UPDATE SX6010
SET 
    X6_CONTEUD = @URL_EXTERNA_DO_REST_TAF_FUTURO,
    X6_CONTSPA = @URL_EXTERNA_DO_REST_TAF_FUTURO,
    X6_CONTENG = @URL_EXTERNA_DO_REST_TAF_FUTURO
WHERE X6_VAR = 'MV_BACKEND';

-- ATUALIZA O ENDEREÇO EXTERNO HTTP TAF DO FUTURO
UPDATE SX6010
SET 
    X6_CONTEUD = @URL_EXTERNA_DO_HTTP,
    X6_CONTSPA = @URL_EXTERNA_DO_HTTP,
    X6_CONTENG = @URL_EXTERNA_DO_HTTP
WHERE X6_VAR = 'MV_GCTPURL';

-- ATUALIZA O ENDEREÇO EXTERNO DO WORKFLOW
UPDATE SX6010
SET 
    X6_CONTEUD = @URL_EXTERNA_DO_WF,
    X6_CONTSPA = @URL_EXTERNA_DO_WF,
    X6_CONTENG = @URL_EXTERNA_DO_WF
WHERE X6_VAR = 'MV_WFHTTPE';

-- ATUALIZA O ENDEREÇO INTERNO DO WORKFLOW
UPDATE SX6010
SET 
    X6_CONTEUD = @URL_INTERNA_DO_WF,
    X6_CONTSPA = @URL_INTERNA_DO_WF,
    X6_CONTENG = @URL_INTERNA_DO_WF
WHERE X6_VAR = 'MV_WFHTTPI';

-- ATUALIZA O ENDEREÇO DO WORKFLOW HTTP
UPDATE SX6010
SET 
    X6_CONTEUD = @URL_EXTERNA_DO_WF_HTTP,
    X6_CONTSPA = @URL_EXTERNA_DO_WF_HTTP,
    X6_CONTENG = @URL_EXTERNA_DO_WF_HTTP
WHERE X6_VAR = 'MV_NGWFHT';

-- ATUALIZA O ENDEREÇO DO WORKFLOW VIA BROWSER
UPDATE SX6010
SET 
    X6_CONTEUD = @URL_EXTERNA_DO_WF_BRWSR,
    X6_CONTSPA = @URL_EXTERNA_DO_WF_BRWSR,
    X6_CONTENG = @URL_EXTERNA_DO_WF_BRWSR
WHERE X6_VAR = 'MV_WFBRWSR';


-- SELECT PARA EXIBIR AS ALTERAÇÕES NA TABELA APÓS OS UPDATES:
SELECT X6_CONTEUD, X6_CONTSPA, X6_CONTENG
FROM SX6010
WHERE X6_VAR IN ('MV_SPEDURL', 'MV_NFCEURL', 'MV_TAFSURL', 'MV_TAFPORT', 'MV_TAFTALI', 'MV_TAFREST', 'MV_BACKEND', 'MV_GCTPURL', 'ZZ_WFIPEXT', 'ZZ_WFQHOST', 'MV_WFBRWSR', 'MV_WFHTTPE', 'MV_WFHTTPI', 'MV_NGWFHT');