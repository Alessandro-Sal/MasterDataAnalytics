-- 1.Esplora la tabelle dei prodotti (DimProduct)
Select * From dimproduct;

-- 2.Interroga la tabella dei prodotti (DimProduct) ed esponi in output i campi ProductKey, ProductAlternateKey,EnglishProductName, Color, StandardCost, FinishedGoodsFlag. 
--   Il result set deve essere parlante per cui assegna un alias se lo ritieni opportuno.
Select 
	ProductKey as PK_Prodotto, 
    ProductAlternateKey,
    EnglishProductName, 
    Color,
    StandardCost,
    FinishedGoodsFlag 
from dimproduct;
    
-- 3.Partendo dalla query scritta nel passaggio precedente, esponi in output i soli prodotti finiti cioè quelli per cui il campo FinishedGoodsFlag è uguale a 1.
Select 
	ProductKey as PK_Prodotto, 
    ProductAlternateKey,
    EnglishProductName, 
    Color,
    StandardCost,
    FinishedGoodsFlag 
from dimproduct
where FinishedGoodsFlag = '1';
    
-- 4.Scrivi una nuova query al fine di esporre in output i prodotti il cui codice modello (ProductAlternateKey) comincia con FR oppure BK. 
-- Il result set deve contenere il codice prodotto (ProductKey), il modello, il nome del prodotto, il costo standard (StandardCost) e il prezzo di listino (ListPrice).
Select 
	ProductKey as PK_Prodotto, 
    ProductAlternateKey as CodiceModello,
    EnglishProductName as ModelloNome, 
    StandardCost,
    ListPrice 
from  dimproduct
where ProductAlternateKey like 'FR%' or ProductAlternateKey like 'BK%';
    
-- 5.Arricchisci il risultato della query scritta nel passaggio precedente del Markup applicato dallʼazienda ListPrice - StandardCost)
Select 
	ProductKey as PK_Prodotto, 
    ProductAlternateKey as CodiceModello,
    EnglishProductName as ModelloNome, 
    StandardCost,
    ListPrice,
    Listprice - StandardCost as Markup
from dimproduct
where ProductAlternateKey like 'FR%' or ProductAlternateKey like 'BK%';

-- 6.Scrivi unʼaltra query al fine di esporre lʼelenco dei prodotti finiti il cui prezzo di listino è compreso tra 1000 e 2000.
Select 
	ProductKey as PK_Prodotto, 
    ProductAlternateKey as CodiceModello,
    EnglishProductName as ModelloNome, 
    StandardCost,
    ListPrice,
    Listprice - StandardCost as Markup
from dimproduct
where FinishedGoodsFlag = '1' and Listprice between '1000' and '2000';
    
-- 7.Esplora la tabella degli impiegati aziendali (DimEmployee)
Select * from dimemployee;

-- 8.Esponi, interrogando la tabella degli impiegati aziendali, lʼelenco dei soli agenti. Gli agenti sono i dipendenti per i quali il campo SalespersonFlag è uguale a 1.
Select * from dimemployee where SalesPersonFlag = '1';

-- 9.Interroga la tabella delle vendite (FactResellerSales). 
-- Esponi in output lʼelenco delle transazioni registrate a partire dal 1 gennaio 2020 dei soli codici prodotto: 597, 598, 477, 214. 
-- Calcola per ciascuna transazione il profitto (SalesAmount - TotalProductCost).
Select 
	SalesOrderNumber,
	SalesAmount - TotalProductCost as Profitto
from factresellersales 
where ProductKey in ('597','598','477','214') and OrderDate >= '2020-01-01';
