-- 1)Verificare che i campi definiti come PK siano univoci. In altre parole, scrivi una query per determinare l’univocità dei valori di ciascuna PK (una query per tabella implementata).
 -- category:
Select 
	ID_category,
    Count(*) as NumeroRecord
from category
group by ID_category
having Count(*) > 1;
    
-- customer:
Select 
	ID_Customer,
    fiscalcode,
    Count(*) as NumeroRecord
from customer
group by ID_Customer, fiscalcode
having Count(*) > 1;
    
-- gender:
Select 
	ID_Gender,
    Count(*) as NumeroRecord
from gender
group by ID_Gender
having Count(*) > 1;
    
-- orderchannel:
Select 
	ID_Channel,
    Count(*) as NumeroRecord
from orderchannel
group by ID_Channel
having Count(*) > 1;
    
-- product:
Select 
	ID_Product,
    Count(*) as NumeroRecord
from product
group by ID_Product
having Count(*) > 1;
    
-- region:
Select 
	ID_Region,
    Count(*) as NumeroRecord
from region
group by ID_Region
having Count(*) > 1; 
    
-- state:
Select 
	ID_State,
    Count(*) as NumeroRecord
from state
group by ID_State
having Count(*) > 1;
    
-- sales:
Select 
	ID_Sales,
    Count(*) as NumeroRecord
from sales
group by ID_Sales
having Count(*) > 1;
 
-- 2)Esporre l’elenco delle transazioni indicando nel result set il codice documento, la data, il nome del prodotto, la categoria del prodotto, il nome dello stato, il nome della regione di vendita
-- 	 e un campo booleano valorizzato in base alla condizione che siano passati più di 180 giorni dalla data vendita o meno (>180 -> True, <= 180 -> False) 
-- (Siccome nella tabella sales avevo impostato date al 2026 mi faccio update per modificare qualche data e avere anche il risultato true)
UPDATE sales 
SET DateOrder = '2025-08-15 10:00:00' 
WHERE ID_Sales IN (1, 2);

UPDATE sales 
SET DateOrder = '2025-09-20 14:30:00' 
WHERE ID_Sales = 5;

Select
	s.ID_Sales as 'Codice Documento',
    s.DateOrder as 'Data di vendita',
    p.ProductName as 'Nome Prodotto',
	c.CategoryName as 'Categoria Prodotto',
    st.StateName as 'Stato',
    r.RegionName as 'Regione di vendita',
    IF(DATEDIFF(CURRENT_DATE, s.DateOrder) > 180, 'Si', 'No') AS 'Sono passati più di 180 gg dalla data di vendita?'
from sales s
inner join product p on s.ID_Product = p.ID_Product
inner join category c on p.ID_Category = c.ID_Category
inner join state st on s.ID_State = st.ID_State
inner join region r on st.ID_Region = r.ID_Region;

-- 3)Esporre l’elenco dei prodotti che hanno venduto, in totale, una quantità maggiore della media delle vendite realizzate nell’ultimo anno censito. 
-- 	(ogni valore della condizione deve risultare da una query e non deve essere inserito a mano). Nel result set devono comparire solo il codice prodotto e il totale venduto.
Select
	p.ID_product,
    sum(s.quantity) as 'Totale venduto'
from product p
inner join sales s on p.ID_Product = s.ID_Product
group by ID_product
    HAVING SUM(s.quantity) > (
		SELECT AVG(quantity) 
        FROM sales 
        WHERE YEAR(DateOrder) = (SELECT MAX(YEAR(DateOrder)) FROM sales));

-- 4)	Esporre l’elenco dei soli prodotti venduti e per ognuno di questi il fatturato totale per anno.
Select
	year(s.dateorder) as Anno,
	concat(s.ID_Product,' - ',p.ProductName) as Prodotto,
    sum(s.amount) as 'Totale Fatturato'
from sales s
inner join product p on s.ID_Product = p.ID_Product
group by s.ID_Product, year(s.dateorder), p.ProductName
order by Anno ASC;

-- 5)	Esporre il fatturato totale per stato per anno. Ordina il risultato per data e per fatturato decrescente.
Select
	year(s.dateorder) as Anno,
	concat(s.ID_State,' - ',st.StateName) as State,
    sum(s.amount) as 'Totale Fatturato'
from sales s
inner join state st on s.ID_State = st.ID_State
group by s.ID_State, year(s.dateorder), st.StateName
order by Anno, 'Totale Fatturato' DESC;
    
-- 6)	Rispondere alla seguente domanda: qual è la categoria di articoli maggiormente richiesta dal mercato?
Select
	c.CategoryName as Categoria,
    sum(s.quantity) as 'Totale venduto'
from product p
inner join sales s on p.ID_Product = s.ID_Product
inner join category c on p.ID_Category = c.ID_Category
group by c.CategoryName
order by 'Totale venduto' DESC
limit 1;
    
-- 7)	Rispondere alla seguente domanda: quali sono i prodotti invenduti? Proponi due approcci risolutivi differenti.
-- (inserisco due prodotti che non hanno sales)
INSERT INTO product (ID_Product, ID_Category, ProductName) VALUES
(115, 1, 'Carbon Fiber Road Bike'),
(120, 3, 'Dragon Warrior Limited Edition');
-- Approccio 1:
Select 
    p.ID_Product, 
    p.ProductName
	FROM product p
	LEFT JOIN sales s ON p.ID_Product = s.ID_Product
	WHERE s.ID_Product IS NULL;

-- Approccio 2:
Select 
    ID_Product, 
    ProductName
FROM product
WHERE ID_Product NOT IN (SELECT ID_Product FROM sales);

-- 8)	Creare una vista sui prodotti in modo tale da esporre una “versione denormalizzata” delle informazioni utili (codice prodotto, nome prodotto, nome categoria)
CREATE VIEW Info_Product AS
Select
    concat(p.ID_Product,' - ',p.ProductName) AS Prodotto,
    concat(c.ID_Category,' - ',c.CategoryName) AS Categoria
FROM product p
INNER JOIN category c ON p.ID_Category = c.ID_Category;

-- 9)	Creare una vista per le informazioni geografiche
CREATE VIEW Info_Geography AS
Select 
	concat(st.ID_State,' - ',st.StateName) AS State,
    concat(r.ID_Region,' - ',r.RegionName) AS Region
From state st
inner join region r on st.ID_region = r.ID_Region;




