/* 1.Implementa una vista denominata Product al fine di creare unʼanagrafica (dimensione) prodotto completa. 
	 La vista, se interrogata o utilizzata come sorgente dati, deve esporre il nome prodotto, il nome della sottocategoria associata e il nome della categoria associata*/    
CREATE VIEW `Product` AS (
SELECT 
	P.ProductKey as PK_Product,
    P.EnglishProductName AS Product,
    s.ProductCategoryKey AS PK_Subcategory,
    S.EnglishProductSubcategoryName AS Subcategory,
    C.ProductCategoryKey as PK_Category,
    C.EnglishProductCategoryName AS Category
FROM dimproduct AS P
LEFT JOIN dimproductsubcategory AS S ON P.ProductSubcategoryKey = S.ProductSubcategoryKey
LEFT JOIN dimproductcategory AS C ON S.ProductCategoryKey = C.ProductCategoryKey
WHERE S.ProductSubcategoryKey IS NOT NULL);

/*2.Implementa una vista denominata Reseller al fine di creare unʼanagrafica (dimensione) reseller completa. 
	La vista, se interrogata o utilizzata come sorgente dati, deve esporre il nome del reseller, il nome della città e il nome della regione.*/
CREATE VIEW `Reseller` AS (
Select
	r.ResellerKey as PK_Reseller,
    r.ResellerName as ResellerName,
    g.GeographyKey as FK_GeographyKey,
    g.city as City,
    g.EnglishCountryRegionName
From dimreseller r 
left join dimgeography g on r.GeographyKey = g.GeographyKey);

/*3.Crea una vista denominata Sales che deve restituire la data dellʼordine, il codice documento, la riga di corpo del documento, la quantità venduta, lʼimporto totale e il profitto.*/
CREATE VIEW `Sales` AS (
    SELECT 
		f.ResellerKey,
		f.ProductKey,
        f.SalesOrderNumber AS OrderNumber,
        f.OrderDate AS OrderDate,
        f.SalesOrderLineNumber AS OrderLineNumber,
        f.OrderQuantity AS OrderQuantity,
        f.SalesAmount AS SalesAmount,
        (COALESCE(f.SalesAmount, 0) - COALESCE(f.TotalProductCost, 0)) AS Profit
    FROM factsales f);
    
/*4.Crea un report in Excel che consenta ad un utente di analizzare quantità venduta, importo totale e profitti per prodotto/categoria prodotto e reseller/regione.*/