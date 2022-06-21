CREATE DATABASE RiverPlate
GO

USE RiverPlate
GO

CREATE TABLE Student (
	StudentNo int PRIMARY KEY,
	StudentName varchar (50),
	StudentAddress varchar (100),
	PhoneNo int
)

CREATE TABLE Department(
	DeptNo int PRIMARY KEY,
	DeptName varchar (50),
	ManagerName varchar (30)
)

CREATE TABLE Assignment(
	AssignmentNo int PRIMARY KEY,
	Description varchar (100)
)

CREATE TABLE Works_Assign(
	JobID int PRIMARY KEY,
	StudentNo int CONSTRAINT fk_s FOREIGN KEY (StudentNo) REFERENCES Student (StudentNo),
	AssignmentNo int CONSTRAINT fk_a FOREIGN KEY (AssignmentNo) REFERENCES Assignment (AssignmentNo),
	TotalHours int,
	JobDetails XML
)

sp_rename 'Student.PK__Student__32C4C02A583E3DBC', 'IX_Student', 'INDEX'
GO

CREATE clustered index IX_Student ON Student (StudentNo) WITH (PAD_INDEX = ON)
GO

ALTER INDEX IX_Student ON Student REBUILD WITH (ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO

--CREATE NONCLUSTERED IX_Dept ON Department (DeptName, ManagerName) WITH 
DROP INDEX Department.IX_Dept
CREATE NONCLUSTERED INDEX IX_Dept ON Department (DeptNo, DeptName, ManagerName)
GO

EXEC sp_helpindex 'Student'EXEC sp_helpindex 'Department'


sp_rename 'Student.PK__Student__32C4C02A248103E3', 'IX_Student' , 'INDEX'ALTER INDEX IX_Student ON Student REBUILD WITH (ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)CREATE INDEX IX_Dept ON Department(DeptNo,DeptName,ManagerName)EXEC sp_helpindex 'Student'EXEC sp_helpindex 'Department'