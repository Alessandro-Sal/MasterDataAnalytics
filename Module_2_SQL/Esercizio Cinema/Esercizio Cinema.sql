-- 1.Il nome di tutte le sale di Pisa
Select Nome
from sale 
where citta = 'Pisa';

-- 2.Il titolo dei film di F. Fellini prodotti dopo il 1960.
Select Titolo
from film
where annoproduzione > 1960 and regista in (select Codregista from registi where Nome = 'Federico Fellini');

-- 3.Il titolo e la durata dei film drammatici americani o italiani prodotti dopo il 1990
Select Titolo
from film
where annoproduzione > 1990 and Nazionalita in ('USA','Italia') and genere = 'drammatico';

-- 4.Il titolo dei film commedia italiani prodotti dopo il 1990 oppure francesi
Select Titolo
from film
where (annoproduzione > 1990 and Nazionalita in ('Italia') and genere = 'Commedia') or Nazionalita = 'Francia' ;

-- 5.I titoli dei film dello stesso regista di “Shutter Island”
Select Titolo
from film
where regista IN (select regista from film where titolo = 'Shutter Island');

-- 6.Il titolo ed il genere dei film proiettati il giorno di Natale 2022
SELECT DISTINCT f.titolo, f.genere
FROM film f
INNER JOIN proiezioni p ON p.idFilm = f.CodFilm
WHERE p.DataProiezione = '2022-12-25';

-- 7.Il titolo ed il genere dei film proiettati a Roma il giorno di Natale 2022
SELECT DISTINCT f.titolo, f.genere
FROM film f
INNER JOIN proiezioni p ON p.idFilm = f.CodFilm
INNER JOIN sale s ON p.codsala = s.codsala
WHERE p.DataProiezione = '2022-12-25' 
  AND s.citta = 'Roma';
  
-- 8.I nomi delle sale di Roma in cui il giorno di Natale 2022 è stato proiettato un film con R.Williams
Select distinct s.Nome
from sale s
inner join proiezioni p on s.CodSala = p.CodSala
inner join recita r on p.idFilm = r.idFilm
inner join attori a on r.CodAttore = a.CodAttore
where DataProiezione = '2022-12-25' and a.Nome like "%Williams%" and s.citta = 'Roma';

-- 9.Il titolo dei film in cui recita M. Mastroianni oppure S.Loren
Select distinct f.Titolo
from film f
inner join recita r on f.CodFilm = r.idFilm
inner join attori a on  r.CodAttore = a.CodAttore
where a.Nome = 'M. Mastroianni' or a.Nome = 'S. Loren';

-- 10.Il titolo dei film in cui recitano M. Mastroianni e S.Loren
SELECT f.Titolo
FROM film f
INNER JOIN recita r ON f.CodFilm = r.idFilm
INNER JOIN attori a ON r.CodAttore = a.CodAttore
WHERE a.Nome IN ('M. Mastroianni', 'S. Loren')
GROUP BY f.Titolo
HAVING COUNT(DISTINCT a.Nome) = 2;

-- 11.Per ogni film in cui recita un attore Americano, il titolo del film e il nome dell’attore
SELECT  f.Titolo, a.nome
FROM film f
INNER JOIN recita r ON f.CodFilm = r.idFilm
INNER JOIN attori a ON r.CodAttore = a.CodAttore
where a.Nazionalita = 'USA';

-- 12.Per ogni film che è stato proiettato a Pisa nel gennaio 2022, il titolo del film e il nome della sala.
SELECT f.Titolo, s.Nome
FROM film f
INNER JOIN proiezioni p ON p.idFilm = f.CodFilm
INNER JOIN sale s ON p.codsala = s.codsala
where s.citta = 'Pisa' and p.dataproiezione between '2022-01-01' and '2022-01-31';

-- 13.Il numero di sale di Pisa con più di 60 posti
Select count(*) AS SaleTotale
from sale
where posti > 60 and citta = 'Pisa';

-- 14.Il numero totale di posti nelle sale di Pisa
Select sum(posti) AS PostiTotali
from sale
where citta = 'Pisa';

-- 15.Per ogni città, il numero di sale
Select citta, count(*) AS SaleTotale
from sale
group by citta;

-- 16.Per ogni città, il numero di sale con più di 60 posti
Select Citta, count(*) AS SaleTotale
from sale
where posti > 60
group by citta;

-- 17.Per ogni regista, il numero di film diretti dopo il 1990
select 	r.nome, count(f.CodFilm) as numerofilm
from film f
inner join registi r on r.codregista = f.Regista
where AnnoProduzione > 1990
group by r.codregista, r.Nome;

-- 18.Per ogni regista, l’incasso totale di tutte le proiezioni dei suoi film
select 	r.nome, sum(p.incasso) as IncassoTotale
from film f
inner join registi r on r.codregista = f.Regista
inner join proiezioni p on f.CodFilm = p.idFilm
group by r.codregista, r.Nome;

-- 19- Per ogni film di Martin Scorsese, il titolo del film, il numero totale di proiezioni a Pisa e l’incasso totale
SELECT f.Titolo,
       SUM(p.incasso) AS IncassoTotale,
       COUNT(p.CodProiezioni) AS numeroproiezioni
FROM film f
INNER JOIN registi r ON r.codregista = f.Regista
INNER JOIN proiezioni p ON f.CodFilm = p.idFilm
INNER JOIN sale s ON p.CodSala = s.CodSala
WHERE r.nome = 'Martin Scorsese' AND s.citta = 'Pisa'
GROUP BY f.codfilm, f.Titolo;

-- 20.Per ogni regista e per ogni attore, il numero di film del regista con l’attore
Select a.CodAttore,r.CodRegista,
	count(distinct f.CodFilm) as NumerofilmRegAtt
FROM film f
INNER JOIN registi r ON r.codregista = f.Regista
inner join recita rec on f.CodFilm = rec.idFilm
inner join attori a on rec.CodAttore = a.CodAttore
group by a.CodAttore,r.CodRegista;

-- 21.Il regista ed il titolo dei film in cui recitano più di 3 attori
Select 
	f.titolo,
    concat(r.codregista,' - ',r.nome) As Regista,
    count(distinct a.codattore) as NumeroAttori
FROM film f
INNER JOIN registi r ON r.codregista = f.Regista
inner join recita rec on f.CodFilm = rec.idFilm
inner join attori a on rec.CodAttore = a.CodAttore
group by f.titolo, r.codregista
Having count(distinct a.codattore) > 3;

-- 22.Per ogni film prodotto dopo il 2000, il codice, il titolo e l’incasso totale di tutte le sue proiezioni
SELECT 
		f.CodFilm,
		f.Titolo,
		SUM(p.incasso) AS IncassoTotale
FROM film f
INNER JOIN proiezioni p ON f.CodFilm = p.idFilm
WHERE f.annoproduzione > 2000
group by f.CodFilm;

-- 23.Il numero di attori dei film in cui appaiono solo attori nati prima del 1970
SELECT COUNT(DISTINCT CodAttore) AS NumeroAttori
FROM recita
WHERE idFilm IN (
    SELECT idFilm
    FROM recita rec
    inner JOIN attori a ON rec.CodAttore = a.CodAttore
    GROUP BY idFilm
    HAVING MAX(a.AnnoNascita) < 1970
);

-- 24.Per ogni film drammatico, il titolo e l’incasso totale di tutte le sue proiezioni
Select f.titolo, 
sum(p.incasso) as TotIncasso
from film f
INNER JOIN proiezioni p ON f.CodFilm = p.idFilm
where f.genere = 'Drammatico'
group by f.titolo, f.CodFilm;

-- 25.Per ogni film drammatico il titolo e l’incasso totale di tutte le sue proiezioni successive al 1/1/2022
Select f.titolo, 
sum(p.incasso) as TotIncasso
from film f
INNER JOIN proiezioni p ON f.CodFilm = p.idFilm
where f.genere = 'Drammatico' and p.DataProiezione > '2022-01-01'
group by f.titolo, f.CodFilm;

-- 26.Per ogni film drammatico che non è mai stato proiettato prima del 1/1/2022 il titolo e l’incasso totale di tutte le sue proiezioni
Select f.titolo, 
sum(p.incasso) as TotIncasso
from film f
INNER JOIN proiezioni p ON f.CodFilm = p.idFilm
where f.genere = 'Drammatico' 
group by f.titolo, f.CodFilm
HAVING MIN(p.DataProiezione) >= '2022-01-01';

-- 27.Per ogni sala di Pisa, che nel mese di aprile 2022 ha incassato più di 2000 €, il nome della sala e l’incasso totale (sempre del mese di aprile 2022)
Select s.nome, 
		sum(p.incasso) as IncassoTot
from sale s
inner join proiezioni p on s.CodSala = p.CodSala
where s.Citta = 'Pisa' and p.DataProiezione between '2022-04-01' and '2022-04-30'
group by s.CodSala, s.nome
Having sum(p.incasso) > 2000;

-- 28.I titoli dei film che non sono mai stati proiettati a Pisa
SELECT f.titolo
FROM film f
WHERE f.CodFilm NOT IN (
    SELECT p.idFilm
    FROM proiezioni p
    INNER JOIN sale s ON p.CodSala = s.CodSala
    WHERE s.Citta = 'Pisa'
);

-- 29.I titoli dei film che sono stati proiettati solo a Roma
SELECT f.titolo
FROM film f
WHERE f.CodFilm IN (
    SELECT p.idFilm
    FROM proiezioni p
    INNER JOIN sale s ON p.CodSala = s.CodSala
    WHERE s.Citta = 'Roma')
AND f.CodFilm NOT IN (
    SELECT p.idFilm
    FROM proiezioni p
    INNER JOIN sale s ON p.CodSala = s.CodSala
    WHERE s.Citta != 'Roma');

-- 30.I titoli dei film dei quali non vi è mai stata una proiezione con incasso superiore a 500 €
SELECT f.titolo
FROM film f
WHERE f.CodFilm NOT IN (
    SELECT p.idfilm
    FROM proiezioni p
    WHERE p.Incasso > 500);

-- 31.I titoli dei film le cui proiezioni hanno sempre ottenuto un incasso superiore a 500 €
SELECT f.titolo
FROM film f
INNER JOIN proiezioni p ON f.CodFilm = p.idFilm
GROUP BY f.CodFilm, f.titolo
HAVING MIN(p.Incasso) > 500;

-- 32.Il nome degli attori italiani che non hanno mai recitato in film di Vittorio De Sica
Select distinct a.nome
from attori a
inner join recita rec on a.CodAttore = rec.CodAttore
where a.Nazionalita = 'Italia' and rec.IdFilm not in (
select f.codfilm 
from film f 
inner join registi r on r.codregista = f.Regista
where r.nome = 'Vittorio De Sica');

-- 33.Il titolo dei film di Fellini in cui non recitano attori italiani
SELECT f.titolo
FROM film f
INNER JOIN registi r ON f.Regista = r.codRegista
WHERE r.nome = 'Federico Fellini' 
  AND f.CodFilm NOT IN (
      SELECT rec.IdFilm
      FROM recita rec
      INNER JOIN attori a ON rec.CodAttore = a.CodAttore
      WHERE a.Nazionalita = 'Italia');
      
-- 34.Il titolo dei film senza attori
SELECT f.Titolo
FROM film f
LEFT JOIN recita r ON f.CodFilm = r.idFilm
WHERE r.CodAttore IS NULL;

-- 35.Gli attori che prima del 1980 hanno recitato solo nei film di Fellini
SELECT DISTINCT a.nome
FROM attori a
INNER JOIN recita rec ON a.CodAttore = rec.CodAttore
INNER JOIN film f ON rec.IdFilm = f.CodFilm 
INNER JOIN registi r ON f.regista = r.CodRegista
WHERE r.nome = 'Federico Fellini' AND f.annoproduzione < 1980
  AND a.CodAttore NOT IN (
      SELECT rec2.CodAttore
      FROM recita rec2
      INNER JOIN film f2 ON rec2.IdFilm = f2.CodFilm
      INNER JOIN registi r2 ON f2.regista = r2.CodRegista
      WHERE r2.nome != 'Federico Fellini' AND f2.annoproduzione < 1980);
      
-- 36.Gli attori che hanno recitato in film di Fellini solo prima del 1980
SELECT a.nome
FROM attori a
INNER JOIN recita rec ON a.CodAttore = rec.CodAttore
INNER JOIN film f ON rec.IdFilm = f.CodFilm
INNER JOIN registi r ON f.regista = r.CodRegista
WHERE r.nome = 'Federico Fellini'
GROUP BY a.CodAttore, a.nome
HAVING MAX(f.annoproduzione) < 1980;