USE testDb;
DROP TABLE facebook_user_actions;

CREATE TABLE facebook_user_actions
(
user_id int not null,
event_id int not null,
event_type varchar(50) not null,
event_date date
)

INSERT INTO facebook_user_actions VALUES 
(445, 7765, 'sign-in', '05/31/2022 12:00:00'), -- MM/DD/YYYY HH:MM:SS
(742, 6458, 'sign-in', '06/03/2022 12:00:00'), 
(445, 3634, 'like', '06/05/2022 12:00:00'), 
(742, 1374, 'comment', '06/05/2022 12:00:00'), 
(648, 3124, 'like', '06/18/2022 12:00:00'),
(749, 4265, 'sign-in', '01/12/2023 12:00:00'),
(748, 4221, 'sign-in', '02/10/2023 12:00:00'),
(748, 4225, 'like', '03/13/2023 12:00:00'),
(749, 4554, 'comment', '03/10/2023 12:00:00'),
(749, 4265, 'like', '03/10/2023 12:00:00'),
(750, 4672, 'sign-in', '03/11/2023 12:00:00'),
(751, 4689, 'sign-in', '03/12/2023 12:00:00')

-- Solution
DECLARE @currentDate datetime = GETDATE();
SELECT MONTH(event_date) AS month, COUNT(DISTINCT user_id) AS monthly_active_users
FROM facebook_user_actions
WHERE event_type IN ('sign-in', 'like', 'comment')
    AND MONTH(event_date) IN (MONTH(@currentDate), MONTH(@currentDate) - 1)
    AND YEAR(event_date) = YEAR(@currentDate)
GROUP BY MONTH(event_date)
ORDER BY month ASC;
