/*===========================CREATE DATABASE===========================*/



-- create database: Testing_System_Assignment_1
DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

-- createtable: Department
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
Department_ID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Department_Name		NVARCHAR(50) UNIQUE KEY NOT NULL
);

-- create table: Position
DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position`(
Position_ID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Position_Name		ENUM('Dev', 'Test', 'Scrum Master', 'PM') NOT NULL UNIQUE KEY
);

-- create table: Account
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
Account_Id			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Email				VARCHAR(100) UNIQUE KEY NOT NULL,
Username			VARCHAR(50) UNIQUE KEY NOT NULL CHECK (LENGTH (Username) >=6 ),
Fullname			NVARCHAR(50) NOT NULL,
Department_ID		TINYINT UNSIGNED NOT NULL,
Position_ID			TINYINT UNSIGNED NOT NULL,
CreateDate			DATETIME DEFAULT NOW(),
FOREIGN KEY(DepartmentID) REFERENCES department(DepartmentID),
FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);

-- create table: Group
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
Group_ID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Group_Name			VARCHAR(50) NOT NULL UNIQUE KEY,
Creator_ID			TINYINT UNSIGNED,
CreateDate			DATETIME DEFAULT NOW(),
FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID)
);

-- create table: GroupAccount
DROP TABLE IF EXISTS `GroupAccount`;
CREATE TABLE `GroupAccount`(
Group_ID				TINYINT UNSIGNED NOT NULL,
Account_ID			TINYINT UNSIGNED NOT NULL,
JoinDate			DATETIME DEFAULT NOW(),
PRIMARY KEY(GroupID,AccountID),
FOREIGN KEY(GroupID) REFERENCES `Group`(GroupID),
FOREIGN KEY(AccountID) REFERENCES `Account`(AccountID)	
);

-- create table: TypeQuestion
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion(
Type_ID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Type_Name			ENUM('Essay','Multiple-Choice') NOT NULL UNIQUE KEY
);

-- create table: CategoryQuestion
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
Category_ID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Category_Name		VARCHAR(50) NOT NULL
);

-- create table: Question
DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
Question_ID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content				NVARCHAR(100) NOT NULL,
Category_ID			TINYINT UNSIGNED NOT NULL,
TypeID				TINYINT UNSIGNED NOT NULL,
Creator_ID			TINYINT UNSIGNED NOT NULL,
CreateDate			DATETIME DEFAULT NOW(),
FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
FOREIGN KEY(TypeID) REFERENCES TypeQuestion(TypeID),
FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID)
);

-- create table: Answer
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
AnswerID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content				VARCHAR(100) NOT NULL,
QuestionID			TINYINT UNSIGNED,
isCorrect			BIT DEFAULT 1,
FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);

-- create table: Exam
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
ExamID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`Code`				VARCHAR(20) NOT NULL,
Title				VARCHAR(100),
CategoryID			TINYINT UNSIGNED NOT NULL,
Duration			TINYINT UNSIGNED NOT NULL,
CreatorID			TINYINT UNSIGNED NOT NULL,
CrateDate			DATETIME DEFAULT NOW(),
FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID)
);

-- create table: ExamQuestion
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
ExamID				TINYINT UNSIGNED NOT NULL,
QuestionID			TINYINT UNSIGNED NOT NULL,
FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID),	
FOREIGN KEY(ExamID) REFERENCES Exam(ExamID),
PRIMARY KEY(ExamID,QuestionID)
);

/*====================================================INSERT DATA=====================================================*/
-- add data Department
INSERT INTO Department(DepartmentName)
VALUES       		('B???o v???'		),
					('K?? thu???t'		),
                    ('Th?? k??'		),
                    ('T??i ch??nh'	),
                    ('Gi??m ?????c'		),
					('B??n H??ng'		),
                    ('Sale'			);
                    
-- add data Position                    
INSERT INTO `Position`(PositionName)
VALUES				(   'Dev'			),
                    (   'Test'			),
                    (   'Scrum Master'  ),
                    (   'PM'			);
                    
                    

-- add data Account
INSERT INTO `Account`( Email,							 Username,			 FullName,					 DepartmentID,	 PositionID,  	CreateDate)
VALUES 				('tranxuanquy@gmail.com'			, 'Quy'				, 'Tr???n Xu??n Qu??'			, '1'			, '1'		 ,	'2021-03-28'),
					('nguyenthinhung@gmail.com'			, 'Nhung'			, 'Nguy???n Th??? Nhung'		, '2'			, '2'		 ,	'2021-03-28'),
                    ('nguyentuantu@gmail.com'			, 'Tu'				, 'Nguy???n Tu???n T??'			, '3'			, '4'		 ,	'2021-03-28'),
                    ('doanvanngoc@gmail.com'			, 'Ngoc'			, '??o??n V??n Ng???c'			, '4'			, '3'		 ,	'2021-03-28'),
                    ('phambangbang@gmail.com'			, 'B??ng'			, 'Ph???m B??ng B??ng'			, '5'			, '2'		 ,	'2021-03-28'),
                    ('lexuanhai@gmail.com'				, 'Hai'				, 'L?? XU??N H???I'				, '6'			, '1'		 ,	'2021-03-28'),
                    ('phungdiemhanh@gmail.com'			, 'Hanh'			, 'Ph??ng Di???m H???nh'  		, '7'			, '3'		 ,  '2021-03-28');
                    
  
         
-- add data Group         
INSERT INTO `Group`( GroupName						, CreatorID			, CreateDate)
VALUES			( 'Railway09'						, '1'				,  '2021-03-28' ),
				( 'Railway10'						, '2'				,  '2021-03-28' ),
                ( 'Railway11'						, '3'				,  '2021-03-28' ),
                ( 'Railway12'						, '4'				,  '2021-03-28' ),
                ( 'Railway13'						, '5'				,  '2021-03-28' ),
                ( 'Railway14'						, '6'				,  '2021-03-28' ),
				( 'Railway15'						, '7'				,  '2021-03-28' );


-- add data GroupAccount
INSERT INTO GroupAccount(GroupID			, AccountID				, JoinDate )
VALUES					('1'				,'1'					,'2021-03-28' ),
						('2'				,'2'					,'2021-03-28' ),
						('3'				,'3'					,'2021-03-28' ),
						('4'				,'5'					,'2021-03-28' ),
						('5'				,'5'					,'2021-03-28' ),
                        ('6'				,'6'					,'2021-03-28' ),
						('7'				,'7'					,'2021-03-28' );
                        
                        
-- add data TypeQuestion
INSERT INTO TypeQuestion(TypeName)
VALUES 					( 'Essay'           ),
						( 'Multiple-Choice' ),
                        ( 'Multiple-Choice' ),
                        ( 'Essay'           ),
                        ( 'Multiple-Choice' ),
                        ( 'Essay' 	        ),
                        ( 'Multiple-Choice' );
                        
                        
-- add data CategoryQuestion
INSERT INTO CategoryQuestion( CategoryName )
VALUES						( 'Java'	),
							( 'SQL'		),
                            ( 'Postman' ),
                            ( 'Ruby' 	),
                            ( 'NET' 	),
                            ( 'PHP' 	),
                            ( 'C++'	 	);
                            
                            
-- add data Question
INSERT INTO Question( Content			, CategoryID			, TypeID			, CreatorID			, CreateDate )         
VALUES				('C??u h???i Java'		,'1'					,'1'				,'3'				,'2021-03-28'),
					('C??u h???i SQL'		,'4'					,'2'				,'7'				,'2021-03-28'),
                    ('C??u h???i NET'		,'7'					,'1'				,'1'				,'2021-03-28'),
                    ('C??u h???i Ruby'		,'2'					,'2'				,'4'				,'2021-03-28'),
                    ('C??u h???i Postman'	,'3'					,'2'				,'2'				,'2021-03-28'),
                    ('C??u h???i PHP'		,'5'					,'1'				,'5'				,'2021-03-28'),
                    ('C??u h???i C++'		,'6'					,'2'				,'6'				,'2021-03-28');
                    
                    
-- add data Answer
INSERT INTO Answer(Content			,QuestionID,			,isCorrect )	
VALUES  		('C??u tr??? l???i 1'	,'1'					, '1'	  ),
				('C??u tr??? l???i 2'	,'2'					, '0'	  ),
                ('C??u tr??? l???i 3'	,'3'					, '1'	  ),
                ('C??u tr??? l???i 4'	,'4'					, '1'	  ),
                ('C??u tr??? l???i 5'	,'5'					, '0'	  ),
                ('C??u tr??? l???i 6'	,'6'					, '1'	  ), 
                ('C??u tr??? l???i 7'	,'7'					, '0'     );
                

-- add data Exam
INSERT INTO Exam(`Code`			, Title				, CategoryID			, Duration			, CreatorID			, CreateDate   )
VALUES			('VTI101'		,'????? thi Java'		, '1'					,'90'				,'1'				,'2021-03-28'),
				('VTI102'		,'????? thi PHP'		, '5'					,'60'				,'2'				,'2021-03-28'),
                ('VTI103'		,'????? thi C++'		, '7'					,'90'				,'3'				,'2021-03-28'),
                ('VTI104'		,'????? thi Postman'	, '2'					,'90'				,'4'				,'2021-03-28'),
                ('VTI105'		,'????? thi NET'		, '6'					,'120'				,'5'				,'2021-03-28'),
                ('VTI106'		,'????? thi Ruby'		, '3'					,'90'				,'6'				,'2021-03-28'),
                ('VTI107'		,'????? thi SQL'		, '4'					,'60'				,'7'				,'2021-03-28');
                
                
-- add data ExamQuestion
INSERT INTO ExamQuestion(ExamID			,QuestionID)
VALUES					('7'			,'3'),
						('3'			,'5'),
                        ('1'			,'2'),
                        ('4'			,'1'),
                        ('2'			,'7'),
                        ('6'			,'4'),
                        ('5'			,'6');
                        
                
                            
					