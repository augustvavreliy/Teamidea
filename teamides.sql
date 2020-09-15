--Создание Таблиц и заполнение их данными

CREATE TABLE Brand (
    BrandId int NOT NULL,
    BrandName varchar(255),
    BrandCountry varchar(255),
    PRIMARY KEY (BrandId)
);

CREATE TABLE Auto (
    AutoId int NOT NULL,
    AutoModel varchar(255),
    BrandId int,
    Price decimal(5,2),
    PRIMARY KEY (AutoId),
    FOREIGN KEY (BrandId) REFERENCES Brand(BrandId)
);

INSERT INTO Brand (BrandId, BrandName, BrandCountry) VALUES (1, 'Mercedec', 'Germany');
INSERT INTO Brand (BrandId, BrandName, BrandCountry) VALUES (2, 'Audi', 'Japan');
INSERT INTO Brand (BrandId, BrandName, BrandCountry) VALUES (3, 'BMW', 'Germany');
INSERT INTO Brand (BrandId, BrandName, BrandCountry) VALUES (4, 'Bentley', 'England');
INSERT INTO Brand (BrandId, BrandName, BrandCountry) VALUES (5, 'Lexus', 'Japan');

INSERT INTO Auto (AutoId, AutoModel, BrandId, Price) VALUES (1, 'I (W245)', 1, 300.5);
INSERT INTO Auto (AutoId, AutoModel, BrandId, Price) VALUES (2, 'I (W176)', 1, 400.5);
INSERT INTO Auto (AutoId, AutoModel, BrandId, Price) VALUES (3, 'Q5', 2, 380.5);
INSERT INTO Auto (AutoId, AutoModel, BrandId, Price) VALUES (4, 'Q9', 2, 540.5);
INSERT INTO Auto (AutoId, AutoModel, BrandId, Price) VALUES (5, 'V5', 3, 233.5);
INSERT INTO Auto (AutoId, AutoModel, BrandId, Price) VALUES (6, 'v8', 3, 520.5);
INSERT INTO Auto (AutoId, AutoModel, BrandId, Price) VALUES (7, 'A5', 4, 233.5);
INSERT INTO Auto (AutoId, AutoModel, BrandId, Price) VALUES (8, 'A8', 4, 520.5);
INSERT INTO Auto (AutoId, AutoModel, BrandId, Price) VALUES (9, 'L5', 5, 243.5);
INSERT INTO Auto (AutoId, AutoModel, BrandId, Price) VALUES (10, 'L8', 5, 1110.5);
INSERT INTO Auto (AutoId, AutoModel, BrandId, Price) VALUES (11, 'Q5', 2, 380.5);
INSERT INTO Auto (AutoId, AutoModel, BrandId, Price) VALUES (12, 'V5', 3, 243.5);

--Задача 1
SELECT BrandName, Automodel, COUNT(*) Automodel, SUM(Price)
FROM Auto AS a 
INNER JOIN Brand as b ON a.BrandID = b.BrandID
GROUP BY AutoModel

--Задача 2.a
SELECT BrandName, AVG(Price)
FROM Brand as b 
INNER JOIN Auto as a ON a.BrandId = b.BrandId 
GROUP BY BrandName ORDer By AVG(Price) DESC

--Задача 2.b 
SELECT BrandCountry, COUNT(AutoId)
FROM Brand as b 
INNER JOIN Auto as a ON a.BrandID = b.BrandID 
WHERE b.BrandCountry = 'Germany'
Order BY COUNT(AutoId)

--Задача 2.c 
SELECT BrandName, AutoModel, MAX(Price)
FrOM Brand as b 
Inner Join Auto as a ON b.BrandId = a.brandid
Group BY AutoModel