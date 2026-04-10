SELECT Name
FROM Student
WHERE Department_ID = (
    SELECT Department_ID
    FROM Student
    WHERE Student_ID = '701'
);
--2
SELECT Name
FROM Student
WHERE Gender = (
    SELECT Gender
    FROM Student
    WHERE Student_ID = '702'
);

--3
SELECT Name
FROM Student
WHERE Department_ID = (
    SELECT Department_ID
    FROM Student
    WHERE Student_ID = '703'
);
--4
SELECT Name
FROM Student
WHERE Department_ID IN (
    SELECT Department_ID
    FROM Student
    WHERE Gender = 'Female'
);

--5
SELECT Name
FROM Student
WHERE Student_ID IN (
    SELECT Student_ID
    FROM Enrollment
);
--6
SELECT Name
FROM Student
WHERE EXISTS (
    SELECT *
    FROM Enrollment
    WHERE Student.Student_ID = Enrollment.Student_ID
);

--7
SELECT Course_Name
FROM Course
WHERE Credits > (
    SELECT AVG(Credits)
    FROM Course
);

--8
SELECT Name
FROM Student
WHERE Student_ID > (
    SELECT AVG(Student_ID)
    FROM Student
);

--9
SELECT Department_ID
FROM Student
GROUP BY Department_ID
HAVING COUNT(*) > (
    SELECT AVG(COUNT(*))
    FROM Student
    GROUP BY Department_ID
);

--10
SELECT Name
FROM Student
WHERE Student_ID IN (
    SELECT Student_ID
    FROM Enrollment
);

--11
SELECT Name
FROM Student
WHERE Department_ID IN (
    SELECT Department_ID
    FROM Department
);
--12
SELECT Course_Name
FROM Course
WHERE Course_ID IN (
    SELECT Course_ID
    FROM Enrollment
);

--13
SELECT Course_Name
FROM Course
WHERE Credits = (
    SELECT MAX(Credits)
    FROM Course
);

--14
SELECT Name
FROM Student
WHERE Student_ID IN (
    SELECT Student_ID
    FROM Enrollment
    GROUP BY Student_ID
    HAVING COUNT(Course_ID) > 1
);

--15
SELECT Department_ID
FROM Student
GROUP BY Department_ID
HAVING COUNT(*) = (
    SELECT MAX(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM Student
        GROUP BY Department_ID
    ) t
);

--16
SELECT Name
FROM Student
WHERE Student_ID IN (
    SELECT Student_ID
    FROM Enrollment
    WHERE Course_ID IN (
        SELECT Course_ID
        FROM Enrollment
        WHERE Student_ID = '701'
    )
);
--17
SELECT Name
FROM Student
WHERE Student_ID NOT IN (
    SELECT Student_ID
    FROM Enrollment
);
--18
SELECT Course_Name
FROM Course
WHERE Course_ID NOT IN (
    SELECT Course_ID
    FROM Enrollment
);
/Users/dheerajkumarsingh/c++/SQL/Assignment_7_Solution.sql