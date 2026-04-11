INSERT INTO category (ID_Category, CategoryName) 
VALUES
(1, 'Bikes'),
(2, 'Clothing'),
(3, 'Action Figures'),
(4, 'Board Games'),
(5, 'Educational'),
(6, 'Video Games');

INSERT INTO region (ID_Region, RegionName) 
VALUES
(1, 'WestEurope'),
(2, 'SouthEurope'),
(3, 'NorthAmerica'),
(4, 'AsiaPacific');

INSERT INTO gender (ID_Gender, GenderDescription) 
VALUES
(1, 'Male'),
(2, 'Female'),
(3, 'Non-Binary'),
(4, 'Prefer not to say');

INSERT INTO orderchannel (ID_Channel, ChannelDescription) 
VALUES
(1, 'Online Store'),
(2, 'Physical Retail'),
(3, 'Direct Catalog'),
(4, 'Mobile App');

INSERT INTO product (ID_Product, ID_Category, ProductName) 
VALUES
(101, 1, 'Mountain Bike Pro'),
(102, 1, 'City Cruiser Bike'),
(103, 2, 'Bike Glove M'),
(104, 2, 'Bike Glove L'),
(105, 3, 'Robot Avenger X'),
(106, 3, 'Space Ranger Buzz'),
(107, 4, 'Monopoly Classic'),
(108, 4, 'Chess Wooden Set'),
(109, 5, 'Science Kit Basic'),
(110, 5, 'Telescope Beginner'),
(111, 6, 'Racing Game 2026'),
(112, 6, 'Adventure RPG');

INSERT INTO state (ID_State, StateName, ID_Region) 
VALUES
(10, 'France', 1),
(11, 'Germany', 1),
(12, 'Italy', 2),
(13, 'Greece', 2),
(14, 'Spain', 2),
(15, 'USA', 3),
(16, 'Canada', 3),
(17, 'Japan', 4),
(18, 'Australia', 4);

INSERT INTO customer (ID_Customer, CustomerName, CustomerSurname, Age, FiscalCode, Email, Address, PostalCode, Nationality, ID_Gender) 
VALUES
(1, 'Mario', 'Rossi', 35, 'RSSMRA80A01H501A', 'mario.rossi@email.it', 'Via Roma 1', '00100', 'IT', 1),
(2, 'Julie', 'Blanc', 28, 'JLBNC95B44Z110Q', 'julie.blanc@email.fr', 'Rue de Paris 15', '75001', 'FR', 2),
(3, 'John', 'Smith', 42, 'SMTJHN80M01Z404X', 'john.smith@email.com', 'Broadway 100', '10001', 'US', 1),
(4, 'Lucia', 'Garcia', 30, 'LGCRA96C12Z120W', 'lucia.garcia@email.es', 'Calle Sol 2', '28001', 'ES', 2),
(5, 'Kenji', 'Sato', 25, 'KJSAT01A11Z200K', 'kenji.sato@email.jp', 'Tokyo St 5', '100-0001', 'JP', 1),
(6, 'Anna', 'Muller', 50, 'ANMLLR76D22Z110P', 'anna.muller@email.de', 'Berlin Weg 10', '10115', 'DE', 2),
(7, 'Alex', 'Taylor', 33, 'AXTYL90E05Z300B', 'alex.taylor@email.ca', 'Maple Ave 44', 'M5V 2H1', 'CA', 3),
(8, 'Elena', 'Conti', 22, 'CNTLNE04F15H501V', 'elena.conti@email.it', 'Piazza Napoli 3', '80100', 'IT', 2);

INSERT INTO sales (ID_Product, ID_State, DateOrder, Quantity, Amount, ID_Customer, ID_OrderChannel) 
VALUES
(101, 12, '2026-01-10 10:30:00', 1, 450.00, 1, 1),
(103, 10, '2026-01-12 15:45:00', 2, 50.00, 2, 1),
(105, 12, '2026-01-15 09:15:00', 1, 60.00, 1, 2),
(102, 15, '2026-01-20 18:20:00', 1, 350.00, 3, 1),
(104, 10, '2026-02-02 11:10:00', 3, 75.00, 2, 3),
(107, 11, '2026-02-05 14:00:00', 1, 30.00, 6, 2),
(108, 14, '2026-02-10 16:30:00', 2, 90.00, 4, 1),
(110, 17, '2026-02-14 10:00:00', 1, 120.00, 5, 4),
(111, 15, '2026-02-20 20:15:00', 1, 60.00, 3, 1),
(106, 12, '2026-03-01 09:45:00', 4, 100.00, 8, 2),
(109, 16, '2026-03-05 11:20:00', 1, 40.00, 7, 4),
(101, 15, '2026-03-10 13:10:00', 1, 450.00, 3, 1),
(112, 11, '2026-03-15 17:00:00', 1, 70.00, 6, 2),
(105, 14, '2026-03-20 12:30:00', 2, 120.00, 4, 4),
(107, 17, '2026-04-02 15:50:00', 1, 30.00, 5, 1),
(103, 16, '2026-04-05 09:30:00', 1, 25.00, 7, 3),
(108, 12, '2026-04-08 14:40:00', 1, 45.00, 8, 2),
(110, 10, '2026-04-10 10:15:00', 1, 120.00, 2, 4),
(102, 11, '2026-04-11 08:00:00', 1, 350.00, 6, 1);