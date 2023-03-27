-- 2. Assume you are given the tables below about instagram pages and page likes. Write query
-- to return the page IDs of all the instagram pages that don't have any likes. 
-- The output be in ascending order.
USE testDb;

CREATE TABLE instagram_pages
(
page_id int primary key,
page_name nvarchar(100) not null
)

CREATE TABLE instagram_page_like_logs
(
user_id int primary key, -- if the user is already liked it and after he unliked and then he liked it again, so that time the date column is modified
page_id int not null references instagram_pages(page_id),
liked_date date not null 
)

INSERT INTO instagram_pages VALUES 
(20002,'SQL Solutions'), 
(20001,'SQL Solutions'), 
(20045,'Brain Exercise'), 
(20701,'Tips for Data Analysts')

-- Solution
SELECT pages.page_id 
FROM instagram_pages AS pages 
LEFT JOIN instagram_page_like_logs AS page_likes
ON pages.page_id = page_likes.page_id 
WHERE page_likes.page_id IS NULL 
ORDER BY pages.page_id ASC

