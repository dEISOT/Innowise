--CREATING AND INSERTING
CREATE DATABASE BankList
GO

use BankList;

CREATE TABLE Banks
(
BankID INT PRIMARY KEY IDENTITY,
BankName NVARCHAR(15) NOT NULL
)

CREATE TABLE Filials
(
FilialID INT PRIMARY KEY IDENTITY,
Adress NVARCHAR(30) NOT NULL,
Bnk_ID INT,
CONSTRAINT FK_Filial_To_Bank FOREIGN KEY (Bnk_ID) REFERENCES Banks (BankID) ON DELETE CASCADE
)

CREATE TABLE Towns
(
TownID INT PRIMARY KEY IDENTITY,
TownName NVARCHAR(15) NOT NULL
)

CREATE TABLE Buildings
(
Fil_ID INT,
Twn_ID INT,
CONSTRAINT FK_Building_to_Filial FOREIGN KEY (Fil_ID) REFERENCES Filials (FilialID) ON DELETE CASCADE,
CONSTRAINT FK_Building_To_Town FOREIGN KEY (Twn_ID) REFERENCES Towns (TownID) ON DELETE CASCADE
)

CREATE TABLE SocStatus
(
SocStatusID INT PRIMARY KEY IDENTITY,
Name NVARCHAR(15) NOT NULL
)

CREATE TABLE Clients
(
ClientID INT PRIMARY KEY IDENTITY,
Name NVARCHAR(20) NOT NULL,
Surname NVARCHAR(30) NOT NULL,
Patronymic NVARCHAR(30),
Gender NVARCHAR(3) NOT NULL,
SocSt_ID INT,
CONSTRAINT FK_Clients_To_SocStatus FOREIGN KEY(SocSt_ID) REFERENCES SocStatus(SocStatusID)
)

CREATE TABLE Accounts
(
AccountID INT PRIMARY KEY IDENTITY,
Bnk_ID INT,
Cl_ID INT,
Balance MONEY DEFAULT 0.0,
CONSTRAINT FK_Account_To_Bank FOREIGN KEY (Bnk_ID) REFERENCES Banks (BankID) ON DELETE CASCADE,
CONSTRAINT FK_Account_To_Client FOREIGN KEY (Cl_ID) REFERENCES Clients (ClientID) ON DELETE CASCADE,
CONSTRAINT UQ_BankID_ClientID UNIQUE (Bnk_ID, Cl_ID)
)

CREATE TABLE Cards
(
CardID INT PRIMARY KEY IDENTITY,
Balance MONEY DEFAULT 0.0,
Ac_ID INT,
CONSTRAINT FK_Cards_To_Account FOREIGN KEY (Ac_ID) REFERENCES Accounts (AccountID) ON DELETE CASCADE
)



INSERT INTO Towns (TownName)
VALUES  ('Минск'),
	    ('Москва'),
		('Гомель'),
		('Берлин'),
		('Варшава');

INSERT INTO Banks (BankName)
VALUES	('АльфаБанк'),
		('ТинькоффБанк'),
		('БелагропромБанк'),
		('БеларусьБанк'),
		('ПриорБанк'),
		('DeutscheBank'),
		('СберБанк'),
		('ТехноБанк'),
		('IdeaBank'),
		('BankPoscztowy');

INSERT INTO Filials(Adress, Bnk_ID)
VALUES ('бульв.Гоголя,31',1),
	   ('наб.Космонавтов,86',1),
	   ('пл.Балканская,47',1),
	   ('шос.Гоголя,76',2),
	   ('пр.Ленина,39',2),
	   ('ул.Домодедовская,78',2),
	   ('ул.Бухарестская,89',3),
	   ('пр.Сталина,41',3),
	   ('ул.Ладыгина,86',3),
	   ('пр.Гагарина,02',4),
	   ('пер.Ленина,97',4),
	   ('пер.1905 года,53',4),
	   ('ул.Балканская,54',5),
	   ('пр.Чехова,09',5),
	   ('ул.Сталина,50',5),
	   ('Straubplatz,34a',6),
	   ('Marxallee,19',6),
	   ('Blankweg,2',6),
	   ('пр.Славы,77',7),
	   ('пр.Гоголя,68',7),
	   ('ул.Тараса Шевченко,45',7),
	   ('ул.Артема,16',8),
	   ('ул.Курчатова,8',8),
	   ('ул.Заслонова,1г',8),
	   ('Urocza,07',9),
	   ('Bydgoska,39',9),
	   ('Zakopiańska,35',9),
	   ('Jodłowa,45A',10),
	   ('Poprzeczna,97/09',10),
	   ('Strzelecka,66',10);

INSERT INTO Buildings(Fil_ID, Twn_ID)
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
VALUES ('пенсионер'),
	   ('инвалид'),
	   ('безработн'),
	   ('студент'),
	   ('ребенок');

INSERT INTO Clients(Name, Surname, Patronymic, Gender, SocSt_ID)
VALUES ('Софья','Ермаковa','Львовна','жен',1),
	   ('Игорь','Фролов','Владимирович','муж',2),
	   ('Алиса','Фадеевa','Алексеевна','жен',3),
	   ('Диана','Костинa','Александровна','жен',2),
	   ('Татьяна','Васильевa','Максимовна','жен',3),
	   ('Евгения','Капустинa','Андреевна','жен',5),
	   ('Абрам','Кудряшов','Андреевич','муж',4),
	   ('Александра','Исаковa','Александровна','жен',2),
	   ('Илларион','Сысоев','Евгеньевич','муж',1),
	   ('Тимофей','Дорофеев','Фёдорович','муж',3),
	   ('Кирилл','Тарасов','Алексеевич','муж',4),
	   ('Mikołaj','Bąk','','муж',1),
	   ('Jan','Pawłowski','','муж',4),
	   ('Antonina','Górecka','','жен',5),
	   ('Jagoda','Pawłowska','','жен',1),
	   ('Filip','Zakrzewski','','муж',2),
	   ('Karolina','Marciniak','','жен',3),
	   ('Фаина','Стрелкова','Алексеевна','жен',2),
	   ('Betty','Neumann','','жен',2),
	   ('Hanna','Eder','','жен',1),
	   ('Antonia','Klaus','','жен',3),
	   ('Евгения','Аксёновa','','жен',1),
	   ('Виктор','Калашников','Владимирович','муж',1),
	   ('Майя','Щукинa','Владимировна','жен',4),
	   ('Надежда','Вишнякова','Фёдоровна','жен',2),
	   ('Эдуард','Кудряшов','Дмитриевич','муж',3),
	   ('Евгения','Кашняр','Романовна','жен',4),
	   ('Екатерина','Мясникова','Алексеевна','жен',1),
	   ('Тарас','Красильников','Дмитриевич','муж',5),
	   ('Спартак','Белоусов','Дмитриевич','муж',1);


INSERT INTO Accounts(Bnk_ID,Balance, Cl_ID)
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

INSERT INTO Cards(Balance,Ac_ID)
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

SELECT BankName, TownName
FROM Banks
INNER JOIN Filials ON Banks.BankID = Filials.Bnk_ID
INNER JOIN Buildings ON Filials.FilialID = Buildings.Fil_ID
INNER JOIN Towns ON Buildings.Twn_ID = Towns.TownID
GROUP BY BankName, TownName
HAVING TownName = 'Минск'; 

	--Query 2

SELECT BankName, CardID, AccountID, Name, Cards.Balance AS Card_Balance, Accounts.Balance AS Ac_Balance
FROM Banks
INNER JOIN Accounts ON Accounts.Bnk_ID = Banks.BankID 
INNER JOIN Clients ON Accounts.Cl_ID = Clients.ClientID
INNER JOIN Cards ON Cards.Ac_ID = Accounts.AccountID;


	--Query 3

SELECT AccountID, Accounts.Balance, SUM(Cards.Balance) AS Summa, Accounts.Balance - SUM(Cards.Balance) as dif
FROM Accounts INNER JOIN Cards ON Ac_ID= AccountID
GROUP BY AccountID, Accounts.Balance
HAVING SUM(Cards.Balance) != Accounts.Balance

	--Query 4a

SELECT SocStatus.Name, COUNT(*) AS CardsAmount
FROM Clients
INNER JOIN Accounts ON ClientID = Cl_ID
INNER JOIN SocStatus ON SocSt_ID = SocStatusID
INNER JOIN Cards ON AccountID = Ac_ID
GROUP BY SocStatus.Name;

	--Query 4b  -

	--Query 5

CREATE PROCEDURE Calculating
	@status INT
AS
BEGIN
UPDATE Accounts
SET Balance = Balance + 10
FROM Accounts
	INNER JOIN Clients ON Cl_ID = ClientID
WHERE SocSt_ID = @status
END
GO

	--Query 6

SELECT AccountID, Accounts.Balance, SUM(Cards.Balance) AS Summa,
(Accounts.Balance - SUM(Cards.Balance))/COUNT(Cards.Balance) AS AvailableFunds
FROM Accounts INNER JOIN Cards on Ac_ID = AccountID
GROUP BY AccountID, Accounts.Balance
HAVING Accounts.Balance - SUM(Cards.Balance) > 0

	--Query 7

CREATE PROCEDURE MTransfer
@amount MONEY,
@AccID INT,
@CrdID INT,
@Id INT
AS
DECLARE @sumCards MONEY;
SET @sumCards = (SELECT SUM(Cards.Balance)
			FROM Accounts INNER JOIN Cards ON Ac_ID = AccountID
			WHERE AccountID = @AccID);
DECLARE @AccBlnc MONEY;
SET @AccBlnc = (SELECT Accounts.Balance
				FROM Accounts
				WHERE AccountID = @AccID);
DECLARE @diff MONEY;
SET @diff = @AccBlnc - @sumCards;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE 
BEGIN TRANSACTION
IF (@diff >= @amount)
	UPDATE Cards
	SET Balance = Balance + @amount
	WHERE CardID = @CrdID
ELSE
	ROLLBACK TRANSACTION
IF (@@error <> 0)
	ROLLBACK
COMMIT TRANSACTION

	--Query 8
	--ACCOUNTS TRIGGER

CREATE TRIGGER trigger_AccountBalance
	ON Accounts AFTER UPDATE
	AS IF (UPDATE(Balance))
BEGIN
	DECLARE @sumCards MONEY;
	SET @sumCards = (SELECT SUM(Cards.Balance)
			FROM deleted d INNER JOIN Cards ON d.AccountID = Ac_ID
			WHERE AccountID = d.AccountID)
	DECLARE @NewAccBlnc MONEY;
	SET @NewAccBlnc = (SELECT i.Balance
				FROM inserted i
				WHERE AccountID = i.AccountID);
	IF (@NewAccBlnc < @sumCards)
	BEGIN
		ROLLBACK TRANSACTION
	END
END

	--CARDS TRIGGER
CREATE TRIGGER trigger_CardsBalance
	ON Cards AFTER UPDATE
	AS IF (UPDATE(Balance))
BEGIN
	DECLARE @NewSumCards MONEY;
	SET @NewSumCards = (SELECT SUM(i.Balance)
			FROM inserted i INNER JOIN Accounts ON i.Ac_ID = AccountID
			WHERE i.Ac_ID = AccountID);
	DECLARE @AccBlnc MONEY;
	SET @AccBlnc = (SELECT Accounts.Balance 
					FROM inserted i INNER JOIN Accounts ON i.Ac_ID = AccountID
					WHERE i.Ac_ID = AccountID);
	IF (@NewSumCards > @AccBlnc)
	BEGIN
		ROLLBACK TRANSACTION
	END
END

