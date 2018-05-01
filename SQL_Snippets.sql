-----------------------------------------Find all tables with column name

SELECT      c.name  AS 'ColumnName'
            ,t.name AS 'TableName'
FROM        sys.columns c
JOIN        sys.tables  t   ON c.object_id = t.object_id
WHERE       c.name LIKE '%MyName%'
ORDER BY    TableName
            ,ColumnName;
            
    
    
------------------------------------------Get table attributes        
    SELECT 
    c.name 'Column Name',
    t.Name 'Data type',
    c.max_length 'Max Length',
    c.precision ,
    c.scale ,
    c.is_nullable,
    ISNULL(i.is_primary_key, 0) 'Primary Key'
FROM    
    sys.columns c
INNER JOIN 
    sys.types t ON c.user_type_id = t.user_type_id
LEFT OUTER JOIN 
    sys.index_columns ic ON ic.object_id = c.object_id AND ic.column_id = c.column_id
LEFT OUTER JOIN 
    sys.indexes i ON ic.object_id = i.object_id AND ic.index_id = i.index_id
WHERE
    c.object_id = OBJECT_ID('City')
    
--------------------------------------------Select only even numbers

SELECT * FROM Orders where OrderID % 2 = 0;


--------------------------------------------Find Duplicates

SELECT
    name, email, COUNT(*)
FROM
    users
GROUP BY
    name, email
HAVING 
    COUNT(*) > 1
    
-------------------------------------------Find diff in count of    

Declare @D int;
Declare @N int;

Select  @D = count(city)  from station;
Select  @N = count(distinct(city)) from station;

select (@D - @N)

--------------------------------------------Select in Select Fields
use [PracticeCamp]
Select 
 Distinct(Name),
 Marks,
 Grade = (select Distinct(Grade) from grades where Marks between min_mark and max_mark)
from students,grades
order by marks DESC, Name Asc

---------------------------------------------Select into temp # table this is stored in temp table and can be used between proc calls local to session--------------
use [PracticeCamp]
Select 
Distinct(Name),
Marks,
Grade = (select Distinct(Grade) from grades where Marks between min_mark and max_mark)
Into #TempStudents
from students,grades
order by marks DESC, Name Asc


SELECT 
Case WHEN #TempStudents.Grade < 7
 THEN Null
 ELSE name
 END as Name,
 marks,
 grade
FROM #TempStudents

Drop Table #TempStudents

---------------------------------------------Insert Into @ Table Variable also stored in temp table but local to current batch query window---------------------\
---------------------------------------------Table variables can be passed as parameters to diff SP don't need to drop it--------------------------------------
use [PracticeCamp]
Declare @tmpStudentsTbl table(Name nvarchar(20),Marks int, Grade int)

Insert @tmpStudentsTbl
Select 
Distinct(Name),
Marks,
Grade = (select Distinct(Grade) from grades where Marks between min_mark and max_mark)
from students,grades
order by marks DESC, Name Asc


SELECT 
Case WHEN Grade < 7
 THEN Null
 ELSE name
 END as Name,
 marks,
 grade
FROM @tmpStudentsTbl


--------------------------------------------------------Derived Table--------------------------------
use [PracticeCamp]
SELECT 
	Case WHEN Grade < 7 THEN Null ELSE name END as Name,
	Marks,
	Grade
	from
	(
			--This is the derived tbl
			Select 
			Distinct(Name),
			Marks,
			Grade = (select Distinct(Grade) from grades where Marks between min_mark and max_mark)
			from students,grades
	)
	as ShapedStudentsTbl
	order by Marks DESC, Name Asc


	------------------------------Common Table Expression--------------------------------------------------
	--A CTE is a temporary result set that can be referenced within a select,insert,update or delete statement, that Immediately follows the CTE
	-- SYNTAX
	-- WITH cte_name(col1, col2, col3...)
	-- AS (cte_query)

	use [LibraryManagementSystem];

	WITH Shaped_Patron_Branch(FirstName,LastName,BranchName,StartDate,Duration)
	as
	(
		Select FirstName,
		LastName,
		Name as BranchName,
		CONVERT(nvarchar(8),OpenDate,110)  as StartDate,
		CONVERT(nvarchar(2),DATEDIFF(year, OpenDate, GetDate())) + ' YEARS(s)' AS Duration 
		from Patrons
		inner join LibraryBranches on Patrons.HomeLibraryBranchId = LibraryBranches.Id
	)
	Select * from Shaped_Patron_Branch
	Group by BranchName,StartDate,LastName,FirstName,Duration
	order by BranchName,LastName