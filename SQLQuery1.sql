

CREATE TABLE UserDetails
(
ID int IDENTITY(101,1) PRIMARY KEY,
FirstName varchar(20) NOT NULL,
LastName varchar(10) NOT NULL,
DOB Date NOT NULL,
Sex varchar(6) NOT NULL,
Email varchar(30) NOT NULL,
MobileNo varchar(10) NOT NULL,
Password varchar(20) NOT NULL, 
Roles varchar(6) NOT NULL,
)
GO
INSERT INTO UserDetails VALUES( 'Monika', 'Kamaraj', '1998-11-12', 'F', 'monika@gmail.com', '7010502110', 'moni', 'Admin')
INSERT INTO UserDetails VALUES( 'Gowtham', 'Bas', '1998-09-16', 'Male', 'gowtham@gmail.com', '7010026940', 'gowtham', 'Admin')
INSERT INTO UserDetails VALUES( 'Moni', 'K', '1998-03-12', 'Female', 'moni@gmail.com', '7010026941', 'moni', 'User')
Delete FROM UserDetails WHERE ID = 102
SELECT * FROM UserDetails
drop table UserDetails

CREATE TABLE UserDemoHistory
(
   ID INT PRIMARY KEY,
   history varchar(50)
  )
GO

Alter TRIGGER AfterInsertTrigger
ON UserDetails
FOR INSERT
AS
BEGIN
	DECLARE @id int
	SELECT @id = ID FROM inserted
	INSERT INTO UserDemoHistory VALUES (@id,cast(GETDATE() as varchar(50)))
END

SELECT * FROM UserDemoHistory

Alter TRIGGER AfterDeleteTrigger
ON UserDetails
FOR DELETE
AS
BEGIN
	DECLARE @id int
	SELECT @id = ID FROM deleted
	INSERT INTO UserDemoHistory VALUES (@id,cast(GETDATE() as varchar(50)))
END


--CREATE TRIGGER AfterUpdateTrigger
--ON UserDetails
--FOR UPDATE
--AS
--BEGIN
--	--DECLARE @id int
--	--SELECT @id = ID FROM deleted
--	--INSERT INTO UserDemoHistory VALUES (@id,cast(GETDATE() as varchar(50)))
--	Select * from inserted
--	Select * from deleted
--END

--	UPDATE UserDetails SET LastName = 'Valarmathi' WHERE ID = 102
--	UPDATE UserDetails SET LastName = 'V' WHERE ID = 102

----------------------------------------------------------------VIEW---------------------------------------------------------------------

	Select * from UserDemoHistory
	Select * from UserDetails


	CREATE VIEW UserHistory AS
	SELECT FirstName, DOB, Sex, MobileNo FROM UserDetails WHERE Roles = 'Admin'

	SELECT * FROM UserHistory

	Sp_Rename UserHistory , HistoryOfUser
	SELECT * FROM HistoryOfUser

	Sp_Helptext HistoryOfUser

	DROP VIEW UserHistory

	----------------------------------------------------------------------------------------------------------------------------------
