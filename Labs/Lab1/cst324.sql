--Create database Faculty;
--Go
use JihyukChung;
Go
Create table ProfRank
(
	ProfRankID 		int 		constraint ProfRank_pk primary key,
	ProfRankName	nvarchar(30),
	Minimumm	 decimal(8,2),
	Maximum		 decimal(8,2)
);
create table dept
(
	DeptID		int		constraint Dept_pk primary key,
	DeptName	nvarchar(50)
);
Create table major
(
	MajorID		int		constraint Major_pk primary key,
	MajorName	nvarchar(40)
);

create table faculty
(
	FacultyID	int		constraint Faculty_pk primary key,
	FirstName	nvarchar(15),
	LastName	nvarchar(15),
	Phone		nvarchar(10),
	Salary		decimal(8, 2),
	Stipend		decimal(7, 2),
	Hiredate	date,
	SupervisorID	int		constraint Faculty_Faculty_fk references faculty(facultyID),
	DeptID		int		constraint Faculty_dept_fk references dept(deptID)
);

create table student
(
	StudentID	int		constraint student_pk primary key,
	FirstName	nvarchar(15),
	LastName	nvarchar(15),
	Phone		nvarchar(10),
	AdvisorID	int		constraint student_Faculty_fk references faculty(facultyID)
);
create table student_major
(
	MajorID		int		constraint Student_major_major_fk references major(majorid),
	StudentID	int		constraint Student_major_student_fk references student(studentid),
	constraint 	Student_majorpk primary key (majorid, studentid)
);
Insert into major values(1, 'Software Engineering Technology');
Insert into major values(2, 'Computer Engineering Technology');
Insert into major values(3, 'Applied Psychology');
Insert into major values(4, 'Communication Studies');

Insert into dept values(1, 'Computer Systems Engineering Technology')
Insert into dept values(2, 'Humanities and Social Science');
Insert into dept values(3, 'Communication');
Insert into dept values(4, 'Electronics Engineering Technology');

Insert into faculty values (1, 'Calvin', 'Caldwell', '885-1598', 33000.00, 3000.00, '15-sep-1986', Null, 1);
Insert into faculty values (2, 'Randy', 'Albert', '885-1596', 35000.00, 1500.00, '15-sep-1984', 1, 1);
Insert into faculty values (3, 'Ralph', 'Carestia', '885-1453', 37000.00, 1500.00,'5-Jan-1990', 1, 1);
Insert into faculty values (4, 'Todd', 'Breedlove', '885-1577',  23000.00, NULL,'15-sep-1999', 2, 1);
Insert into faculty values (5, 'Jamie', 'Zipay', '885-1543', 26000.00, NULL,'7-jan-2001', 3, 1);
Insert into faculty values (6, 'Phong', 'Nguyen', '885-1599', 25000.00, NULL,'15-sep-1999', 3, 1);
Insert into faculty values (7, 'Sherry', 'Yang', '885-1594', 27000.00, NULL,'15-sep-1997', 2, 1);
Insert into faculty values (8, 'Lynda', 'Baker', '885-1672', 38000.00, 3000.00, '15-sep-1989', Null, 2);
Insert into faculty values (9, 'Maria Lynn', 'Kessler', '885-1674', 26000.00, NULL, '15-sep-2003', 8, 2);
Insert into faculty values (10, 'John', 'Puckett', '885-1678', 39000.00, 3000.00, '15-sep-1989', Null, 3);
Insert into faculty values (11, 'Robin', 'Schwartz', '885-1398', 9000.00, NULL, '15-sep-1999', 10, 3);
Insert into faculty values (12, 'Jim', 'Long', '885-1580', 19500.00, NULL, '15-sep-2000', 2, 1);
Insert into faculty values (13, 'Tim', 'Stewart', '851-5160', 19000.00, NULL, '15-sep-2000', 2, 1);
Insert into faculty values (14, 'Leo', 'Dubray', '885-1492', 17000.00, NULL, '15-sep-2001', 8, 2);
Insert into faculty values (15, 'Michele', 'Malott', '885-1395', 6000.00, NULL, '15-sep-2005', 8, 2);

Insert into ProfRank values (1, 'Instructor', 00000.00, 10000.00);
Insert into ProfRank values (2, 'Assistant Professor', 10000.00, 20000.00);
Insert into ProfRank values (3, 'Associate Professor', 20000.00, 30000.00);
Insert into ProfRank values (4, 'Professor', 30000.00, 40000.00);

Insert into Student values (1, 'Paul', 'Scott', '882-1002', 1);
Insert into Student values (2, 'Chris', 'Ambiel', '883-1312', 13);
Insert into Student values (3, 'Jake', 'Brownson', '882-3424', 5);
Insert into Student values (4, 'Farhad', 'Shakiba', '884-1231', 5);
Insert into Student values (5, 'Allan', 'Snippen', '882-2342', 5);
Insert into Student values (6, 'Michael', 'Hart', '882-5464', 12);
Insert into Student values (7, 'Jonathan', 'Thibeau', '883-2342', 12);
Insert into Student values (8, 'Alberto', 'Martinez', '882-8796', 2);
Insert into Student values (9, 'Jeanie', 'King', '891-1234', 3);
Insert into Student values (10, 'Jason', 'Richards', '882-3456', 3);
Insert into Student values (11, 'Justin', 'Royse', '885-1111', 3);
Insert into Student values (12, 'Xinger', 'Yu', '883-2322', 2);
Insert into Student values (13, 'Storm', 'Dain', '885-3212', 13);
Insert into Student values (14, 'TJ', 'Atterberry', '883-1231', 12);
Insert into Student values (15, 'Roscoe', 'Casita', '883-1213', 4);
Insert into Student values (16, 'Shad', 'Cole', '882-3232', 4);
Insert into Student values (17, 'Luke', 'Goodale', '885-1002', 4);
Insert into Student values (18, 'Kyle', 'Spencer', '885-1012', 4);
Insert into Student values (19, 'Ed', 'Hudson', '882-1878', 7);
Insert into Student values (20, 'Scott', 'Ore', '883-9303', 7);
Insert into Student values (21, 'Ryan', 'McCarty', '884-1922', 6);
Insert into Student values (22, 'Devan', 'Stormont', '883-1999', 4);
Insert into Student values (23, 'Jeffrey', 'Bernt', '882-9999', 8);
Insert into Student values (24, 'Chris', 'Gheen', '883-3434', 8);
Insert into Student values (25, 'Cody', 'Zuschlag', '885-9654', 9);
Insert into Student values (26, 'Kevin', 'Wong', '883-1233', 9);
Insert into Student values (27, 'Andrew', 'Wilson', '885-2322', 10);
Insert into Student values (28, 'Jesse', 'Stafford', '882-2328', 10);
Insert into Student values (29, 'Kevin', 'Roberts', '882-1765', 14);
Insert into Student values (30, 'Tim', 'Clark', '882-8888', 2);

Insert into Student_major (studentid, majorid) values (1, 1);
Insert into Student_major (studentid, majorid) values (2, 1);
Insert into Student_major (studentid, majorid) values (3, 1);
Insert into Student_major (studentid, majorid) values (3, 2);
Insert into Student_major (studentid, majorid) values (4, 1);
Insert into Student_major (studentid, majorid) values (4, 2);
Insert into Student_major (studentid, majorid) values (5, 1);
Insert into Student_major (studentid, majorid) values (5, 2);
Insert into Student_major (studentid, majorid) values (6, 1);
Insert into Student_major (studentid, majorid) values (7, 1);
Insert into Student_major (studentid, majorid) values (8, 1);
Insert into Student_major (studentid, majorid) values (9, 2);
Insert into Student_major (studentid, majorid) values (10, 1);
Insert into Student_major (studentid, majorid) values (10, 2);
Insert into Student_major (studentid, majorid) values (11, 1);
Insert into Student_major (studentid, majorid) values (11, 2);
Insert into Student_major (studentid, majorid) values (12, 1);
Insert into Student_major (studentid, majorid) values (13, 1);
Insert into Student_major (studentid, majorid) values (14, 1);
Insert into Student_major (studentid, majorid) values (15, 1);
Insert into Student_major (studentid, majorid) values (16, 1);
Insert into Student_major (studentid, majorid) values (17, 1);
Insert into Student_major (studentid, majorid) values (18, 1);
Insert into Student_major (studentid, majorid) values (19, 1);
Insert into Student_major (studentid, majorid) values (20, 1);
Insert into Student_major (studentid, majorid) values (21, 2);
Insert into Student_major (studentid, majorid) values (22, 1);
Insert into Student_major (studentid, majorid) values (23, 3);
Insert into Student_major (studentid, majorid) values (24, 3);
Insert into Student_major (studentid, majorid) values (25, 3);
Insert into Student_major (studentid, majorid) values (26, 3);
Insert into Student_major (studentid, majorid) values (27, 4);
Insert into Student_major (studentid, majorid) values (28, 4);
Insert into Student_major (studentid, majorid) values (29, 4);
Insert into Student_major (studentid, majorid) values (30, 1);
