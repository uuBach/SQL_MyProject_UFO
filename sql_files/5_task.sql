SELECT 
COUNT(*) AS total,
sighted_year,
sighted_month,
sighted_day,
sighted_hour,sighted_minute
FROM sightings
GROUP BY
sighted_year,
sighted_month,
sighted_day,
sighted_hour,
sighted_minute
ORDER BY
total DESC