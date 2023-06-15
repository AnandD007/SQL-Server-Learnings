USE testDb;

CREATE TABLE toppings
(
topping_name varchar(50) primary key,
ingredient_cost float not null
)

INSERT INTO toppings VALUES 
('Pepperoni', 0.50), 
('Sausage', 0.70), 
('Chicken', 0.55), 
('Extra Cheese', 0.40)

-- Solution
SELECT CONCAT(t1.topping_name, '+', t2.topping_name, '+', t3.topping_name) AS pizza_toppings, 
ROUND((t1.ingredient_cost + t2.ingredient_cost + t3.ingredient_cost), 2) AS total_cost
FROM toppings AS t1 
INNER JOIN toppings AS t2 ON t1.topping_name < t2.topping_name 
INNER JOIN toppings as t3 ON t2.topping_name < t3.topping_name
ORDER BY total_cost DESC, pizza_toppings ASC;
