-- 1.Crea una tabella Store per la gestione degli store (ID, nome, data apertura, ecc)
-- 2.Crea una tabella Region per la gestione delle aree geografiche (ID, città, regione, area geografica, …) 
-- 3.Popola le tabelle con pochi record esemplificativi 
-- 4.Esegui operazioni di aggiornamento, modifica ed eliminazione record
Insert into region (Citta, Regione, AreaGeografica,CodiceRegione)
Values
('Lamezia Terme','Calabria','Sud','18'),
('Roma','Lazio','Centro','12'),
('Milano','Lombardia','Nord','03'),
('Torino', 'Piemonte', 'Nord', '01'), 
('Aosta', "Valle d'Aosta", 'Nord', '02'), 
('Genova', 'Liguria', 'Nord', '07'),
('Venezia', 'Veneto', 'Nord', '05'),
('Trento', 'Trentino-Alto Adige', 'Nord', '04'),
('Trieste', 'Friuli-Venezia Giulia', 'Nord', '06'), 
('Bologna', 'Emilia-Romagna', 'Nord', '08'),
('Firenze', 'Toscana', 'Centro', '09'),
('Ancona', 'Marche', 'Centro', '11'),
('Perugia', 'Umbria', 'Centro', '10'),
('Napoli', 'Campania', 'Sud', '15'),
('Bari', 'Puglia', 'Sud', '16'),
('Potenza', 'Basilicata', 'Sud', '17'),
('L''Aquila', 'Abruzzo', 'Sud', '13'),
('Campobasso', 'Molise', 'Sud', '14'),
('Palermo', 'Sicilia', 'Sud', '19'),
('Cagliari', 'Sardegna', 'Sud', '20');

INSERT INTO Store (Name, DataApertura, Regione, DataChiusura, Direttore, NumeroDipendenti, Fatturato)
VALUES
('Milano Duomo', '2018-03-15', '03', NULL, 101, 24, 1250000.50),
('Roma Termini', '2015-06-10', '12', NULL, 102, 45, 2100000.00),
('Lamezia Centro', '2020-09-01', '18', NULL, 103, 12, 650000.00),
('Torino Outlet', '2010-11-20', '01', '2023-12-31', 104, 18, 980000.75),
('Napoli Toledo', '2019-04-05', '12', NULL, 105, 30, 1540000.00);

INSERT INTO direttori (CodiceDirettore, Nome, Cognome, Eta, Nazionalita)
VALUES
(101, 'Mario', 'Rossi', 45, 'Italiana'),
(102, 'Giulia', 'Bianchi', 38, 'Italiana'),
(103, 'Luigi', 'Verdi', 52, 'Italiana'),
(104, 'Elena', 'Neri', 41, 'Italiana'),
(105, 'Antonio', 'Esposito', 47, 'Italiana');

Update Store set Regione = 15 where id = '25';

Start transaction;
Update Region set citta = 'Svezia' where id = '5';
Rollback;
