create table Subject(
SubjectID char(10) primary key,
SubjectName varchar(40),
Units varchar(20));

create table Class(
ClassID char(10) primary key,
ClassName varchar(40),
ClassYear varchar(20));

create table Student(
StudentID char(10) primary key,
StudentName varchar(40),
StudentAddress varchar(20),
ClassID char(10)
foreign key(ClassID) references Class(ClassID));

create table StudentGrades(
StudentID char(10),
SubjectID char(10),
Grades int,

foreign key(StudentID) references Student(StudentID),
foreign key(SubjectID) references Subject(SubjectID),
  PRIMARY KEY (StudentID, SubjectID)
);
alter table StudentGrades
alter column Grades float

-- Insert data into Subject

INSERT INTO Subject (SubjectID, SubjectName, Units)
VALUES 
('S01', 'Mathematics', '3'),
('S02', 'Physics', '4'),
('S03', 'Chemistry', '3'),
('S04', 'Computer Science', '4'),
('S05', 'Biology', '2');

-- Insert data into Class
INSERT INTO Class (ClassID, ClassName, ClassYear) 
VALUES 
('C01', '20KTMT1', '2022'),
('C02', '23KHDL3', '2023'),
('C03', '21PFIEV3','2023');

-- Insert data into Student

INSERT INTO Student (StudentID, StudentName, StudentAddress, ClassID)
VALUES
('T01', 'Alice', 'Address1', 'C01'),
('T02', 'Bob', 'Address2', 'C01'),
('T03', 'Charlie', 'Address3', 'C01'),
('T04', 'David', 'Address4', 'C01'),
('T05', 'Eve', 'Address5', 'C01'),
('T06', 'Frank', 'Address6', 'C02'),
('T07', 'Grace', 'Address7', 'C02'),
('T08', 'Hannah', 'Address8', 'C02'),
('T09', 'Ivy', 'Address9', 'C02'),
('T10', 'Jack', 'Address10', 'C02'),
('T11', 'Kate', 'Address11', 'C03'),
('T12', 'Leo', 'Address12', 'C03'),
('T13', 'Mia', 'Address13', 'C03'),
('T14', 'Noah', 'Address14', 'C03'),
('T15', 'Olivia', 'Address15', 'C03'),
('T16', 'Paul', 'Address16', 'C01'),
('T17', 'Quinn', 'Address17', 'C02'),
('T18', 'Ruby', 'Address18', 'C03'),
('T19', 'Sophia', 'Address19', 'C01'),
('T20', 'Tom', 'Address20', 'C03');


-- Insert data into StudentGrades
INSERT INTO StudentGrades (StudentID, SubjectID, Grades)
VALUES
-- Student 1
('T01', 'S01', 85),
('T01', 'S02', 78),
('T01', 'S03', 92),

-- Student 2
('T02', 'S01', 88),
('T02', 'S04', 75),

-- Student 3
('T03', 'S01', 90),
('T03', 'S05', 83),

-- Student 4
('T06', 'S02', 79),
('T06', 'S03', 80),

-- Student 5
('T07', 'S04', 95),

-- Student 6
('T10', 'S05', 82),

-- Student 7
('T12', 'S01', 88),
('T12', 'S02', 90),

-- Student 8
('T13', 'S03', 76),

-- Student 9
('T15', 'S01', 92),
('T15', 'S02', 85),

-- Student 10
('T20', 'S05', 89);


--Show Students of class ID = "C02".
select * from Student
where ClassID in (select ClassID where ClassID = 'C02');

--Show Students of class name = "22PFIEV3".
select * from Student
join Class on Student.ClassID = Class.ClassID
where ClassName = '21PFIEV3';

--Show Students (All information) of class year = "2020-2024"
select * from Student
join Class on Student.ClassID = Class.ClassID
where ClassYear Between 2020 and 2024;

--Show Subject name and units of the Subject ID = “S01”.
select SubjectName, Units from Subject
where SubjectID = 'S01';

-- Grades of Subject ID = "S02" of Student ID = "T06"
select SubjectID,StudentID from StudentGrades
where SubjectID = 'S02' and StudentID = 'T06';

-- Find Subject (ID, Name and Grades) that Student ID = "T02" fail.
select StudentGrades.SubjectID, SubjectName, Grades from StudentGrades
join Subject on StudentGrades.SubjectID = Subject.SubjectID  
where StudentID not like 'T02';

--Show all the Subject (*) that Student ID = "T03" never took the exam
select * from Subject
where SubjectID not in ( select StudentID from StudentGrades where StudentID = 'T03');

---Number of Students for each class.
select  ClassID, count(StudentID) as Number_of_students  from Student
group by ClassID;

--Find the classes with the largest number of students.
select top 1  ClassID, count(StudentID) as Number_of_students  from Student
group by ClassID
order by Number_of_students desc;

--GPA (grade point average) of student ID = "T02".
select avg(Grades) as GPA from StudentGrades
where StudentID = 'T02';

--GPA for each student.
select StudentID, avg(Grades) as GPA from StudentGrades
where StudentID like 'T%'
group by StudentID;

--GPA of class ID = "C02".
select Student.StudentID, avg(Grades) as GPA from StudentGrades
join Student on StudentGrades.StudentID = Student.StudentID
where  ClassID = 'C02'
group by Student.StudentID;

--GPA for each class.
select Student.ClassID, avg(Grades) as GPA from StudentGrades
join Student on StudentGrades.StudentID = Student.StudentID
where  ClassID LIKE 'C%'
group by Student.ClassID;

--Find students have the largest GPA.
select top 1 StudentID, avg(Grades) as GPA from StudentGrades
where StudentID like 'T%'
group by StudentID;

 --15. Find students (ID and Name) have the largest gpa
select top 1 Student.StudentID, Student.StudentName, avg(Grades) as GPA from StudentGrades
join Student on StudentGrades.StudentID =Student.StudentID
where Student.StudentID like 'T%'
group by Student.StudentID, Student.StudentName

--Find classes (ID and Name) have the largest GPA.
select top 1 Student.ClassID, Class.ClassName, round(avg(Grades),2) as GPA from StudentGrades
join Student on StudentGrades.StudentID = Student.StudentID
join Class on Student.ClassID = Class.ClassID
where  class.ClassID LIKE 'C%'
group by Student.ClassID,Class.ClassName ;

--GPA with weight for each student
select StudentGrades.StudentID, round(sum(Grades* cast(units as float))/sum(cast(units as float)),2) as GPA from StudentGrades
join Subject on StudentGrades.SubjectID = Subject.SubjectID
where StudentID like 'T%'
group by StudentID;

--GPA with weight for each student (ID and name)
select Student.StudentID, Student.StudentName, round(sum(Grades* cast(units as float))/sum(cast(units as float)),2) as GPA from StudentGrades
join Subject on StudentGrades.SubjectID = Subject.SubjectID
join Student on StudentGrades.StudentID = Student.StudentID
where Student.StudentID like 'T%'
group by Student.StudentID, Student.StudentName;

--GPA with weight for each class.
select classID, round(sum(Grades* cast(units as float))/sum(cast(units as float)),2) as GPA from StudentGrades
join Subject on StudentGrades.SubjectID = Subject.SubjectID
join Student on StudentGrades.StudentID = Student.StudentID
where ClassID like 'C%'
group by ClassID;
