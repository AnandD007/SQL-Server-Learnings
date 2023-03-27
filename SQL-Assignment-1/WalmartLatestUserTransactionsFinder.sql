-- 6.  

USE testDb;
CREATE TABLE walmart_transactions
(
product_id int not null,
user_id int not null,
spend float not null,
transaction_date date
)

INSERT INTO walmart_transactions VALUES 
(3673, 123, 68.90, '07/08/2022 12:00:00'), 
(9623, 123, 274.10, '07/08/2022 12:00:00'), 
(1467, 115, 18.90, '07/08/2022 12:00:00'), 
(2513, 159, 25.00, '07/08/2022 12:00:00'), 
(1452, 159, 74.50, '07/10/2022 12:00:00')

-- Solution
SELECT t.transaction_date, t.user_id, COUNT(*) AS num_products
FROM (SELECT user_id, MAX(transaction_date) AS max_date 
FROM walmart_transactions GROUP BY user_id) as m
INNER JOIN walmart_transactions as t ON m.user_id = t.user_id AND m.max_date = t.transaction_date
GROUP BY t.transaction_date, t.user_id 
ORDER BY t.transaction_date ASC;
