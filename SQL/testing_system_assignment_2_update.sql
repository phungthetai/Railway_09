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
FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID),
FOREIGN KEY (Position_ID) REFERENCES `Position`(Position_ID)
);

-- create table: Group
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
Group_ID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Group_Name			VARCHAR(50) NOT NULL UNIQUE KEY,
Creator_ID			TINYINT UNSIGNED,
CreateDate			DATETIME DEFAULT NOW(),
FOREIGN KEY(Creator_ID) REFERENCES `Account`(Account_ID)
);

-- create table: GroupAccount
DROP TABLE IF EXISTS `GroupAccount`;
CREATE TABLE `GroupAccount`(
Group_ID			TINYINT UNSIGNED NOT NULL,
Account_ID			TINYINT UNSIGNED NOT NULL,
JoinDate			DATETIME DEFAULT NOW(),
PRIMARY KEY(Group_ID,Account_ID),
FOREIGN KEY(Group_ID) REFERENCES `Group`(Group_ID),
FOREIGN KEY(Account_ID) REFERENCES `Account`(Account_ID)	
);

-- create table: TypeQuestion
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion(
Type_ID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Type_Name			ENUM('Essay','Multiple-Choice') NOT NULL 
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
Type_ID				TINYINT UNSIGNED NOT NULL,
Creator_ID			TINYINT UNSIGNED NOT NULL,
CreateDate			DATETIME DEFAULT NOW(),
FOREIGN KEY(Category_ID) REFERENCES CategoryQuestion(Category_ID),
FOREIGN KEY(Type_ID) REFERENCES TypeQuestion(Type_ID),
FOREIGN KEY(Creator_ID) REFERENCES `Account`(Account_ID)
);

-- create table: Answer
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
Answer_ID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content				NVARCHAR(100) NOT NULL,
Question_ID			TINYINT UNSIGNED,
isCorrect			BIT DEFAULT 1,
FOREIGN KEY(Question_ID) REFERENCES Question(Question_ID)
);

-- create table: Exam
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
Exam_ID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`Code`				VARCHAR(20) NOT NULL,
Title				VARCHAR(100),
Category_ID			TINYINT UNSIGNED NOT NULL,
Duration			TINYINT UNSIGNED NOT NULL,
Creator_ID			TINYINT UNSIGNED NOT NULL,
CrateDate			DATETIME DEFAULT NOW(),
FOREIGN KEY(Category_ID) REFERENCES CategoryQuestion(Category_ID),
FOREIGN KEY(Creator_ID) REFERENCES `Account`(Account_ID)
);

-- create table: ExamQuestion
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
Exam_ID				TINYINT UNSIGNED NOT NULL,
Question_ID			TINYINT UNSIGNED NOT NULL,	
PRIMARY KEY(Exam_ID, Question_ID),
FOREIGN KEY(Exam_ID) REFERENCES Exam(Exam_ID),
FOREIGN KEY(Question_ID) REFERENCES Question(Question_ID)
);

/*====================================================INSERT DATA=====================================================*/
-- add data Department
INSERT INTO Department(Department_Name)
VALUES       		('Bảo vệ'		),
					('Kĩ thuật'		),
                    ('Thư kí'		),
                    ('Tài chính'	),
                    ('Giám đốc'		),
					('Bán Hàng'		),
                    ('Sale'			);
                    
-- add data Position                    
INSERT INTO `Position`(Position_Name)
VALUES				(   'Dev'			),
                    (   'Test'			),
                    (   'Scrum Master'  ),
                    (   'PM'			);
                    
                    

-- add data Account
INSERT INTO `Account`( Email,							 Username,			 FullName,					 Department_ID,	 Position_ID,  	CreateDate)
VALUES 				('tranxuanquy@gmail.com'			, 'Quy123'				, 'Trần Xuân Quý'			, '1'			, '1'		 ,	'2021-03-28'),
					('nguyenthinhung@gmail.com'			, 'Nhung123'			, 'Nguyễn Thị Nhung'		, '2'			, '2'		 ,	'2021-03-28'),
                    ('nguyentuantu@gmail.com'			, 'Tu1234'				, 'Nguyễn Tuấn Tú'			, '3'			, '4'		 ,	'2021-03-28'),
                    ('doanvanngoc@gmail.com'			, 'Ngoc123'				, 'Đoàn Văn Ngọc'			, '4'			, '3'		 ,	'2021-03-28'),
                    ('phambangbang@gmail.com'			, 'Băng123'				, 'Phạm Băng Băng'			, '5'			, '2'		 ,	'2021-03-28'),
                    ('lexuanhai@gmail.com'				, 'Hai123'				, 'LÊ XUÂN HẢI'				, '6'			, '1'		 ,	'2021-03-28'),
                    ('phungdiemhanh@gmail.com'			, 'Hanh123'				, 'Phùng Diễm Hạnh'  		, '7'			, '3'		 ,  '2021-03-28');
                    
  
         
-- add data Group         
INSERT INTO `Group`( Group_Name						, Creator_ID			, CreateDate)
VALUES			( 'Railway09'						, '1'				,  '2021-03-28' ),
				( 'Railway10'						, '2'				,  '2021-03-28' ),
                ( 'Railway11'						, '3'				,  '2021-03-28' ),
                ( 'Railway12'						, '4'				,  '2021-03-28' ),
                ( 'Railway13'						, '5'				,  '2021-03-28' ),
                ( 'Railway14'						, '6'				,  '2021-03-28' ),
				( 'Railway15'						, '7'				,  '2021-03-28' );


-- add data GroupAccount
INSERT INTO GroupAccount(Group_ID			, Account_ID				, JoinDate )
VALUES					('1'				,'1'					,'2021-03-28' ),
						('2'				,'2'					,'2021-03-28' ),
						('3'				,'3'					,'2021-03-28' ),
						('4'				,'5'					,'2021-03-28' ),
						('5'				,'5'					,'2021-03-28' ),
                        ('6'				,'6'					,'2021-03-28' ),
						('7'				,'7'					,'2021-03-28' );
                        
                        
-- add data TypeQuestion
INSERT INTO TypeQuestion(Type_Name)
VALUES 					( 'Essay'           ),
						( 'Multiple-Choice' ),
                        ( 'Multiple-Choice' ),
                        ( 'Essay'           ),
                        ( 'Multiple-Choice' ),
                        ( 'Essay' 	        ),
                        ( 'Multiple-Choice' );
                        
                        
-- add data CategoryQuestion
INSERT INTO CategoryQuestion( Category_Name )
VALUES						( 'Java'	),
							( 'SQL'		),
                            ( 'Postman' ),
                            ( 'Ruby' 	),
                            ( 'NET' 	),
                            ( 'PHP' 	),
                            ( 'C++'	 	);
                            
                            
-- add data Question
INSERT INTO Question( Content			, Category_ID			, Type_ID			, Creator_ID		, CreateDate )         
VALUES				('Câu hỏi Java'		,'1'					,'1'				,'3'				,'2021-03-28'),
					('Câu hỏi SQL'		,'4'					,'2'				,'7'				,'2021-03-28'),
                    ('Câu hỏi NET'		,'7'					,'1'				,'1'				,'2021-03-28'),
                    ('Câu hỏi Ruby'		,'2'					,'2'				,'4'				,'2021-03-28'),
                    ('Câu hỏi Postman'	,'3'					,'2'				,'2'				,'2021-03-28'),
                    ('Câu hỏi PHP'		,'5'					,'1'				,'5'				,'2021-03-28'),
                    ('Câu hỏi C++'		,'6'					,'2'				,'6'				,'2021-03-28');
                    
                    
-- add data Answer
INSERT INTO Answer(Content		 			,	Question_ID			, isCorrect)
VALUES			  ('là ngôn ngữ'			,	'1'					,	0		),
				  ('SQL là ngôn ngữ'		,   '2'					,	1		),
                  ('NET là ngôn ngữ'		,	'3'					,	1		),
                  ('Ruby là ngôn ngữ'		,	'4'					,	0		),
                  ('Postman là ngôn ngữ'	,	'5'					,	1		),
                  ('PHP là ngôn ngữ'		,	'6'					,	0		),
                  ('C++ là ngôn ngữ'		,	'7'					,	1		);

-- add data Exam
INSERT INTO Exam(`Code`			, Title				, Category_ID			, Duration			, Creator_ID )
VALUES			('VTI101'		,'Đề thi Java'		, '1'					,'90'				,   '1'		),
				('VTI102'		,'Đề thi PHP'		, '5'					,'60'				,	'2'		),
                ('VTI103'		,'Đề thi C++'		, '7'					,'90'				,	'3'		),
                ('VTI104'		,'Đề thi Postman'	, '2'					,'90'				,	'4'		),
                ('VTI105'		,'Đề thi NET'		, '6'					,'120'				,	'5'		),
                ('VTI106'		,'Đề thi Ruby'		, '3'					,'90'				,	'6'		),
                ('VTI107'		,'Đề thi SQL'		, '4'					,'60'				,	'7'		);
                
                
-- add data ExamQuestion
INSERT INTO ExamQuestion(Exam_ID		,Question_ID)
VALUES					('7'			,'3'),
						('3'			,'5'),
                        ('1'			,'2'),
                        ('4'			,'1'),
                        ('2'			,'7'),
                        ('6'			,'4'),
                        ('5'			,'6');
                        
                
                            
					