-- This query categorizes UFO sightings by time of day and returns the total number of sightings for each category.


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


-- Insights: Most UFO sightings are reported in the evening, followed by night and daytime, with the fewest sightings occurring in the morning.
