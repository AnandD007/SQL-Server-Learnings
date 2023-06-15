-- 3. Write a query to get the number of compines that have posted duplicate job listings. 
-- clarification: Duplicate job listings refer to two jobs at teh same company with the 
-- same title and description.

USE testDb;
DROP TABLE job_listings;
CREATE TABLE job_listings
(
job_id int primary key,
company_id int not null,
title varchar(50) not null,
descriptions varchar(800)
)

INSERT INTO job_listings(job_id, company_id, title, descriptions) VALUES 
(249, 827, 'Business Analyst', 'Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organizations.'), 
(248, 827, 'Business Analyst', 'Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organizations.'), 
(250, 827, 'Software Developer', 'Software developer develops the robust software for the organisation.'), 
(149, 845, 'Business Analyst', 'Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organizations.'), 
(945, 345, 'Data Analyst', 'Data analyst reviews data to identify key insights into a businesses customers and ways the data can be used to solve problems.'), 
(164, 345, 'Data Analyst', 'Data analyst reviews data to identify key insights into a businesses customers and ways the data can be used to solve problems.'), 
(172, 244, 'Data Engineer', 'Data engineer works in a variety of settings to build systems that collect, manage, and convert raw data into usable information for data scientists and business analysts to interpret.')

-- Solution
SELECT company_id, title, descriptions
FROM job_listings 
GROUP BY company_id , title, descriptions
HAVING COUNT(title) > 1 AND COUNT(descriptions) > 1
