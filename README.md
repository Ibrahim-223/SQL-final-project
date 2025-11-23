
# University Course Management System

This project contains a complete SQL-based University Course Management System with 5 main tables:

1. Students
2. Course
3. Instructor
4. Enrollment
5. Department

All tables are linked using Primary Keys and Foreign Keys.

---

# Database & Table Creation

The database created:

```sql
CREATE DATABASE university_course_management_system;
USE university_course_management_system;
```

Tables created:  
- Students  
- Course  
- Instructor  
- Enrollment  
- Department  

All inserts and sample data are included.

---

# CRUD Operations

# Add (INSERT)
```sql
INSERT INTO Students VALUES
(13, 'Sufi', 'Shaikh', 'sufi.shaikh@gmail.com', '2000-01-18', '2019-02-11');
```

#  Update
```sql
UPDATE Students
SET FirstName = 'Saif'
WHERE StudentId = 13;
```

# Delete
```sql
DELETE FROM Students
WHERE StudentId = 13;
```

#  Retrieve (SELECT)
```sql
SELECT * FROM Students;
```

---

# Queries Performed

# 1️ Retrieve students who enrolled after 2021
```sql
SELECT FirstName, EnrollmentDate
FROM Students
WHERE EnrollmentDate > '2021-12-31';
```

# 2️ Retrieve courses starting with letter 'D'
```sql
SELECT * FROM Course
WHERE CourseName LIKE 'd%';
```

# 3️ Count students per course (more than 1)
```sql
SELECT CourseID, COUNT(StudentID) AS TotalStudents
FROM Enrollment
GROUP BY CourseID
HAVING COUNT(StudentID) > 1;
```

# 4️ Retrieve Database Systems OR Data Structures
```sql
SELECT * FROM Course
WHERE CourseName IN ('Database Systems', 'Data Structures');
```

# 5️ Average credits of all courses
```sql
SELECT AVG(Credits) AS AverageCredit
FROM Course;
```

# 6️ Add Salary column to Instructor table
```sql
ALTER TABLE Instructor ADD Salary INT;
```

# 7️ Maximum salary in Computer Science dept
```sql
SELECT MAX(Salary) AS MaxSalary
FROM Instructor
WHERE DepartmentID = 1;
```

# 8️ Count students in each department
```sql
SELECT d.DepartmentName, COUNT(e.StudentID) AS TotalStudents
FROM Department d
JOIN Course c ON d.DepartmentID = c.DepartmentID
JOIN Enrollment e ON c.CourseID = e.CourseID
GROUP BY d.DepartmentName;
```

# 9️ INNER JOIN: Students + Courses
```sql
SELECT s.FirstName, s.LastName, c.CourseName
FROM Students s
INNER JOIN Enrollment e ON s.StudentID = e.StudentID
INNER JOIN Course c ON e.CourseID = c.CourseID;
```

# LEFT JOIN: All students + courses (if enrolled)
```sql
SELECT s.FirstName, s.LastName, c.CourseName
FROM Students s
LEFT JOIN Enrollment e ON s.StudentID = e.StudentID
LEFT JOIN Course c ON e.CourseID = c.CourseID;
```

# Subquery: Courses with more than 2 students
```sql
SELECT StudentID
FROM Enrollment
WHERE CourseID IN (
    SELECT CourseID
    FROM Enrollment
    GROUP BY CourseID
    HAVING COUNT(StudentID) > 2
);
```

#  Extract year from enrollment date
```sql
SELECT EnrollmentDate, YEAR(EnrollmentDate) AS EnrollmentYear
FROM Students;
```

#  Instructor full name using CONCAT
```sql
SELECT FirstName, LastName, CONCAT(FirstName, ' ', LastName) AS FullName 
FROM Instructor;
```
## Running total of enrollments
```sql
SELECT 
    EnrollmentID,
    StudentID,
    CourseID,
    SUM(1) OVER (ORDER BY EnrollmentID) AS RunningTotal
FROM Enrollment;
```

# Label students as Senior / Junior
```sql
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


#  Project Includes:
 Complete Database Setup  
 12+ Inserted Records in Each Table  
 CRUD Operations  
 Joins  
 Subqueries  
 Aggregate Functions  
 Window Functions  
 Case Conditions  

---

##  Author
Ibrahim Ansari  
University Course Management System – SQL Project
