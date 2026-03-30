-- 1.Scrivi una query per verificare che il campo ProductKey nella tabella DimProduct sia una chiave primaria. Quali considerazioni/ragionamenti è necessario che tu faccia?
 -- Il count non deve darmi risultati utilizzando l'Having > '1'
Select 
	count(Productkey) AS VerificaPK
from 
    DimProduct
Group By Productkey
having COUNT(Productkey) > 1;
 
-- 2.Scrivi una query per verificare che la combinazione dei campi SalesOrderNumber e SalesOrderLineNumber sia una PK.
 -- La combinazione di ordine e linea non si deve ripetere, con il count(*) non abbiamo duplicati
Select 
	count(*),
	SalesOrderNumber,
	SalesOrderLineNumber
from factinternetsales
group by SalesOrderNumber,SalesOrderLineNumber
Having count(*) > 1;

-- 3.Conta il numero transazioni (SalesOrderLineNumber) realizzate ogni giorno a partire dal 1 Gennaio 2020.
Select 
	orderdate,
	count(SalesOrderLineNumber)
from factinternetsales
group by orderdate
Having orderdate >= '2020-01-01';
-- oppure
SELECT 
    orderdate,
    COUNT(SalesOrderLineNumber)
FROM factinternetsales
WHERE orderdate >= '2020-01-01'
GROUP BY orderdate;

-- 4.Calcola il fatturato totale (FactResellerSales.SalesAmount), la quantità totale venduta (FactResellerSales.OrderQuantity) e il prezzo medio di vendita (FactResellerSales.UnitPrice) per prodotto (DimProduct) a partire dal 1 Gennaio 2020. 
-- Il result set deve esporre pertanto il nome del prodotto, il fatturato totale, la quantità totale venduta e il prezzo medio di vendita. I campi in output devono essere parlanti!
Select 
		Concat(p.Productkey,' - ',p.EnglishProductName) AS Product,
        Sum(sel.salesamount) as Fatturatototale,
        avg(sel.unitprice) as PrezzoMedio,
        sum(sel.orderquantity) as Quantitatot
from 
		DimProduct P
Left join FactResellerSales sel on p.ProductKey = sel.ProductKey
WHERE sel.orderdate >= '2020-01-01'
Group by p.productkey, p.englishproductname;

-- 5.Calcola il fatturato totale per area città (DimGeography.City) realizzato a partire dal 1 Gennaio 2020. Il result set deve esporre lʼelenco delle città con fatturato realizzato superiore a 60K.
Select 
		d.City,
		Sum(sel.salesamount) as Fatturatototale
from 
		FactResellerSales sel
inner join DimReseller r ON sel.ResellerKey = r.ResellerKey        
inner join DimGeography d ON r.GeographyKey = d.GeographyKey
where sel.orderdate >= '2020-01-01'
Group by d.City
having sum(sel.salesamount) >= 60000;

