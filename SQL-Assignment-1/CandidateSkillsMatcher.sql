-- 1. Given a table candidates and their skills,you're tasked with 
-- finding the candidates best suited for an open .Net MVC developer job.
-- You want to find candidates who are proficient in C#, MVC, and SQL.
-- 
-- Write a query to list the candidates who posses all of the required
-- skills for the job. Sort the output by candidate Id in ascending order.
USE testDb;

CREATE TABLE candidate
(
candidate_id int not null,
skill varchar(50) not null
);

INSERT INTO candidate VALUES 
(001, 'C++'), 
(001, 'C#'), 
(001, 'MVC'), 
(001, 'SQL'), 
(145, 'MVC'), 
(145, 'PowerBI'), 
(145, 'SQL'), 
(345, 'C#'), 
(345, 'MVC'), 
(200, 'SQL');

-- Returns the total matched skills for specific candidate:
SELECT candidate_id, COUNT(DISTINCT skill) as total_matched_skills 
FROM candidate 
WHERE skill IN('SQL','MVC','C#') 
GROUP BY candidate_id 
ORDER BY candidate_id ASC;

-- Solution:
SELECT candidate_id 
FROM candidate 
WHERE skill in ('SQL','C#','MVC') 
GROUP BY candidate_id 
HAVING COUNT(DISTINCT skill) = 3 
ORDER BY candidate_id ASC;

