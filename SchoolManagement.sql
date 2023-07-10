USE [School_Management_System]
GO
/****** Object:  StoredProcedure [dbo].[AutoClassID]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[AutoClassID] 
AS
BEGIN
SELECT ISNULL(MAX(Class_ID),0)+1 FROM Classes
END


GO
/****** Object:  StoredProcedure [dbo].[AutofeeID]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[AutofeeID] 
AS
BEGIN
SELECT ISNULL(MAX(FeeID),0)+1 FROM StdCollectFee
END

GO
/****** Object:  StoredProcedure [dbo].[AutoIDExpense]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[AutoIDExpense]
AS
BEGIN
SELECT ISNULL(MAX(ExpenseID),0)+1 FROM Expense
END


GO
/****** Object:  StoredProcedure [dbo].[AutoSectionID]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[AutoSectionID] 
AS
BEGIN
SELECT ISNULL(MAX(SectionID),0)+1 FROM Section
END













EXEC SP_Insert_UserType 1,'Teacher','Teacher Can View Their Students And Subject'
EXEC SP_Insert_UserType 2,'Accounts','Accontants Can Manage Student Fee AND Emp Sallery'
EXEC SP_Insert_UserType 3,'Addmission','Manage Student And Employe Attendence'

GO
/****** Object:  StoredProcedure [dbo].[AutoTeacherID]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[AutoTeacherID] 
AS
BEGIN
SELECT ISNULL(MAX(TeacherID),0)+1 FROM Teachers
END


GO
/****** Object:  StoredProcedure [dbo].[CB_UserStatus]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[CB_UserStatus]
AS
BEGIN
SELECT UserStatus_Name FROM UserStatus
END


GO
/****** Object:  StoredProcedure [dbo].[CB_UserType]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[CB_UserType]
AS
BEGIN
SELECT UserType_Name FROM UserType
END


GO
/****** Object:  StoredProcedure [dbo].[SelectStudentNames]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SelectStudentNames]
as
begin
select Std_FirstName+' '+Std_LastName from Students
end

GO
/****** Object:  StoredProcedure [dbo].[SP_AutoID]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[SP_AutoID]
AS
BEGIN

SELECT  ISNULL(MAX(User_id),0)+1 from Users
END


GO
/****** Object:  StoredProcedure [dbo].[sp_CBoxFeeMonth]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_CBoxFeeMonth]
AS
BEGIN
SELECT FeeMonths FROM FeesMonth
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Gender]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Gender]
AS
BEGIN
SELECT GenderType FROM Gender
END


GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_UserType]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--/////////UserType Insert Proc


create PROC [dbo].[SP_Insert_UserType]
@UserTypeID INT,
@UserTypeName NVARCHAR(50),
@UserTypeDescription NVARCHAR(50)
AS
BEGIN
INSERT INTO UserType VALUES(@UserTypeID,@UserTypeName,@UserTypeDescription)
END


GO
/****** Object:  StoredProcedure [dbo].[sp_SelectStudentStatus]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SelectStudentStatus]
AS
BEGIN
SELECT StdStatus FROM StudentStatus
END
GO
/****** Object:  StoredProcedure [dbo].[SP_USER_LOGIN]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--//  User View Procedure
create PROC [dbo].[SP_USER_LOGIN]
@user NVARCHAR(50),
@pass NVARCHAR(50)
AS
BEGIN
SELECT * FROM Users WHERE  Username=@user AND Passwords=@pass 
END


GO
/****** Object:  StoredProcedure [dbo].[SP_UserStatus_Insert]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[SP_UserStatus_Insert]
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


GO
/****** Object:  StoredProcedure [dbo].[StudentAutoID]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[StudentAutoID]
AS
BEGIN

SELECT ISNULL(MAX(Std_ID),0)+1 FROM Students
END

GO
/****** Object:  StoredProcedure [dbo].[TeacherLogin]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TeacherLogin]
@username nvarchar(50),
@password nvarchar(50)
as
begin
SELECT * FROM Teachers WHERE Teacher_Username=@username and Teacher_Password=@password
end

GO
/****** Object:  StoredProcedure [dbo].[usp_Class]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[CLASS] INSERT,UPDATE,DELETE,SELECT STORE PROCEDURE
create PROC [dbo].[usp_Class]
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


GO
/****** Object:  StoredProcedure [dbo].[usp_Employees]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[usp_Employees]
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
/****** Object:  StoredProcedure [dbo].[usp_Expense]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[usp_Expense]
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
/****** Object:  StoredProcedure [dbo].[usp_Section]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[usp_Section]
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
/****** Object:  StoredProcedure [dbo].[usp_Student]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Student]
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
GO
/****** Object:  StoredProcedure [dbo].[usp_Teachers]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[TEACHERS] INSERT,UPDATE,DELETE,SELECT STORE PROCEDURE
create PROC [dbo].[usp_Teachers]
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
/****** Object:  StoredProcedure [dbo].[usp_User]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_User]
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
/****** Object:  StoredProcedure [dbo].[uspStudentFee]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspStudentFee]
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
/****** Object:  Table [dbo].[Classes]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[Class_ID] [int] NOT NULL,
	[Class_Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Class_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Empoloyees]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empoloyees](
	[Emp_ID] [int] NOT NULL,
	[Emp_FirstName] [nvarchar](50) NULL,
	[Emp_LastName] [nvarchar](50) NULL,
	[Emp_FatherName] [nvarchar](50) NULL,
	[Emp_Age] [int] NULL,
	[Emp_Gender] [nvarchar](50) NULL,
	[Emp_BirthDate] [date] NULL,
	[Emp_JoinDate] [date] NULL,
	[Emp_City] [nvarchar](50) NULL,
	[Emp_Contact] [nvarchar](50) NULL,
	[Emp_Address] [nvarchar](50) NULL,
	[Emp_Salery] [nvarchar](50) NULL,
	[Emp_Type] [varchar](50) NULL,
	[Emp_Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Emp_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpenceType]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpenceType](
	[ExpTypeID] [int] NOT NULL,
	[ExpType] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ExpTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Expense]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expense](
	[ExpenseID] [int] NOT NULL,
	[ExpenseAmount] [nvarchar](50) NULL,
	[ExpenseDate] [date] NULL,
	[ExpensePayMode] [nvarchar](50) NULL,
	[ExpenseRemarks] [nvarchar](50) NULL,
	[FKExpType] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ExpenseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FeesMonth]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeesMonth](
	[FeeMonthID] [int] NOT NULL,
	[FeeMonths] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[FeeMonthID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gender]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[GenderID] [int] NOT NULL,
	[GenderType] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[GenderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Section]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section](
	[SectionID] [int] NOT NULL,
	[SectionName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[SectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StdCollectFee]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StdCollectFee](
	[FeeID] [int] NOT NULL,
	[FKStudentID] [int] NULL,
	[FeeDate] [date] NULL,
	[Fees] [nvarchar](50) NULL,
	[FeeMonth] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StdStatus]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StdStatus](
	[Std_StatusID] [int] NOT NULL,
	[Std_Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Std_StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentAttendance]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentAttendance](
	[AttendId] [int] NOT NULL,
	[StudentId] [int] NULL,
	[AttendDate] [date] NULL,
	[AttendStatus] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[AttendId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Students]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Std_ID] [int] NOT NULL,
	[Std_FirstName] [nvarchar](50) NULL,
	[Std_LastName] [nvarchar](50) NULL,
	[Std_Fathername] [nvarchar](50) NULL,
	[Std_Gender] [nvarchar](50) NULL,
	[Std_Age] [int] NULL,
	[Std_DateOfBirth] [datetime] NULL,
	[Std_AdmmissionDate] [datetime] NULL,
	[Std_Contact] [nvarchar](50) NULL,
	[Std_FatherContact] [nvarchar](50) NULL,
	[Std_Email] [nvarchar](50) NULL,
	[Std_Address] [nvarchar](50) NULL,
	[Std_Class] [nvarchar](50) NULL,
	[Std_Status] [nvarchar](50) NULL,
	[Std_Section] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Std_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentStatus]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentStatus](
	[StdStatusID] [int] NOT NULL,
	[StdStatus] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[StdStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[Sub_ID] [int] NOT NULL,
	[Sub_NAME] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Sub_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[TeacherID] [int] NOT NULL,
	[Teacher_FirstName] [nvarchar](50) NULL,
	[Teacher_Lastname] [nvarchar](50) NULL,
	[Teacher_FatherName] [nvarchar](50) NULL,
	[Teacher_Username] [nvarchar](50) NULL,
	[Teacher_Password] [nvarchar](50) NULL,
	[Teacher_Gender] [nvarchar](50) NULL,
	[Teacher_DOfJoin] [date] NULL,
	[Teacher_DOfBirth] [date] NULL,
	[Teacher_Status] [nvarchar](50) NULL,
	[Teacher_Email] [nvarchar](50) NULL,
	[Teacher_Contact] [nvarchar](50) NULL,
	[Teacher_Address] [nvarchar](50) NULL,
	[Teacher_Education] [nvarchar](50) NULL,
	[Teacher_Salery] [nvarchar](50) NULL,
	[Teacher_Class] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[User_id] [int] NOT NULL,
	[User_FirstName] [nvarchar](50) NULL,
	[User_LastName] [nvarchar](50) NULL,
	[User_Fathername] [nvarchar](50) NULL,
	[Username] [nvarchar](50) NULL,
	[Passwords] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[DateOfJoin] [date] NULL,
	[UserTypes] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[Contact] [nvarchar](50) NULL,
	[Addresss] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[User_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserStatus]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserStatus](
	[UserStatus_ID] [int] NOT NULL,
	[UserStatus_Name] [nvarchar](50) NULL,
	[UserStatus_Description] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserStatus_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserType]    Script Date: 20-Aug-18 7:30:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[UserType_ID] [int] NOT NULL,
	[UserType_Name] [nvarchar](50) NULL,
	[UserType_Description] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Classes] ([Class_ID], [Class_Name]) VALUES (1, N'Nursary')
INSERT [dbo].[Classes] ([Class_ID], [Class_Name]) VALUES (2, N'KG-1')
INSERT [dbo].[Classes] ([Class_ID], [Class_Name]) VALUES (3, N'KG-2')
INSERT [dbo].[Classes] ([Class_ID], [Class_Name]) VALUES (4, N'One')
INSERT [dbo].[Classes] ([Class_ID], [Class_Name]) VALUES (5, N'Two')
INSERT [dbo].[Classes] ([Class_ID], [Class_Name]) VALUES (6, N'Three')
INSERT [dbo].[Classes] ([Class_ID], [Class_Name]) VALUES (7, N'Four')
INSERT [dbo].[Classes] ([Class_ID], [Class_Name]) VALUES (8, N'Five')
INSERT [dbo].[Classes] ([Class_ID], [Class_Name]) VALUES (9, N'Six')
INSERT [dbo].[Classes] ([Class_ID], [Class_Name]) VALUES (10, N'Seven')
INSERT [dbo].[FeesMonth] ([FeeMonthID], [FeeMonths]) VALUES (1, N'January')
INSERT [dbo].[FeesMonth] ([FeeMonthID], [FeeMonths]) VALUES (2, N'February')
INSERT [dbo].[FeesMonth] ([FeeMonthID], [FeeMonths]) VALUES (3, N'March')
INSERT [dbo].[FeesMonth] ([FeeMonthID], [FeeMonths]) VALUES (4, N'April')
INSERT [dbo].[FeesMonth] ([FeeMonthID], [FeeMonths]) VALUES (5, N'May')
INSERT [dbo].[FeesMonth] ([FeeMonthID], [FeeMonths]) VALUES (6, N'June')
INSERT [dbo].[FeesMonth] ([FeeMonthID], [FeeMonths]) VALUES (7, N'July')
INSERT [dbo].[FeesMonth] ([FeeMonthID], [FeeMonths]) VALUES (8, N'August')
INSERT [dbo].[FeesMonth] ([FeeMonthID], [FeeMonths]) VALUES (9, N'September')
INSERT [dbo].[FeesMonth] ([FeeMonthID], [FeeMonths]) VALUES (10, N'October')
INSERT [dbo].[FeesMonth] ([FeeMonthID], [FeeMonths]) VALUES (11, N'November')
INSERT [dbo].[FeesMonth] ([FeeMonthID], [FeeMonths]) VALUES (12, N'December')
INSERT [dbo].[Section] ([SectionID], [SectionName]) VALUES (1, N'A')
INSERT [dbo].[Section] ([SectionID], [SectionName]) VALUES (2, N'B')
INSERT [dbo].[Section] ([SectionID], [SectionName]) VALUES (3, N'C')
INSERT [dbo].[Section] ([SectionID], [SectionName]) VALUES (4, N'D')
INSERT [dbo].[Section] ([SectionID], [SectionName]) VALUES (5, N'E')
INSERT [dbo].[Section] ([SectionID], [SectionName]) VALUES (6, N'F')
INSERT [dbo].[Section] ([SectionID], [SectionName]) VALUES (7, N'G')
INSERT [dbo].[StdCollectFee] ([FeeID], [FKStudentID], [FeeDate], [Fees], [FeeMonth]) VALUES (1, NULL, CAST(N'2018-08-20' AS Date), N'5600', NULL)
INSERT [dbo].[Students] ([Std_ID], [Std_FirstName], [Std_LastName], [Std_Fathername], [Std_Gender], [Std_Age], [Std_DateOfBirth], [Std_AdmmissionDate], [Std_Contact], [Std_FatherContact], [Std_Email], [Std_Address], [Std_Class], [Std_Status], [Std_Section]) VALUES (1, N'ali', N'', N'', N'Female', 0, CAST(N'2018-08-20 00:42:14.500' AS DateTime), CAST(N'2018-08-20 00:42:14.537' AS DateTime), N'', N'', N'', N'', N'Nursary', N'Passout', N'A')
INSERT [dbo].[Students] ([Std_ID], [Std_FirstName], [Std_LastName], [Std_Fathername], [Std_Gender], [Std_Age], [Std_DateOfBirth], [Std_AdmmissionDate], [Std_Contact], [Std_FatherContact], [Std_Email], [Std_Address], [Std_Class], [Std_Status], [Std_Section]) VALUES (2, N'haji', N'', N'', N'Female', 0, CAST(N'2018-08-20 00:42:30.220' AS DateTime), CAST(N'2018-08-20 00:42:30.260' AS DateTime), N'', N'', N'', N'', N'Nursary', N'Active', N'A')
INSERT [dbo].[Students] ([Std_ID], [Std_FirstName], [Std_LastName], [Std_Fathername], [Std_Gender], [Std_Age], [Std_DateOfBirth], [Std_AdmmissionDate], [Std_Contact], [Std_FatherContact], [Std_Email], [Std_Address], [Std_Class], [Std_Status], [Std_Section]) VALUES (3, N'karam', N'', N'', N'Male', 0, CAST(N'2018-08-20 00:42:30.220' AS DateTime), CAST(N'2018-08-20 00:42:30.260' AS DateTime), N'', N'', N'', N'', N'Nursary', N'Active', N'A')
INSERT [dbo].[Students] ([Std_ID], [Std_FirstName], [Std_LastName], [Std_Fathername], [Std_Gender], [Std_Age], [Std_DateOfBirth], [Std_AdmmissionDate], [Std_Contact], [Std_FatherContact], [Std_Email], [Std_Address], [Std_Class], [Std_Status], [Std_Section]) VALUES (4, N'wali', N'', N'', N'Female', 0, CAST(N'2018-08-20 00:42:30.220' AS DateTime), CAST(N'2018-08-20 00:42:30.260' AS DateTime), N'', N'', N'', N'', N'Nursary', N'Active', N'A')
INSERT [dbo].[StudentStatus] ([StdStatusID], [StdStatus]) VALUES (1, N'Active')
INSERT [dbo].[StudentStatus] ([StdStatusID], [StdStatus]) VALUES (2, N'Passout')
INSERT [dbo].[StudentStatus] ([StdStatusID], [StdStatus]) VALUES (3, N'Left')
INSERT [dbo].[Teachers] ([TeacherID], [Teacher_FirstName], [Teacher_Lastname], [Teacher_FatherName], [Teacher_Username], [Teacher_Password], [Teacher_Gender], [Teacher_DOfJoin], [Teacher_DOfBirth], [Teacher_Status], [Teacher_Email], [Teacher_Contact], [Teacher_Address], [Teacher_Education], [Teacher_Salery], [Teacher_Class]) VALUES (1, N'Ahmed', N'Ali', N'', N'tech', N'123', N'Female', CAST(N'2018-08-20' AS Date), CAST(N'2018-08-20' AS Date), NULL, N'', N'', N'', N'', N'', N'Nursary')
INSERT [dbo].[Users] ([User_id], [User_FirstName], [User_LastName], [User_Fathername], [Username], [Passwords], [Email], [Gender], [DateOfBirth], [DateOfJoin], [UserTypes], [Status], [Contact], [Addresss]) VALUES (1, N'Muhammad', N'Shahzaib', N'Muhammad Sharif', N'admin', N'admin', N'm.shahzaib.123456@gmail.com', N'Male', CAST(N'1998-05-15' AS Date), CAST(N'2018-07-23' AS Date), N'Admin', N'Active', N'03402087662', N'R-429 Data Nagar')
INSERT [dbo].[Users] ([User_id], [User_FirstName], [User_LastName], [User_Fathername], [Username], [Passwords], [Email], [Gender], [DateOfBirth], [DateOfJoin], [UserTypes], [Status], [Contact], [Addresss]) VALUES (2, N'Jawad', N'Ali', N'a', N'teacher', N'123', N'a', N'Male', CAST(N'2018-08-19' AS Date), CAST(N'2018-08-19' AS Date), N'Teacher', N'Active', N'a', N'')
INSERT [dbo].[Users] ([User_id], [User_FirstName], [User_LastName], [User_Fathername], [Username], [Passwords], [Email], [Gender], [DateOfBirth], [DateOfJoin], [UserTypes], [Status], [Contact], [Addresss]) VALUES (3, N'Sadia', N'Shahzaib', N'b', N'add', N'123', N'b', N'Male', CAST(N'2018-08-19' AS Date), CAST(N'2018-08-19' AS Date), N'Addmission', N'Active', N'b', N'b')
INSERT [dbo].[Users] ([User_id], [User_FirstName], [User_LastName], [User_Fathername], [Username], [Passwords], [Email], [Gender], [DateOfBirth], [DateOfJoin], [UserTypes], [Status], [Contact], [Addresss]) VALUES (4, N'Rehman', N'Khadim', N'b', N'account', N'123', N'b', N'Male', CAST(N'2018-08-19' AS Date), CAST(N'2018-08-19' AS Date), N'Accounts', N'Offline', N'b', N'b')
INSERT [dbo].[UserStatus] ([UserStatus_ID], [UserStatus_Name], [UserStatus_Description]) VALUES (1, N'Active', N'User is Online')
INSERT [dbo].[UserStatus] ([UserStatus_ID], [UserStatus_Name], [UserStatus_Description]) VALUES (2, N'Offline', N'User is Offline')
INSERT [dbo].[UserStatus] ([UserStatus_ID], [UserStatus_Name], [UserStatus_Description]) VALUES (3, N'Busy', N'User is Busy')
INSERT [dbo].[UserStatus] ([UserStatus_ID], [UserStatus_Name], [UserStatus_Description]) VALUES (4, N'Left', N'User Has Left')
INSERT [dbo].[UserType] ([UserType_ID], [UserType_Name], [UserType_Description]) VALUES (1, N'Teacher', N'Teacher Manage student attendence')
INSERT [dbo].[UserType] ([UserType_ID], [UserType_Name], [UserType_Description]) VALUES (2, N'Addmission', N'addmission manage add student and employee ')
INSERT [dbo].[UserType] ([UserType_ID], [UserType_Name], [UserType_Description]) VALUES (3, N'Accounts', N'Accountants can manage money transfer')
ALTER TABLE [dbo].[Expense]  WITH CHECK ADD FOREIGN KEY([FKExpType])
REFERENCES [dbo].[ExpenceType] ([ExpTypeID])
GO
ALTER TABLE [dbo].[StdCollectFee]  WITH CHECK ADD FOREIGN KEY([FeeMonth])
REFERENCES [dbo].[FeesMonth] ([FeeMonthID])
GO
ALTER TABLE [dbo].[StdCollectFee]  WITH CHECK ADD FOREIGN KEY([FKStudentID])
REFERENCES [dbo].[Students] ([Std_ID])
GO
ALTER TABLE [dbo].[StudentAttendance]  WITH CHECK ADD FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Std_ID])
GO
