CREATE DATABASE School_Management_System

GO

USE School_Management_System

GO
--_ - - - - - - - - - - - - - - - - - - - - - - - - - - - -_  
--_---------------------- TABLE AREA ----------------------_
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - -

--

create TABLE Users
(
User_id INT PRIMARY KEY,
User_FirstName nvarchar(50),
User_LastName NVARCHAR(50),
User_Fathername NVARCHAR(50), 
Username NVARCHAR(50),
Passwords NVARCHAR(50),
Email NVARCHAR(50),
Gender NVARCHAR(50),
DateOfBirth DATE,
DateOfJoin DATE,
UserTypes NVARCHAR(50),
[Status] NVARCHAR(50),
Contact NVARCHAR(50),
Addresss NVARCHAR(250)
)
GO
INSERT INTO Users VALUES
(1,'Muhammad','Shahzaib','Muhammad Sharif','admin','admin','m.shahzaib.123456@gmail.com','Male','1998-05-15' ,'2018-07-23','Admin','Active','03402087662','R-429 Data Nagar')

GO
CREATE TABLE Gender
(
GenderID INT PRIMARY KEY,
GenderType NVARCHAR(50)
)
GO

-- Students Table
CREATE Table Students
(
Std_ID INT PRIMARY KEY,
Std_FirstName NVARCHAR(50),
Std_LastName NVARCHAR(50),
Std_Fathername NVARCHAR(50),
Std_Gender NVARCHAR(50),
Std_Age INT,
Std_DateOfBirth DATETIME,
Std_AdmmissionDate DATETIME,
Std_Contact NVARCHAR(50),
Std_FatherContact NVARCHAR(50),
Std_Email NVARCHAR(50),
Std_Address NVARCHAR(50),
Std_Class Nvarchar(50),
Std_Status NVARCHAR(50),
Std_Section NVARCHAR(50),
)

go

CREATE TABLE StdCollectFee
(
FeeID INT PRIMARY KEY,
FKStudentID INT FOREIGN KEY REFERENCES Students(Std_ID),
FeeDate DATE,
Fees NVARCHAR(50),
FeeMonth INT FOREIGN KEY REFERENCES  FeesMonth(FeeMonthID)
)

GO
CREATE TABLE FeesMonth
(
FeeMonthID INT PRIMARY KEY,
FeeMonths NVARCHAR(50)
)

GO
INSERT INTO FeesMonth VALUES(1,'January')
INSERT INTO FeesMonth VALUES(2,'February')
INSERT INTO FeesMonth VALUES(3,'March')
INSERT INTO FeesMonth VALUES(4,'April')
INSERT INTO FeesMonth VALUES(5,'May')
INSERT INTO FeesMonth VALUES(6,'June')
INSERT INTO FeesMonth VALUES(7,'July')
INSERT INTO FeesMonth VALUES(8,'August')
INSERT INTO FeesMonth VALUES(9,'September')
INSERT INTO FeesMonth VALUES(10,'October')
INSERT INTO FeesMonth VALUES(11,'November')
INSERT INTO FeesMonth VALUES(12,'December')

go

CREATE TABLE StudentStatus
(
StdStatusID INT PRIMARY KEY,
StdStatus NVARCHAR(50)
)

GO
CREATE PROC sp_SelectStudentStatus
AS
BEGIN
SELECT StdStatus FROM StudentStatus
END
GO

INSERT INTO StudentStatus VALUES(1,'Active') 
INSERT INTO StudentStatus VALUES(2,'Passout') 
INSERT INTO StudentStatus VALUES(3,'Left') 
GO
SELECT StdStatus FROM StudentStatus

CREATE table StudentAttendance
(
AttendId int primary key,
StudentId int foreign key references Students(Std_ID),
AttendDate date,
AttendStatus varchar(20)
)

go
CREATE TABLE Classes
(
Class_ID INT PRIMARY KEY,
Class_Name NVARCHAR(50)
)
go

CREATE TABLE Subjects
(
Sub_ID INT PRIMARY KEY,
Sub_NAME NVARCHAR(50),
)
go
CREATE TABLE Section
(
SectionID INT PRIMARY KEY,
SectionName Nvarchar(50)
)
go


CREATE TABLE Teachers
(
TeacherID INT PRIMARY KEY,
Teacher_FirstName NVARCHAR(50),
Teacher_Lastname NVARCHAR(50),
Teacher_FatherName NVARCHAR(50),
Teacher_Username NVARCHAR(50),
Teacher_Password NVARCHAR(50),
Teacher_Gender NVARCHAR(50),
Teacher_DOfJoin DATE,
Teacher_DOfBirth DATE,
Teacher_Status NVARCHAR(50),
Teacher_Email NVARCHAR(50),
Teacher_Contact NVARCHAR(50), 
Teacher_Address NVARCHAR(50), 
Teacher_Education NVARCHAR(50), 
Teacher_Salery NVARCHAR(50),
Teacher_Class NVARCHAR(50) 
)
go
create proc TeacherLogin
@username nvarchar(50),
@password nvarchar(50)
as
begin
SELECT * FROM Teachers WHERE Teacher_Username=@username and Teacher_Password=@password
end

GO

CREATE TABLE Empoloyees
(
Emp_ID INT PRIMARY KEY,
Emp_FirstName NVARCHAR(50),
Emp_LastName NVARCHAR(50),
Emp_FatherName NVARCHAR(50),
Emp_Age INT,
Emp_Gender NVARCHAR(50),
Emp_BirthDate DATE,
Emp_JoinDate Date,
Emp_City NVARCHAR(50),
Emp_Contact NVARCHAR(50),
Emp_Address NVARCHAR(50),
Emp_Salery nvarchar(50),
Emp_Type VARCHAR(50),
Emp_Status nvarchar(50)
)
GO

create TABLE Expense
(
ExpenseID INT PRIMARY KEY,
ExpenseAmount NVARCHAR(50),
ExpenseDate DATE,
ExpensePayMode NVARCHAR(50),
ExpenseRemarks NVARCHAR(50),
FKExpType INT FOREIGN KEY REFERENCES ExpenceType(ExpTypeID)
)
GO
CREATE TABLE ExpenceType
(
ExpTypeID INT PRIMARY KEY,
ExpType NVARCHAR(50),
)
GO



go
create table UserStatus
( 
UserStatus_ID int primary key,
UserStatus_Name nvarchar(50),
UserStatus_Description nvarchar(50)
)

go
create table UserType
(
UserType_ID int primary key,
UserType_Name nvarchar(50),
UserType_Description nvarchar(50)
)


-- STORE PROCEDURE AREA ---
go
--//  User View Procedure
create PROC SP_USER_LOGIN
@user NVARCHAR(50),
@pass NVARCHAR(50)
AS
BEGIN
SELECT * FROM Users WHERE  Username=@user AND Passwords=@pass 
END

GO

--[USER] Select, Delete, Update Store Procedure 
alter proc usp_User
@Action nvarchar(50),
@User_id INT=null,
@User_FirstName nvarchar(50)=null,
@User_LastName NVARCHAR(50)=null,
@User_Fathername NVARCHAR(50)=null, 
@Username NVARCHAR(50)=null,
@Passwords NVARCHAR(50)=null,
@Email NVARCHAR(50)=null,
@Gender NVARCHAR(50)=null,
@DateOfBirth DATE=null,
@DateOfJoin DATE=null,
@UserTypes NVARCHAR(50)=null,
@Status NVARCHAR(50)=null,
@Contact NVARCHAR(50)=null,
@Addresss NVARCHAR(50)=null
as
begin

            if @Action='SelectAll'
			begin
			select * from Users
			end

			IF @Action='TypeTeacher'
			BEGIN

			SELECT 
			User_id AS 'ID',
			User_FirstName AS 'FIRST NAME',
			User_LastName AS 'LAST NAME',
			User_Fathername AS 'FATHER NAME',
			Username AS 'USERNAME',
			Passwords AS 'PASSWORD',
			Email AS 'EMAIL',
			Gender AS 'GENDER',
			DateOfBirth AS 'DATE OF BIRTH',
			DateOfJoin AS 'DATE OF JOIN',
			--UserTypes AS 'TYPE'
			Status AS 'STATUS',
			Contact AS 'CONTACT',
			Addresss AS 'ADDRESS'

			 FROM Users WHERE UserTypes='Teacher'

			END

			IF @Action='UserActive'
			BEGIN

			SELECT 
			User_id AS 'ID',
			User_FirstName AS 'FIRST NAME',
			User_LastName AS 'LAST NAME',
			User_Fathername AS 'FATHER NAME',
			Username AS 'USERNAME',
			Passwords AS 'PASSWORD',
			Email AS 'EMAIL',
			Gender AS 'GENDER',
			DateOfBirth AS 'DATE OF BIRTH',
			DateOfJoin AS 'DATE OF JOIN',
			--UserTypes AS 'TYPE'
			Status AS 'STATUS',
			Contact AS 'CONTACT',
			Addresss AS 'ADDRESS'
			 FROM Users WHERE Status='Active'
			END

			IF @Action='UserOffline'
			BEGIN

			SELECT 
			User_id AS 'ID',
			User_FirstName AS 'FIRST NAME',
			User_LastName AS 'LAST NAME',
			User_Fathername AS 'FATHER NAME',
			Username AS 'USERNAME',
			Passwords AS 'PASSWORD',
			Email AS 'EMAIL',
			Gender AS 'GENDER',
			DateOfBirth AS 'DATE OF BIRTH',
			DateOfJoin AS 'DATE OF JOIN',
			--UserTypes AS 'TYPE'
			Status AS 'STATUS',
			Contact AS 'CONTACT',
			Addresss AS 'ADDRESS'

			 FROM Users WHERE Status='Offline'

			END

			IF @Action='UserBusy'
			BEGIN

			SELECT 
			User_id AS 'ID',
			User_FirstName AS 'FIRST NAME',
			User_LastName AS 'LAST NAME',
			User_Fathername AS 'FATHER NAME',
			Username AS 'USERNAME',
			Passwords AS 'PASSWORD',
			Email AS 'EMAIL',
			Gender AS 'GENDER',
			DateOfBirth AS 'DATE OF BIRTH',
			DateOfJoin AS 'DATE OF JOIN',
			--UserTypes AS 'TYPE'
			Status AS 'STATUS',
			Contact AS 'CONTACT',
			Addresss AS 'ADDRESS'

			 FROM Users WHERE Status='Busy'

			END

			IF @Action='UserLeft'
			BEGIN

			SELECT 
			User_id AS 'ID',
			User_FirstName AS 'FIRST NAME',
			User_LastName AS 'LAST NAME',
			User_Fathername AS 'FATHER NAME',
			Username AS 'USERNAME',
			Passwords AS 'PASSWORD',
			Email AS 'EMAIL',
			Gender AS 'GENDER',
			DateOfBirth AS 'DATE OF BIRTH',
			DateOfJoin AS 'DATE OF JOIN',
			--UserTypes AS 'TYPE'
			Status AS 'STATUS',
			Contact AS 'CONTACT',
			Addresss AS 'ADDRESS'

			 FROM Users WHERE Status='Left'

			END

			IF @Action='TotalUserBar'
			BEGIN
			SELECT COUNT  (User_id) FROM Users
			END
			
			if @Action='Insert'
			begin
			INSERT INTO Users VALUES
 (@User_id,@User_FirstName,@User_LastName,@User_Fathername,@Username,@Passwords,@Email,@Gender,@DateOfBirth,@DateOfJoin,@UserTypes,@Status,@Contact,@Addresss)
			end

			if @Action='Update'
			begin
			update Users set

User_FirstName= @User_FirstName,
User_LastName= @User_LastName,
User_Fathername= @User_Fathername,
Username= @Username,
Passwords= @Passwords,
Email= @Email,
Gender= @Gender,
DateOfBirth= @DateOfBirth,
DateOfJoin= @DateOfJoin,
UserTypes= @UserTypes,
[Status]= @Status,
Contact= @Contact,
Addresss= @Addresss
where User_id= @User_id
end
end

GO

--[STUDENTS] INSERT,UPDATE,DELETE,SELECT STORE PROCEDURE
alter PROC usp_Student
@Action NVARCHAR(50),
@Std_ID INT=NULL,
@Std_FirstName NVARCHAR(50)=NULL,
@Std_LastName NVARCHAR(50)=NULL,
@Std_Fathername NVARCHAR(50)=NULL,
@Std_Gender NVARCHAR(50)=NULL,
@Std_Age INT=NULL,
@Std_DateOfBirth DATETIME=NULL,
@Std_AdmmissionDate DATETIME=NULL,
@Std_Contact NVARCHAR(50)=NULL,
@Std_FatherContact NVARCHAR(50)=NULL,
@Std_Email NVARCHAR(50)=NULL,
@Std_Address NVARCHAR(50)=NULL,

@Std_Class NVARCHAR(50)=NULL,
@Std_Status NVARCHAR(50)=NULL,
@Std_Section NVARCHAR(50)=NULL
AS
BEGIN
    
	if @Action='StudentNames'
			begin
			select Std_FirstName+' '+Std_LastName from Students
			end

     
  IF @Action='Insert'
  BEGIN
  INSERT INTO Students VALUES

  (@Std_ID,@Std_FirstName,@Std_LastName,@Std_Fathername,@Std_Gender,@Std_Age,@Std_DateOfBirth,@Std_AdmmissionDate,@Std_Contact,@Std_FatherContact,@Std_Email,@Std_Address,@Std_Class,@Std_Status,@Std_Section)   
   END

   IF @Action='Update'
   BEGIN
   UPDATE Students SET
   
   Std_FirstName=@Std_FirstName ,
   Std_LastName=@Std_LastName ,
   Std_Fathername=@Std_Fathername , 
   Std_Gender=@Std_Gender ,
   Std_Age=@Std_Age ,
   Std_DateOfBirth=@Std_DateOfBirth,
   Std_AdmmissionDate =@Std_AdmmissionDate,
   Std_Contact =@Std_Contact,
   Std_FatherContact =@Std_FatherContact,
   Std_Email = @Std_Email,
   Std_Address=@Std_Address,
   Std_Class=@Std_Class,
   Std_Status = @Std_Status,
   Std_Section = @Std_Section
  

   WHERE Std_ID=@Std_ID
   END

   IF @Action='Delete'
   BEGIN
   DELETE FROM Students WHERE Std_ID=@Std_ID
   END

   --SEARCHING STUDENT
   IF @Action='SearchStudentFName'
   BEGIN
   SELECT * FROM Students WHERE Std_FirstName=@Std_FirstName

   END




   IF @Action='SelectActive'
   BEGIN
   SELECT 
   
   Std_ID as 'STUDENT ID',
   Std_FirstName as 'FIRST NAME',
   Std_LastName as 'LAST NAME',
   Std_Fathername as 'FATHER NAME',
   Std_Gender as 'GENDER',
   Std_Age as 'AGE',
   Std_DateOfBirth as 'DATE OF BIRTH',
   Std_AdmmissionDate as 'ADDMISSION DATE',
   Std_Contact as 'CONTACT',
   Std_FatherContact as 'FATHER CONTACT', 
   Std_Email as 'EMAIL',
   Std_Address as 'ADDRESS',
   Std_Class as 'CLASS',
   Std_Status as 'STATUS',
   Std_Section as 'SECTION'
   
    FROM Students WHERE Std_Status='Active'
   END

   IF @Action='SelectPassout'
   BEGIN
   SELECT 
   
   Std_ID as 'STUDENT ID',
   Std_FirstName as 'FIRST NAME',
   Std_LastName as 'LAST NAME',
   Std_Fathername as 'FATHER NAME',
   Std_Gender as 'GENDER',
   Std_Age as 'AGE',
   Std_DateOfBirth as 'DATE OF BIRTH',
   Std_AdmmissionDate as 'ADDMISSION DATE',
   Std_Contact as 'CONTACT',
   Std_FatherContact as 'FATHER CONTACT', 
   Std_Email as 'EMAIL',
   Std_Address as 'ADDRESS',
   Std_Class as 'CLASS',
   Std_Status as 'STATUS',
   Std_Section as 'SECTION'
   
    FROM Students WHERE Std_Status='Passout'
   END

   IF @Action='SelectLeft'
   BEGIN
   SELECT 

   Std_ID as 'STUDENT ID',
   Std_FirstName as 'FIRST NAME',
   Std_LastName as 'LAST NAME',
   Std_Fathername as 'FATHER NAME',
   Std_Gender as 'GENDER',
   Std_Age as 'AGE',
   Std_DateOfBirth as 'DATE OF BIRTH',
   Std_AdmmissionDate as 'ADDMISSION DATE',
   Std_Contact as 'CONTACT',
   Std_FatherContact as 'FATHER CONTACT', 
   Std_Email as 'EMAIL',
   Std_Address as 'ADDRESS',
   Std_Class as 'CLASS',
   Std_Status as 'STATUS',
   Std_Section as 'SECTION'
   
    FROM Students WHERE Std_Status='Left'
   END

   IF @Action='SelectAll'
   BEGIN
   SELECT 
   Std_ID as 'STUDENT ID',
   Std_FirstName as 'FIRST NAME',
   Std_LastName as 'LAST NAME',
   Std_Fathername as 'FATHER NAME',
   Std_Gender as 'GENDER',
   Std_Age as 'AGE',
   Std_DateOfBirth as 'DATE OF BIRTH',
   Std_AdmmissionDate as 'ADDMISSION DATE',
   Std_Contact as 'CONTACT',
   Std_FatherContact as 'FATHER CONTACT', 
   Std_Email as 'EMAIL',
   Std_Address as 'ADDRESS',
   Std_Class as 'CLASS',
   Std_Status as 'STATUS',
   Std_Section as 'SECTION'
   FROM Students
   END

END
go
create proc SelectStudentNames
as
begin
select Std_FirstName+' '+Std_LastName from Students
end
GO

create PROC StudentAutoID
AS
BEGIN

SELECT ISNULL(MAX(Std_ID),0)+1 FROM Students
END
go
--[CLASS] INSERT,UPDATE,DELETE,SELECT STORE PROCEDURE
create PROC usp_Class
@Action NVARCHAR(50),
@ClassID INT=NULL,
@ClassName NVARCHAR(50)=NULL
AS
BEGIN
   
   IF @Action='Insert'
   BEGIN
   INSERT INTO Classes VALUES(@ClassID,@ClassName)
   END

   IF @Action='Update'
   BEGIN
   UPDATE Classes SET Class_Name=@ClassName WHERE Class_ID=@ClassID
   END

   IF @Action='SelectAll'
   BEGIN
   SELECT Class_ID as 'CLASS ID' ,Class_Name as 'CLASS NAME' FROM Classes
   END
   --SELECT ONLY CLASS NAME 
   IF @Action='SelectClassNames'
   BEGIN
   SELECT Class_Name FROM Classes
   END

   IF @Action='Delete'
   BEGIN
   DELETE FROM Classes WHERE Class_ID=@ClassID
   END
END

Go
create PROC AutoClassID 
AS
BEGIN
SELECT ISNULL(MAX(Class_ID),0)+1 FROM Classes
END

GO
--[TEACHERS] INSERT,UPDATE,DELETE,SELECT STORE PROCEDURE
create PROC usp_Teachers
@Action NVARCHAR(50),
@TeacherID INT=NULL,
@Teacher_FirstName NVARCHAR(50)=NULL,
@Teacher_Lastname NVARCHAR(50)=NULL,
@Teacher_FatherName NVARCHAR(50)=NULL,
@Teacher_Username NVARCHAR(50)=NULL,
@Teacher_Password NVARCHAR(50)=NULL,
@Teacher_Gender NVARCHAR(50)=NULL,
@Teacher_DOfJoin DATE=NULL,
@Teacher_DOfBirth DATE=NULL,                              
@Teacher_Status NVARCHAR(50)=NULL,
@Teacher_Email NVARCHAR(50)=NULL,
@Teacher_Contact NVARCHAR(50)=NULL, 
@Teacher_Address NVARCHAR(50)=NULL, 
@Teacher_Education NVARCHAR(50)=NULL, 
@Teacher_Salery NVARCHAR(50)=NULL,
@Teacher_Class NVARCHAR(50)=NULL 
AS
BEGIN

   IF @Action='Insert'
   BEGIN
   INSERT INTO Teachers VALUES
   (@TeacherID,@Teacher_FirstName,@Teacher_Lastname,@Teacher_FatherName,@Teacher_Username,@Teacher_Password,@Teacher_Gender,@Teacher_DOfBirth,@Teacher_DOfJoin,@Teacher_Status,@Teacher_Email,@Teacher_Contact,@Teacher_Education,@Teacher_Address,@Teacher_Salery,@Teacher_Class)
   END

   IF @Action='Update'
   BEGIN
   UPDATE Teachers SET 
  Teacher_FirstName=@Teacher_FirstName,Teacher_Lastname=@Teacher_Lastname,Teacher_FatherName=@Teacher_FatherName,Teacher_Username=@Teacher_Username,Teacher_Password=@Teacher_Password,Teacher_Gender=@Teacher_Gender,Teacher_DOfBirth=@Teacher_DOfBirth,Teacher_DOfJoin=@Teacher_DOfJoin,Teacher_Status=@Teacher_Status,Teacher_Email=@Teacher_Email,Teacher_Contact=@Teacher_Contact,Teacher_Education=@Teacher_Education,Teacher_Address=@Teacher_Address,Teacher_Salery=@Teacher_Salery,Teacher_Class=@Teacher_Class WHERE TeacherID=@TeacherID

   END

   IF @Action='Delete'
   BEGIN
   DELETE FROM Teachers WHERE TeacherID=@TeacherID
   END

   IF @Action='SelectAll'
   BEGIN
   SELECT 
   TeacherID AS 'TEACHER ID',
   Teacher_FirstName AS 'FIRST NAME', 
   Teacher_Lastname AS 'LAST NAME',
   Teacher_FatherName AS 'FATHER NAME',
   Teacher_Username AS 'USERNAME',
   Teacher_Password AS 'PASSWORD',
   Teacher_Gender AS 'GENDER',
   Teacher_DOfJoin AS 'DATE OF JOIN',
   Teacher_DOfBirth AS 'DATE OF BIRTH',
   Teacher_Status AS 'STATUS',
   Teacher_Email AS 'EMAIL',
   Teacher_Contact AS 'CONTACT',
   Teacher_Address AS 'ADDRESS',
   Teacher_Education AS 'EDUCATION',
   Teacher_Salery AS 'SALERY',
   Teacher_Class AS 'ASSIGN CLASS'
   FROM Teachers
   END
END

GO
create PROC AutoTeacherID 
AS
BEGIN
SELECT ISNULL(MAX(TeacherID),0)+1 FROM Teachers
END

GO
create PROC usp_Section
@Action NVARCHAR(50),
@SectionID INT=NULL,
@SectionName NVARCHAR(50)=NULL
AS
BEGIN
   
   IF @Action='Insert'
   BEGIN
   INSERT INTO Section VALUES(@SectionID,@SectionName)
   END

   IF @Action='Update'
   BEGIN
   UPDATE Section SET SectionName=@SectionName WHERE SectionID=@SectionID
   END

   IF @Action='SelectAll'
   BEGIN
   SELECT SectionID AS 'SECTION ID',SectionName AS 'SECTION NAME' FROM Section
   END

   IF @Action='SelectSectionNames'
   BEGIN
   SELECT SectionName FROM Section
   END

   IF @Action='Delete'
   BEGIN
   DELETE FROM Section WHERE SectionID=@SectionID
   END
END
GO

create PROC usp_Employees
@Action NVARCHAR(50),
@Emp_ID INT=NULL,
@Emp_FirstName NVARCHAR(50)=NULL,
@Emp_LastName NVARCHAR(50)=NULL,
@Emp_FatherName NVARCHAR(50)=NULL,
@Emp_Age INT=NULL,
@Emp_Gender NVARCHAR(50)=NULL,
@Emp_BirthDate DATE=NULL,
@Emp_JoinDate Date=NULL,
@Emp_City NVARCHAR(50)=NULL,
@Emp_Contact NVARCHAR(50)=NULL,
@Emp_Address NVARCHAR(50)=NULL,
@Emp_Salery nvarchar(50)=NULL,
@Emp_Type VARCHAR(50)=NULL,
@Emp_Status nvarchar(50)=NULL
AS
BEGIN
  
  IF @Action='Insert'
  BEGIN
  INSERT INTO Empoloyees VALUES
  (@Emp_ID,@Emp_FirstName,@Emp_LastName,@Emp_FatherName,@Emp_Age,@Emp_Gender,@Emp_BirthDate,@Emp_JoinDate,@Emp_City,@Emp_Contact,@Emp_Address,@Emp_Salery,@Emp_Type,@Emp_Status)
  END

   IF @Action='Update'
  BEGIN
  UPDATE Empoloyees SET 
  Emp_FirstName=@Emp_FirstName,
  Emp_LastName=@Emp_LastName,
  Emp_FatherName=@Emp_FatherName,
  Emp_Age=@Emp_Age,
  Emp_Gender=@Emp_Gender,
  Emp_BirthDate=@Emp_BirthDate,
  Emp_JoinDate=@Emp_JoinDate,
  Emp_City=@Emp_City,
  Emp_Contact=@Emp_Contact,
  Emp_Address=@Emp_Address,
  Emp_Salery=@Emp_Salery,
  Emp_Type=@Emp_Type,
  Emp_Status=@Emp_Status
  WHERE Emp_ID=@Emp_ID
  END

   IF @Action='Delete'
  BEGIN
  DELETE FROM Empoloyees WHERE Emp_ID=@Emp_ID
  END

   IF @Action='SelectAll'
  BEGIN

  SELECT
  
  Emp_ID AS 'ID',
  Emp_FirstName AS 'FIRST NAME',
  Emp_LastName AS 'LAST NAME',
  Emp_FatherName AS 'FATHER NAME',
  Emp_Age AS 'AGE',
  Emp_Gender AS 'GENDER',
  Emp_BirthDate AS 'DATE OF BIRTH',
  Emp_JoinDate AS 'DATE OF JOIN',
  Emp_City AS 'CITY', 
  Emp_Contact AS 'CONTACT',
  Emp_Address AS 'ADDRESS',
  Emp_Salery AS 'SALERY',
  Emp_Type AS 'TYPE',
  Emp_Status AS 'STATUS'
   FROM Empoloyees

  END

END 

GO

create PROC usp_Expense
@Action NVARCHAR(50),
@ExpID INT=NULL,
@ExpAmount NVARCHAR(50)=NULL,
@ExpDate DATE=NULL,
@ExpPayMode NVARCHAR(50)=NULL,
@ExpRemarks NVARCHAR(100)=NULL,
@ExpType INT=NULL
AS
BEGIN

  IF @Action='Insert'
  BEGIN
  INSERT INTO Expense VALUES(@ExpID,@ExpAmount,@ExpDate,@ExpPayMode,@ExpRemarks,@ExpType)
  END

  IF @Action='Update'
  BEGIN

  UPDATE Expense SET ExpenseAmount=@ExpAmount,ExpenseDate=@ExpDate,
         ExpensePayMode=@ExpPayMode,ExpenseRemarks=@ExpRemarks,FKExpType=@ExpType
		 WHERE ExpenseID=@ExpID
  END

  IF @Action='Delete'
  BEGIN

  DELETE FROM Expense WHERE ExpenseID=@ExpID
  END

  IF @Action='SelectAll'
  BEGIN
  SELECT 
  
  ExpenseID AS 'EXPENSE ID',
  ExpenseAmount AS 'EXPENSE AMOUNT',
  ExpenseDate AS 'EXPENSE DATE',
  ExpensePayMode AS 'PAY MODE',
  ExpenseRemarks AS 'REMARKS',
  FKExpType AS 'EXPENSE TYPE' 
  FROM Expense
  END

   IF @Action='ExpenseType'
   BEGIN
   SELECT *  FROM ExpenceType
   END

END

GO


CREATE PROC AutoIDExpense
AS
BEGIN
SELECT ISNULL(MAX(ExpenseID),0)+1 FROM Expense
END

GO
--/////////UserType Insert Proc


create PROC SP_Insert_UserType
@UserTypeID INT,
@UserTypeName NVARCHAR(50),
@UserTypeDescription NVARCHAR(50)
AS
BEGIN
INSERT INTO UserType VALUES(@UserTypeID,@UserTypeName,@UserTypeDescription)
END

go
 insert into UserType values (1,'Teacher','Teacher Manage student attendence')
  insert into UserType values (2,'Addmission','addmission manage add student and employee ')
 insert into UserType values  (3,'Accounts','Accountants can manage money transfer')

GO

create PROC AutoClassID 
AS
BEGIN
SELECT ISNULL(MAX(Class_ID),0)+1 FROM Classes
END

GO

alter PROC sp_CBoxFeeMonth
AS
BEGIN
SELECT FeeMonths FROM FeesMonth
END

GO
alter PROC uspStudentFee
@Action NVARCHAR(50),
@FeeID INT=NULL,
@FKStudentID INT=NULL,
@FeeDate DATE=NULL,
@Fees NVARCHAR(50)=NULL,
@FeeMonth INT=NULL
AS
BEGIN

  IF @Action='INSERT'
  BEGIN
  INSERT INTO StdCollectFee VALUES(@FeeID,@FKStudentID,@FeeDate,@Fees,@FeeMonth)
  END

  if @Action='PayMonth'
  begin	
  select * from FeesMonth
  end

  IF @Action='SelectAll'
  BEGIN

  SELECT
      FeeID AS 'ID',
      FKStudentID AS 'Student NAME',
      FeeDate AS 'DATE',
      Fees AS 'FEE',
      FeeMonth AS 'PAY MONTH'
    FROM StdCollectFee
  END

  IF @Action='Update'
  BEGIN 
  UPDATE StdCollectFee SET
      
      FKStudentID=@FKStudentID ,
      FeeDate =@FeeDate,
      Fees = @Fees,
      FeeMonth=@FeeMonth
	  WHERE FeeID=@FeeID
  END

  IF @Action='Delete'
  BEGIN
  DELETE FROM StdCollectFee WHERE FeeID=@FeeID
  END

END
GO
create PROC AutofeeID 
AS
BEGIN
SELECT ISNULL(MAX(FeeID),0)+1 FROM StdCollectFee
END

GO
create PROC AutoSectionID 
AS
BEGIN
SELECT ISNULL(MAX(SectionID),0)+1 FROM Section
END
go
EXEC SP_Insert_UserType 1,'Teacher','Teacher Can View Their Students And Subject'
EXEC SP_Insert_UserType 2,'Accounts','Accontants Can Manage Student Fee AND Emp Sallery'
EXEC SP_Insert_UserType 3,'Addmission','Manage Student And Employe Attendence'
GO


CREATE PROC CB_UserType
AS
BEGIN
SELECT UserType_Name FROM UserType
END

GO

create PROC SP_UserStatus_Insert
@UserStatus_ID INT,
@UserStatus_Name NVARCHAR(50),
@UserStatus_Description NVARCHAR(50)
AS
BEGIN
INSERT INTO UserStatus VALUES(@UserStatus_ID,@UserStatus_Name,@UserStatus_Description)
END

EXEC SP_UserStatus_Insert 1,'Active','User is Online'
EXEC SP_UserStatus_Insert 2,'Offline','User is Offline'
EXEC SP_UserStatus_Insert 3,'Busy','User is Busy'
EXEC SP_UserStatus_Insert 4,'Left','User Has Left'
select * from UserType
GO

create PROC CB_UserStatus
AS
BEGIN
SELECT UserStatus_Name FROM UserStatus
END

GO

create PROC SP_AutoID
AS
BEGIN

SELECT  ISNULL(MAX(User_id),0)+1 from Users
END

go


create proc usercount
as
begin
select   Max(count(User_id)) AS TotalUser from Users
end

exec usercount 

GO
CREATE PROC sp_Gender
AS
BEGIN
SELECT GenderType FROM Gender
END

GO

------------------------ SEARCH DATA Procedure ----------------------
