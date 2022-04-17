--CREATING AND INSERTING
CREATE DATABASE BankList
GO

use BankList;

CREATE TABLE Banks
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(15) NOT NULL
)

CREATE TABLE Filials
(
Id INT PRIMARY KEY IDENTITY,
Adress NVARCHAR(30) NOT NULL,
BankId INT,
CONSTRAINT FK_Filial_To_Bank FOREIGN KEY (BankId) REFERENCES Banks (Id) ON DELETE CASCADE
)

CREATE TABLE Towns
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(15) NOT NULL
)

CREATE TABLE Buildings
(
FilialId INT,
TownId INT,
CONSTRAINT FK_Building_to_Filial FOREIGN KEY (FilialId) REFERENCES Filials (Id) ON DELETE CASCADE,
CONSTRAINT FK_Building_To_Town FOREIGN KEY (TownId) REFERENCES Towns (Id) ON DELETE CASCADE
)

CREATE TABLE SocStatus
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(15) NOT NULL
)

CREATE TABLE Clients
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(20) NOT NULL,
Surname NVARCHAR(30) NOT NULL,
Patronymic NVARCHAR(30),
Gender NVARCHAR(3) NOT NULL,
SocStatusId INT,
CONSTRAINT FK_Clients_To_SocStatus FOREIGN KEY(SocStatusId) REFERENCES SocStatus(Id)
)

CREATE TABLE Accounts
(
Id INT PRIMARY KEY IDENTITY,
BankId INT,
ClientId INT,
Balance MONEY DEFAULT 0.0,
CONSTRAINT FK_Account_To_Bank FOREIGN KEY (BankId) REFERENCES Banks (Id) ON DELETE CASCADE,
CONSTRAINT FK_Account_To_Client FOREIGN KEY (ClientId) REFERENCES Clients (Id) ON DELETE CASCADE,
CONSTRAINT UQ_BankID_ClientID UNIQUE (BankId, ClientId)
)

CREATE TABLE Cards
(
Id INT PRIMARY KEY IDENTITY,
Balance MONEY DEFAULT 0.0,
AccountId INT,
CONSTRAINT FK_Cards_To_Account FOREIGN KEY (AccountId) REFERENCES Accounts (Id) ON DELETE CASCADE
)



INSERT INTO Towns (Name)
VALUES  (N'Минск'),
	    (N'Москва'),
		(N'Гомель'),
		(N'Берлин'),
		(N'Варшава');


INSERT INTO Banks (Name)
VALUES	(N'АльфаБанк'),
		(N'ТинькоффБанк'),
		(N'БелагропромБанк'),
		(N'БеларусьБанк'),
		(N'ПриорБанк'),
		(N'DeutscheBank'),
		(N'СберБанк'),
		(N'ТехноБанк'),
		(N'IdeaBank'),
		(N'BankPoscztowy');


INSERT INTO Filials(Adress, BankId)
VALUES (N'бульв.Гоголя,31',1),
	   (N'наб.Космонавтов,86',1),
	   (N'пл.Балканская,47',1),
	   (N'шос.Гоголя,76',2),
	   (N'пр.Ленина,39',2),
	   (N'ул.Домодедовская,78',2),
	   (N'ул.Бухарестская,89',3),
	   (N'пр.Сталина,41',3),
	   (N'ул.Ладыгина,86',3),
	   (N'пр.Гагарина,02',4),
	   (N'пер.Ленина,97',4),
	   (N'пер.1905 года,53',4),
	   (N'ул.Балканская,54',5),
	   (N'пр.Чехова,09',5),
	   (N'ул.Сталина,50',5),
	   (N'Straubplatz,34a',6),
	   (N'Marxallee,19',6),
	   (N'Blankweg,2',6),
	   (N'пр.Славы,77',7),
	   (N'пр.Гоголя,68',7),
	   (N'ул.Тараса Шевченко,45',7),
	   (N'ул.Артема,16',8),
	   (N'ул.Курчатова,8',8),
	   (N'ул.Заслонова,1г',8),
	   (N'Urocza,07',9),
	   (N'Bydgoska,39',9),
	   (N'Zakopiańska,35',9),
	   (N'Jodłowa,45A',10),
	   (N'Poprzeczna,97/09',10),
	   (N'Strzelecka,66',10);


INSERT INTO Buildings(FilialId, TownId)
VALUES (1,1),
	   (2,1),
	   (3,1),
	   (4,1),
	   (5,1),
	   (6,1),
	   (7,1),
	   (8,2),
	   (9,2),
	   (10,2),
	   (11,2),
	   (12,2),
	   (13,2),
	   (14,2),
	   (15,3),
	   (16,4),
	   (17,4),
	   (18,4),
	   (19,3),
	   (20,3),
	   (21,3),
	   (22,3),
	   (23,3),
	   (24,3),
	   (25,5),
	   (26,5),
	   (27,5),
	   (28,5),
	   (29,5),
	   (30,5);

INSERT INTO SocStatus(Name)
VALUES (N'пенсионер'),
	   (N'инвалид'),
	   (N'безработн'),
	   (N'студент'),
	   (N'ребенок');


INSERT INTO Clients(Name, Surname, Patronymic, Gender, SocStatusId)
VALUES (N'Софья','Ермаковa','Львовна','жен',1),
	   (N'Игорь','Фролов','Владимирович','муж',2),
	   (N'Алиса','Фадеевa','Алексеевна','жен',3),
	   (N'Диана','Костинa','Александровна','жен',2),
	   (N'Татьяна','Васильевa','Максимовна','жен',3),
	   (N'Евгения','Капустинa','Андреевна','жен',5),
	   (N'Абрам','Кудряшов','Андреевич','муж',4),
	   (N'Александра','Исаковa','Александровна','жен',2),
	   (N'Илларион','Сысоев','Евгеньевич','муж',1),
	   (N'Тимофей','Дорофеев','Фёдорович','муж',3),
	   (N'Кирилл','Тарасов','Алексеевич','муж',4),
	   (N'Mikołaj','Bąk','','муж',1),
	   (N'Jan','Pawłowski','','муж',4),
	   (N'Antonina','Górecka','','жен',5),
	   (N'Jagoda','Pawłowska','','жен',1),
	   (N'Filip','Zakrzewski','','муж',2),
	   (N'Karolina','Marciniak','','жен',3),
	   (N'Фаина','Стрелкова','Алексеевна','жен',2),
	   (N'Betty','Neumann','','жен',2),
	   (N'Hanna','Eder','','жен',1),
	   (N'Antonia','Klaus','','жен',3),
	   (N'Евгения','Аксёновa','','жен',1),
	   (N'Виктор','Калашников','Владимирович','муж',1),
	   (N'Майя','Щукинa','Владимировна','жен',4),
	   (N'Надежда','Вишнякова','Фёдоровна','жен',2),
	   (N'Эдуард','Кудряшов','Дмитриевич','муж',3),
	   (N'Евгения','Кашняр','Романовна','жен',4),
	   (N'Екатерина','Мясникова','Алексеевна','жен',1),
	   (N'Тарас','Красильников','Дмитриевич','муж',5),
	   (N'Спартак','Белоусов','Дмитриевич','муж',1);



INSERT INTO Accounts(BankId,Balance, ClientId)
VALUES (1,1566,1),
	   (1,0,2),
	   (1,0,3),
	   (2,0,4),
	   (2,78,5),
	   (2,0,6),
	   (3,3,7),
	   (3,29,8),
	   (3,0,9),
	   (4,0,10),
	   (4,19,11),
	   (4,39,18),
	   (5,533,22),
	   (5,309,23),
	   (5,399,24),
	   (6,628,19),
	   (6,570,20),
	   (6,518,21),
	   (7,796,25),
	   (7,96,26),
	   (7,394,27),
	   (8,222,28),
	   (8,638,29),
	   (8,357,30),
	   (9,300,12),
	   (9,1031,13),
	   (9,5000,14),
	   (10,1166,15),
	   (10,200,16),
	   (10,562,17);

INSERT INTO Cards(Balance,AccountId)
VALUES (320,1),
	   (200,1),
	   (200,1),
	   (200,1),
	   (200,1),
	   (0,4),
	   (0,4),
	   (0,4),
	   (0,4),
	   (200,24),
	   (99,24),
	   (531,13),
	   (200,27),
	   (94,27),
	   (138,29),
	   (100,23),
	   (100,23),
	   (100,23),
	   (62,17),
	   (0,10),
	   (0,10),
	   (0,14),
	   (0,14),
	   (0,7),
	   (0,7),
	   (0,7),
	   (1,7),
	   (1,7),
	   (0,3),
	   (40,25),
	   (40,25),
	   (40,25),
	   (40,25),
	   (40,25),
	   (66,15),
	   (100,15),
	   (0,28),
	   (0,9),
	   (0,9),
	   (0,16),
	   (75,20),
	   (122,22),
	   (128,19),
	   (100,19),
	   (100,19),
	   (100,19),
	   (100,19);


	--Query 1

SELECT DISTINCT Banks.Name, Towns.Name
FROM Banks
INNER JOIN Filials ON Banks.Id = Filials.BankId
INNER JOIN Buildings ON Filials.Id = Buildings.FilialId
INNER JOIN Towns ON Buildings.TownId = Towns.Id
WHERE Towns.Name = 'Минск'


	--Query 2

SELECT Banks.Name, Cards.Id AS CardId, Accounts.Id AS AccountId, Clients.Name, Cards.Balance AS Card_Balance, Accounts.Balance AS Account_Balance
FROM Banks
INNER JOIN Accounts ON Accounts.BankId = Banks.Id 
INNER JOIN Clients ON Accounts.ClientId = Clients.Id
INNER JOIN Cards ON Cards.AccountId = Accounts.Id;


	--Query 3

SELECT Accounts.Id, Accounts.Balance, SUM(Cards.Balance) AS Summa, Accounts.Balance - SUM(Cards.Balance) as difference
FROM Accounts INNER JOIN Cards ON AccountId = Accounts.Id
GROUP BY Accounts.Id, Accounts.Balance
HAVING SUM(Cards.Balance) != Accounts.Balance

	--Query 4a

SELECT SocStatus.Name, COUNT(*) AS CardsAmount
FROM Clients
INNER JOIN Accounts ON ClientID = Clients.Id
INNER JOIN SocStatus ON SocStatus.Id = SocStatusID
INNER JOIN Cards ON AccountID = Accounts.Id
GROUP BY SocStatus.Name;

	--Query 4b 

SELECT o.Name, Amount = (SELECT COUNT(*)
					     FROM Cards INNER JOIN Accounts a ON AccountId = a.Id
					     INNER JOIN Clients ON ClientId = Clients.Id
					     INNER JOIN SocStatus i ON i.Id = SocStatusId
						 WHERE o.Id = i.Id)
FROM SocStatus o
ORDER BY o.Name

	--Query 5

GO
CREATE PROCEDURE AccrualForSocStatus
	(@status NVARCHAR(15))
AS
	BEGIN
	UPDATE Accounts
	SET Balance = Balance + 10
	FROM Accounts
		INNER JOIN Clients ON Clients.Id = ClientID
		INNER JOIN SocStatus ON SocStatusId = SocStatus.Id
	WHERE SocStatus.Name = @status
END
GO
	--Test query 5

SELECT a.Balance, s.Name
FROM Accounts a
		INNER JOIN Clients ON Clients.Id = ClientID
		INNER JOIN SocStatus s ON SocStatusId = s.Id
WHERE s.NAME = 'пенсионер'

EXEC AccrualForSocStatus @status = 'пенсионер';

SELECT a.Balance, s.Name
FROM Accounts a
		INNER JOIN Clients ON Clients.Id = ClientID
		INNER JOIN SocStatus s ON SocStatusId = s.Id
WHERE s.NAME = 'пенсионер'

	--Query 6

SELECT AccountID, Accounts.Balance, SUM(Cards.Balance) AS CardsSum, COUNT(Cards.Balance) AS CardsAmount,
(Accounts.Balance - SUM(Cards.Balance)) AS AvailableFunds
FROM Accounts INNER JOIN Cards on Accounts.Id = AccountID
GROUP BY AccountID, Accounts.Balance

	--Query 7
GO
CREATE PROCEDURE Transfer
@amount MONEY,
@CrdID INT
AS
DECLARE @sumCards MONEY;
SET @sumCards = (SELECT SUM(Cards.Balance)
				 FROM Accounts INNER JOIN Cards ON Accounts.Id = AccountID
				 WHERE Accounts.Id = (SELECT AccountId
									  FROM Cards 
									  WHERE Cards.Id = @CrdID));
DECLARE @AccBlnc MONEY;
SET @AccBlnc = (SELECT Accounts.Balance
				FROM Accounts
				WHERE Accounts.Id = (SELECT AccountId
									 FROM Cards 
									 WHERE Cards.Id = @CrdID));
DECLARE @diff MONEY;
SET @diff = @AccBlnc - @sumCards;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE 
BEGIN TRANSACTION
IF (@diff >= @amount)
	UPDATE Cards
	SET Balance = Balance + @amount
	WHERE Cards.Id = @CrdID
ELSE
	ROLLBACK TRANSACTION
IF (@@error <> 0)
	ROLLBACK
COMMIT TRANSACTION
GO

	--Test Query 7
	--Check AvailableFunds for accounts and choose one of the (for example it will be AccountId(16) and CardId(40))

SELECT AccountID, Accounts.Balance, SUM(Cards.Balance) AS CardsSum, COUNT(Cards.Balance) AS CardsAmount,
(Accounts.Balance - SUM(Cards.Balance)) AS AvailableFunds
FROM Accounts INNER JOIN Cards on Accounts.Id = AccountID
GROUP BY AccountID, Accounts.Balance

	--Executing procedure (628 > 128)
EXEC Transfer @amount = 128, @CrdID = 40

	--Check AvailableFunds for id = 16, all works
SELECT AccountID, Accounts.Balance, SUM(Cards.Balance) AS CardsSum, COUNT(Cards.Balance) AS CardsAmount,
(Accounts.Balance - SUM(Cards.Balance)) AS AvailableFunds
FROM Accounts INNER JOIN Cards on Accounts.Id = AccountID
GROUP BY AccountID, Accounts.Balance

	--Attempt to transfer more moneн than AvailableFunds
EXEC Transfer @amount = 600, @CrdID = 40
	--We got error, all works good



	--Query 8
	--ACCOUNTS TRIGGER
GO
CREATE TRIGGER trigger_AccountBalance
	ON Accounts AFTER UPDATE
	AS IF (UPDATE(Balance))
BEGIN
	DECLARE @sumCards MONEY;
	SET @sumCards = (SELECT SUM(Cards.Balance)
			FROM deleted d INNER JOIN Cards ON d.Id = AccountId
			WHERE AccountID = d.Id)
	DECLARE @NewAccBlnc MONEY;
	SET @NewAccBlnc = (SELECT i.Balance
				FROM inserted i
				WHERE Id = i.Id);
	IF (@NewAccBlnc < @sumCards)
	BEGIN
		ROLLBACK TRANSACTION
	END
END
GO

	--Test accounts trigger 

	--Example on accountid = 1
SELECT AccountID, Accounts.Balance, SUM(Cards.Balance) AS CardsSum, COUNT(Cards.Balance) AS CardsAmount,
(Accounts.Balance - SUM(Cards.Balance)) AS AvailableFunds
FROM Accounts INNER JOIN Cards on Accounts.Id = AccountID
GROUP BY AccountID, Accounts.Balance
HAVING AccountId = 1

	--As we can see, he has accountBalance(1566.0) > cardsSum(1120.0)
	--But we can`t update it for less than 1120.0
UPDATE Accounts
SET Balance = 1000
WHERE Id = 1
	--The transaction ended in the trigger. The bitch has been aborted

	--CARDS TRIGGER
DROP Trigger trigger_CardsBalance

GO
CREATE TRIGGER trigger_CardsBalance
	ON Cards AFTER UPDATE
	AS IF (UPDATE(Balance))
BEGIN
	DECLARE @NewSumCards MONEY;
	SET @NewSumCards = (SELECT SUM(i.Balance)
			FROM inserted i INNER JOIN Accounts ON i.AccountId = Accounts.Id
			WHERE Accounts.Id = i.AccountId);
	DECLARE @AccBlnc MONEY;
	SET @AccBlnc = (SELECT Accounts.Balance 
					FROM inserted i INNER JOIN Accounts ON i.AccountId = Accounts.Id
					WHERE Accounts.Id = i.AccountId);
	IF (@NewSumCards > @AccBlnc)
	BEGIN
		ROLLBACK TRANSACTION
	END
END
GO

	--Test 
	--we will take cardid = 1. It belongs to accountId = 1
SELECT Accounts.Id AS AccountId, Accounts.Balance AS Account_Balance, Cards.Id AS CardId, Cards.Balance AS Card_Balance
FROM Banks
INNER JOIN Accounts ON Accounts.BankId = Banks.Id 
INNER JOIN Clients ON Accounts.ClientId = Clients.Id
INNER JOIN Cards ON Cards.AccountId = Accounts.Id
WHERE Accounts.Id = 1

UPDATE Cards
SET Balance = 2020
WHERE Id = 1
	--"The transaction ended in the trigger. The bitch has been aborted"

	--Attempt to update card balance by following the rules
UPDATE Cards
SET Balance = 119
WHERE Id = 1
	--1 row affected