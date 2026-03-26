-- 1.Esponi lʼanagrafica dei prodotti indicando per ciascun prodotto anche la sua sottocategoria (DimProduct, DimProductSubcategory).
Select 
		Concat(p.Productkey,' - ',p.EnglishProductName) AS Product,
        concat(p.ProductSubcategoryKey,' - ',d.EnglishProductSubcategoryName) AS Subcategory
	from 
		DimProduct P
	left join DimProductSubcategory d on p.ProductSubcategoryKey = d.ProductSubcategoryKey
    order by p.Productkey DESC;

-- 2.Esponi lʼanagrafica dei prodotti indicando per ciascun prodotto la sua sottocategoria e la sua categoria DimProduct, DimProductSubcategory, DimProductCategory).
Select 
		Concat(p.Productkey,' - ',p.EnglishProductName) AS Product,
        concat(p.ProductSubcategoryKey,' - ',d.EnglishProductSubcategoryName) AS Subcategory,
        concat(d.ProductCategoryKey,' - ',c.EnglishProductcategoryName) as Category
	from 
		DimProduct P
	left join DimProductSubcategory d on p.ProductSubcategoryKey = d.ProductSubcategoryKey
    left join DimProductCategory c on d.ProductCategoryKey = c.ProductCategoryKey
    order by p.Productkey DESC;

-- 3.Esponi lʼelenco dei soli prodotti venduti (DimProduct, FactResellerSales). 
SELECT DISTINCT
    CONCAT(p.ProductKey, ' - ', p.EnglishProductName) AS Product,
    CONCAT(p.ProductSubcategoryKey, ' - ', d.EnglishProductSubcategoryName) AS Subcategory,
    CONCAT(c.ProductCategoryKey, ' - ', c.EnglishProductCategoryName) AS Category
FROM 
    DimProduct p
INNER JOIN FactResellerSales sel ON p.ProductKey = sel.ProductKey
LEFT JOIN DimProductSubcategory d ON p.ProductSubcategoryKey = d.ProductSubcategoryKey
LEFT JOIN DimProductCategory c ON d.ProductCategoryKey = c.ProductCategoryKey;

-- 4.Esponi lʼelenco dei prodotti non venduti (considera i soli prodotti finiti cioè quelli per i quali il campo FinishedGoodsFlag è uguale a 1).
Select 
		Concat(p.Productkey,' - ',p.EnglishProductName) AS Product,
        concat(p.ProductSubcategoryKey,' - ',d.EnglishProductSubcategoryName) AS Subcategory,
        concat(d.ProductCategoryKey,' - ',c.EnglishProductcategoryName) as Category
	from 
		DimProduct P
	Left join FactResellerSales sel on p.ProductKey = sel.ProductKey
	left join DimProductSubcategory d on p.ProductSubcategoryKey = d.ProductSubcategoryKey
    left join DimProductCategory c on d.ProductCategoryKey = c.ProductCategoryKey
    where p.FinishedGoodsFlag = '1' AND (sel.ProductKey IS NULL or sel.ProductKey = '0' or sel.ProductKey = '')
    order by p.Productkey DESC;   
    
-- 5.Esponi lʼelenco delle transazioni di vendita (FactResellerSales) indicando anche il nome del prodotto venduto (DimProduct)
SELECT 
    CONCAT(p.ProductKey, ' - ', p.EnglishProductName) AS Product,
    CONCAT(p.ProductSubcategoryKey, ' - ', d.EnglishProductSubcategoryName) AS Subcategory,
    CONCAT(c.ProductCategoryKey, ' - ', c.EnglishProductCategoryName) AS Category,
    sel.SalesOrderNumber,
    sel.SalesOrderLineNumber,
    sel.OrderQuantity,
    replace(sel.SalesAmount,".",",") as SalesAmount
FROM 
    DimProduct p
INNER JOIN FactResellerSales sel ON p.ProductKey = sel.ProductKey
LEFT JOIN DimProductSubcategory d ON p.ProductSubcategoryKey = d.ProductSubcategoryKey
LEFT JOIN DimProductCategory c ON d.ProductCategoryKey = c.ProductCategoryKey;

-- 6.Esponi lʼelenco delle transazioni di vendita indicando la categoria di appartenenza di ciascun prodotto venduto.
SELECT 
    CONCAT(p.ProductKey, ' - ', p.EnglishProductName) AS Product,
    CONCAT(p.ProductSubcategoryKey, ' - ', d.EnglishProductSubcategoryName) AS Subcategory,
    CONCAT(c.ProductCategoryKey, ' - ', c.EnglishProductCategoryName) AS Category,
    sel.SalesOrderNumber,
    sel.SalesOrderLineNumber,
    sel.OrderQuantity,
    replace(sel.SalesAmount,".",",") as SalesAmount
FROM 
    DimProduct p
INNER JOIN FactResellerSales sel ON p.ProductKey = sel.ProductKey
LEFT JOIN DimProductSubcategory d ON p.ProductSubcategoryKey = d.ProductSubcategoryKey
LEFT JOIN DimProductCategory c ON d.ProductCategoryKey = c.ProductCategoryKey;

-- 7.Esplora la tabella DimReseller.
SELECT * FROM dimreseller;

-- 8.Esponi in output lʼelenco dei reseller indicando, per ciascun reseller, anche la sua area geografica.
 SELECT 
		res.resellerkey,
		res.resellername,
		City,
		StateProvinceCode,
		StateProvinceName, 
		CountryRegionCode,
        EnglishCountryRegionName
 FROM 
	dimreseller res
Left join dimgeography geo on res.GeographyKey = geo.GeographyKey ;

-- 9.Esponi lʼelenco delle transazioni di vendita. Il result set deve esporre i campi: SalesOrderNumber, SalesOrderLineNumber, OrderDate, UnitPrice, Quantity, TotalProductCost. 
-- Il result set deve anche indicare il nome del prodotto, il nome della categoria del prodotto, il nome del reseller e lʼarea geografica.
SELECT 
    CONCAT(p.ProductKey, ' - ', p.EnglishProductName) AS Product,
    CONCAT(p.ProductSubcategoryKey, ' - ', d.EnglishProductSubcategoryName) AS Subcategory,
    CONCAT(c.ProductCategoryKey, ' - ', c.EnglishProductCategoryName) AS Category,
    sel.SalesOrderNumber,
    sel.SalesOrderLineNumber,
    sel.orderdate,
    sel.UnitPrice,
    sel.OrderQuantity,
    sel.TotalProductCost,
    replace(sel.SalesAmount,".",",") as SalesAmount,
    Concat(dim.resellername,' - ',geo.EnglishCountryRegionName) As ResellerDetailed
FROM 
    DimProduct p
INNER JOIN FactResellerSales sel ON p.ProductKey = sel.ProductKey
left join dimreseller dim on sel.ResellerKey = dim.resellerkey
Left join dimgeography geo on dim.GeographyKey = geo.GeographyKey
LEFT JOIN DimProductSubcategory d ON p.ProductSubcategoryKey = d.ProductSubcategoryKey
LEFT JOIN DimProductCategory c ON d.ProductCategoryKey = c.ProductCategoryKey;
