
-- PROJETO: Análise de Vendas
-- ETAPA: Exploração
-- OBJETIVO: Entender estrutura e qualidade dos dados


--- Explorar os dados
SELECT *
FROM Sales_Overview_Data LIMIT 10;

PRAGMA table_info('Sales_Overview_Data')

--- Analisar valores únicos 
SELECT DISTINCT Segment FROM Sales_Overview_Data;
SELECT DISTINCT "Ship Mode" FROM Sales_Overview_Data;
SELECT DISTINCT "Country/Region" FROM Sales_Overview_Data;
SELECT DISTINCT City FROM Sales_Overview_Data;
SELECT DISTINCT Region FROM Sales_Overview_Data;
SELECT DISTINCT Category FROM Sales_Overview_Data;
SELECT DISTINCT "Sub-Category" FROM Sales_Overview_Data;


