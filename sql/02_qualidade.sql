
-- PROJETO: Análise de Vendas
-- ETAPA: Qualidade dos dados
-- OBJETIVO: Identificar valores nulos e registros duplicados


--- Checar por nulls
SELECT *
FROM Sales_Overview_Data 
WHERE "order date" IS NOT NULL
  AND sales > 0
  AND "customer id" IS NOT NULL;

WITH dados_check AS (
	SELECT *,
		CASE 
			WHEN "Row ID" IS NULL 
			 OR	"Order Date" IS NULL
			 OR "Ship Date" IS NULL
			 OR Segment IS NULL
			 OR "Country/Region" IS NULL
			 OR City IS NULL
			 OR "State/Province" IS NULL 
		     OR Region IS NULL		
		     OR "Product ID" IS NULL	
		     OR Category IS NULL		
		     OR "Sub-Category" IS NULL  
		     OR "Product Name" IS NULL	
		     OR "Customer Name" IS NULL
		     OR Sales IS NULL            
		     OR Profit IS NULL       
		  	 OR Quantity IS NULL		
		     OR Discount IS NULL
			THEN 1 ELSE 0
		END AS dados_null
	FROM Sales_Overview_Data
	)
SELECT 
    COUNT(*) AS total_linhas,
    SUM(dados_null) AS linhas_com_null
FROM dados_check;	

--- Checar por duplicadas
SELECT "Row ID",
	COUNT(*)
FROM Sales_Overview_Data
GROUP BY "Row ID"
HAVING COUNT(*) > 1;


--- Criação de colunas derivadas
SELECT
    "order id",
    "customer id",
    CAST("order date" AS DATE)            AS order_date,
    UPPER(TRIM(category))               AS category,
    sales,
    profit,
    ROUND(profit / NULLIF(sales, 0), 4) AS profit_margin,
    CASE
        WHEN discount = 0       THEN 'Sem Desconto'
        WHEN discount <= 0.10   THEN '1 a 10%'
        WHEN discount <= 0.30   THEN '11 a 30%'
        WHEN discount <= 0.50   THEN '31 a 50%'
        ELSE                         'Acima de 50%'
    END AS faixa_desconto
FROM Sales_Overview_Data
WHERE order_date IS NOT NULL
  AND sales > 0;