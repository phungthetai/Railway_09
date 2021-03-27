DROP DATABASE IF EXISTS TestingSystem;
CREATE DATABASE TestingSystem;
USE TestingSystem;
 
 DROP TABLE IF EXISTS Department;
 CREATE TABLE Department(
 DepartmentID 			INT,
 DepartmentName 		VARCHAR(50)
 );
 
DROP TABLE IF EXISTS Position;
CREATE TABLE Position (
PositionID 				INT,
PositionName 			VARCHAR(50)
);

DROP TABLE IF EXISTS Acconut;
CREATE TABLE Acconut(
AccountID 				INT,
Email 					VARCHAR(100),
Username 				VARCHAR(50),
DepartmentID 			VARCHAR(50),
PositionID 				VARCHAR(50),
CreateDate 				DATE
);

DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
GroupID 				INT,
GroupName 				VARCHAR(50),
CreatorID				INT,
CreateDate 				DATE
); 

DROP TABLE IF EXISTS `GroupAccount`;
CREATE TABLE `GroupAccount`(
GroupID 				INT,
AccountID  				INT,
Joindate 				DATE
);

DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion(
TypeID 					INT,
Typename 				VARCHAR(50)
);

DROP TABLE IF EXISTS Categoryquestion;
CREATE TABLE Categoryquestion(
CategoryID 				INT,
Categoryname			VARCHAR(50)
);

DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
QuestionID 				INT,
Content					VARCHAR(100),
CategoryID				INT,
TypeID					INT,
CreatorID				INT,
Createdate				DATE
);

DROP TABLE IF EXISTS Answer;
CREATE TABLE Answre(
AnswerID				INT,
Content					VARCHAR(100),
QuestionID				INT,
Iscorrect				VARCHAR(50)
);

DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
ExamID					INT,
`code`					INT,
Title					VARCHAR(100),
TategoryID				INT,
Duration				INT,
CreatorID				INT,
Createdate				DATE
);

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
ExamID					INT,
QuestionID				INT
);









