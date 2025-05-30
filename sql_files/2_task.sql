SELECT 
COUNT(*) total,
CASE 
WHEN sighted_hour BETWEEN 0 AND 5 THEN 'Night'
WHEN sighted_hour BETWEEN 5 AND 11 THEN 'Morning'
WHEN sighted_hour BETWEEN 11 AND 17 THEN 'Day'
ELSE 'Evening'
END AS time_of_day
FROM sightings
GROUP BY
time_of_day
ORDER BY
total DESC