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
DECLARE @currentMonth int = (SELECT MONTH(GETDATE()));
DECLARE @lastMonth int = @currentMonth - 1;

WITH last_month_actions AS 
(SELECT DISTINCT user_id 
FROM facebook_user_actions
WHERE MONTH(event_date) = @lastMonth), current_month_actions AS 
	(SELECT DISTINCT user_id 
	FROM facebook_user_actions
	WHERE MONTH(event_date) = @currentMonth), active_users AS 
	(SELECT DISTINCT l.user_id 
	FROM last_month_actions AS l 
	INNER JOIN current_month_actions AS c ON l.user_id = c.user_id
	INNER JOIN facebook_user_actions AS a ON c.user_id = a.user_id 
	WHERE a.event_type IN ('sign-in', 'like', 'comment') AND MONTH(a.event_date) = @currentMonth)
	SELECT @currentMonth AS MONTH, COUNT(*) AS monthly_active_users 
	FROM active_users;