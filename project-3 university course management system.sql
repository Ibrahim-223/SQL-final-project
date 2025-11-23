create database university_course_management_system;
use university_course_management_system;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(30),
    LastName VARCHAR(30),
    Email VARCHAR(50),
    BirthDate DATE,
    EnrollmentDate DATE
);

INSERT INTO Students VALUES
(1, 'Amit', 'Shah', 'amit.shah@gmail.com', '2003-05-12', '2022-07-01'),
(2, 'Riya', 'Patel', 'riya.patel@gmail.com', '2004-02-20', '2022-07-01'),
(3, 'John', 'Doe', 'john.doe@gmail.com', '2002-11-15', '2021-06-15'),
(4, 'Sara', 'Khan', 'sara.khan@gmail.com', '2003-09-10', '2022-01-10'),
(5, 'Vivek', 'Singh', 'vivek.singh@gmail.com', '2001-03-25', '2021-06-15'),
(6, 'Pooja', 'Mehta', 'pooja.mehta@gmail.com', '2004-07-18', '2022-07-01'),
(7, 'Rahul', 'Yadav', 'rahul.yadav@gmail.com', '2002-12-05', '2021-06-15'),
(8, 'Kajal', 'Rathod', 'kajal.rathod@gmail.com', '2003-04-22', '2022-03-12'),
(9, 'Aditya', 'Verma', 'aditya.verma@gmail.com', '2001-08-30', '2021-06-15'),
(10, 'Sneha', 'Purohit', 'sneha.purohit@gmail.com', '2004-01-08', '2022-07-01'),
(11, 'Mohan', 'Joshi', 'mohan.joshi@gmail.com', '2002-10-17', '2021-06-15'),
(12, 'Nisha', 'Trivedi', 'nisha.trivedi@gmail.com', '2003-06-11', '2022-07-01');

select * from Students;

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    DepartmentID INT,
    Credits INT
);

INSERT INTO Course VALUES
(101, 'Database Systems', 1, 4),
(102, 'Data Structures', 1, 4),
(103, 'Marketing Basics', 2, 3),
(104, 'Accounting 1', 2, 3),
(105, 'Thermodynamics', 3, 4),
(106, 'Machine Drawing', 3, 3),
(107, 'Circuit Theory', 4, 4),
(108, 'Digital Electronics', 4, 3);
select * from Course;

CREATE TABLE Instructor (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(30),
    LastName VARCHAR(30),
    Email VARCHAR(50),
    DepartmentID INT
);

INSERT INTO Instructor VALUES
(201, 'Raj', 'Malhotra', 'raj.m@gmail.com', 1),
(202, 'Meera', 'Dave', 'meera.d@gmail.com', 1),
(203, 'Arun', 'Saxena', 'arun.s@gmail.com', 2),
(204, 'Priya', 'Nair', 'priya.n@gmail.com', 2),
(205, 'Nilesh', 'Patel', 'nilesh.p@gmail.com', 3),
(206, 'Anita', 'Kamble', 'anita.k@gmail.com', 4);
select * from Instructor;

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

INSERT INTO Enrollment VALUES
(1, 1, 101, '2022-07-05'),
(2, 2, 101, '2022-07-06'),
(3, 3, 102, '2021-06-20'),
(4, 4, 103, '2022-01-15'),
(5, 5, 104, '2021-07-01'),
(6, 6, 102, '2022-07-02'),
(7, 7, 105, '2021-06-18'),
(8, 8, 106, '2022-03-15'),
(9, 9, 107, '2021-06-25'),
(10, 10, 108, '2022-07-03'),
(11, 11, 104, '2021-06-20'),
(12, 12, 103, '2022-07-05');
select * from Enrollment;

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Business Management'),
(3, 'Mechanical Engineering'),
(4, 'Electrical Engineering');
select * from Department;

insert into Students values
(13, 'Sufi', 'Shaikh', 'sufi.shaikh@gmail.com', '2000-01-18', '2019-02-11');
set sql_safe_updates = 1;
update Students
set FirstName = 'Saif'
where StudentId = 13;

select * from Students;

delete from Students
where StudentId = 13;

select 
FirstName,
EnrollmentDate
from Students
where EnrollmentDate > '2021-12-31' ;

select * from Course
where CourseName like 'd%';

SELECT CourseID, COUNT(StudentID) AS TotalStudents
FROM Enrollment
GROUP BY CourseID
HAVING COUNT(StudentID) > 1;

SELECT * FROM Course
WHERE CourseName = 'Database Systems' 
   AND CourseName = 'Data Structures';

SELECT * FROM Course
WHERE CourseName = 'Database Systems' 
   OR CourseName = 'Data Structures';
   
select avg(credits) as Averagecredit
from Course;

ALTER TABLE Instructor ADD Salary INT;

SELECT MAX(Salary) AS MaxSalary
FROM Instructor
WHERE DepartmentID = 1;

SELECT d.DepartmentName, COUNT(e.StudentID) AS TotalStudents
FROM Department d
JOIN Course c ON d.DepartmentID = c.DepartmentID
JOIN Enrollment e ON c.CourseID = e.CourseID
GROUP BY d.DepartmentName;

select * from Students;
select * from Course;

SELECT s.FirstName, s.LastName, c.CourseName
FROM Students s
INNER JOIN Enrollment e ON s.StudentID = e.StudentID
INNER JOIN Course c ON e.CourseID = c.CourseID;

SELECT s.FirstName, s.LastName, c.CourseName
FROM Students s
LEFT JOIN Enrollment e ON s.StudentID = e.StudentID
LEFT JOIN Course c ON e.CourseID = c.CourseID;

SELECT StudentID
FROM Enrollment
WHERE CourseID IN (
    SELECT CourseID
    FROM Enrollment
    GROUP BY CourseID
    HAVING COUNT(StudentID) > 2
);

select
EnrollmentDate,
year(EnrollmentDate) as EnrollmentYear
from Students;

select 
FirstName,
LastName,
concat(FirstName, ' ', LastName) as FullName from Instructor;

SELECT 
    EnrollmentID,
    StudentID,
    CourseID,
    SUM(1) OVER (ORDER BY EnrollmentID) AS RunningTotal
FROM Enrollment;

SELECT 
    FirstName,
    LastName,
    EnrollmentDate,
    CASE 
        WHEN TIMESTAMPDIFF(YEAR, EnrollmentDate, CURDATE()) > 3 
        THEN 'Senior'
        ELSE 'Junior'
    END AS StudentLevel
FROM Students;

