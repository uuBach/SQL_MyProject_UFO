-- This query identifies the exact date and time moments (to the minute) with the highest number of reported UFO sightings.


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

/* Insights:
Sightings dramatically increased from the late 1990s to around 2012, peaking just before 2013. A sharp drop follows after that.

July has the highest number of reports, followed by August and June — suggesting a strong summer effect.

Most sightings occur in the evening, especially between 8 PM and 11 PM, indicating nighttime is the most common window for observations.
*/