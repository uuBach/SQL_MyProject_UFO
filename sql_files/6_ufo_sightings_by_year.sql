-- This query returns the number of reported UFO sightings per year.


SELECT
sighted_year,
COUNT(*)
FROM sightings
GROUP BY
sighted_year
ORDER BY
sighted_year

/* Insights: 
UFO sightings were rare before 1960 and began increasing afterward.

Sightings peaked around 2012, marking the highest annual activity.
*/