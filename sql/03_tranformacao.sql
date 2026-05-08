
-- PROJETO: Análise de Vendas
-- ETAPA 3: Transformação dos dados
-- OBJETIVO: Traduzir, padronizar e preparar dados para análise

DROP TABLE IF EXISTS dados_tratados; 

-- PADRONIZAÇÃO DE COLUNAS
CREATE TABLE dados_tratados AS 
SELECT 
    "Row ID"            AS id_linha,
    "Order ID"          AS id_pedido,
    "Order Date"  		AS data_pedido,
    "Ship Date"		   	AS data_entrega,
    "Ship Mode"         AS tipo_entrega,
    "Customer ID"		AS cliente_id,
    "Segment"           AS segmento,
    "Country/Region"    AS pais,
    "City"              AS cidade,
    "State/Province"    AS estado, 
    "Region"            AS regiao,
    "Product ID"        AS id_produto,
    "Category"          AS categoria,
    "Sub-Category"      AS subcategoria,
    "Product Name"      AS nome_produto,
    "Customer Name"     AS nome_cliente,
    Sales               AS vendas,
    Profit              AS lucro,
    Quantity            AS quantidade,
    Discount            AS desconto  
FROM sales_overview_data;

-- Validação
SELECT *
FROM dados_tratados
LIMIT 10;

--- Padronização do conteudo
SELECT DISTINCT segmento FROM dados_tratados;
SELECT DISTINCT categoria FROM dados_tratados;
SELECT DISTINCT subcategoria FROM dados_tratados;
SELECT DISTINCT regiao FROM dados_tratados;
SELECT DISTINCT tipo_entrega FROM dados_tratados;

DROP TABLE IF EXISTS dados_finais;

CREATE TABLE dados_finais AS
SELECT
	id_linha,
	id_pedido,
	data_pedido,
	data_entrega,
	cliente_id,
--- =====================	
--- TRADUÇÃO DE VALORES
--- =====================		

-- Tipo entrega
	CASE 
		WHEN tipo_entrega = "Standard Class" THEN "Entrega Padrão"
		WHEN tipo_entrega = "Second Class" THEN "Segunda Classe"
        WHEN tipo_entrega = "First Class" THEN "Primeira Classe"
        WHEN tipo_entrega = "Same Day" THEN "Mesmo Dia"
        ELSE tipo_entrega
    END AS tipo_entrega,
    
-- Segmento
    CASE 
        WHEN segmento = "Consumer" THEN "Consumidor"
        WHEN segmento = "Corporate" THEN "Corporativo"
        WHEN segmento = "Home Office" THEN "Home Office"
        ELSE segmento
    END AS segmento,
    
 -- Categoria
    CASE 
        WHEN categoria = "Furniture" THEN "Móveis"
        WHEN categoria = "Technology" THEN "Tecnologia"
        WHEN categoria = "Office Supplies" THEN "Materiais de Escritório"
        ELSE categoria
    END AS categoria,
    
-- Subcategoria 
	CASE 
	    WHEN subcategoria = "Accessories" THEN "Acessórios"
	    WHEN subcategoria = "Appliances" THEN "Eletrodomésticos"
	    WHEN subcategoria = "Art" THEN "Arte"
	    WHEN subcategoria = "Binders" THEN "Fichários"
	    WHEN subcategoria = "Bookcases" THEN "Estantes"
	    WHEN subcategoria = "Chairs" THEN "Cadeiras"
	    WHEN subcategoria = "Copiers" THEN "Copiadoras"
	    WHEN subcategoria = "Envelopes" THEN "Envelopes"
	    WHEN subcategoria = "Fasteners" THEN "Fixadores"
	    WHEN subcategoria = "Furnishings" THEN "Decoração"
	    WHEN subcategoria = "Labels" THEN "Etiquetas"
	    WHEN subcategoria = "Machines" THEN "Máquinas"
	    WHEN subcategoria = "Paper" THEN "Papel"
	    WHEN subcategoria = "Phones" THEN "Telefones"
	    WHEN subcategoria = "Storage" THEN "Armazenamento"
	    WHEN subcategoria = "Supplies" THEN "Suprimentos"
	    WHEN subcategoria = "Tables" THEN "Mesas"
	    ELSE subcategoria
	END AS subcategoria,
	
-- Região	
	CASE 
        WHEN regiao = 'South' THEN 'Sul'
        WHEN regiao = 'West' THEN 'Oeste'
        WHEN regiao = 'Central' THEN 'Centro'
        WHEN regiao = 'East' THEN 'Leste'
        ELSE regiao
    END AS regiao,

-- ======================
-- RESTANTE
-- ======================
    pais,
    cidade,
    estado,
    id_produto,
    nome_produto,
    nome_cliente,
    vendas,
    lucro,
    quantidade,
    desconto
FROM dados_tratados;

--- Validação de valores da tabela final
SELECT * FROM dados_finais;

SELECT DISTINCT tipo_entrega FROM dados_finais;
SELECT DISTINCT segmento FROM dados_finais;
SELECT DISTINCT	categoria FROM dados_finais;
SELECT DISTINCT	subcategoria FROM dados_finais;
SELECT DISTINCT	regiao FROM dados_finais;



