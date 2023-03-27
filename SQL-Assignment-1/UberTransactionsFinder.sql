-- 4. Assume you are given table below on Uber transactions made by users. Write a query to 
-- obtain the third transaction of every user. Output the user id, spend and transaction date.

USE testDb;
CREATE TABLE transactions
(
user_id int not null,
spend float not null,
transaction_date date
)

INSERT INTO transactions VALUES 
(111,150.50,'02/07/2022 12:00:00'), 
(111,100.50,'01/08/2022 12:00:00'),
(111,55.00,'01/10/2022 12:00:00'),
(121,36.00,'01/18/2022 12:00:00'),
(145,24.99,'01/26/2022 12:00:00'),
(111,89.60,'02/05/2022 12:00:00')


-- This below query returns the latest uber transaction
SELECT TOP 1 * 
FROM transactions WHERE transaction_date in 
	(SELECT transaction_date FROM transactions 
		WHERE user_id = 
		(SELECT user_id FROM transactions GROUP BY user_id HAVING count(transaction_date) >= 3))

-- Solution
SELECT * 
FROM 
	(SELECT *, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY transaction_date ASC) AS transaction_row 
	FROM transactions) AS t 
	WHERE t.transaction_row = 3


