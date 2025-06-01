-- This query calculates the average duration (in seconds) of UFO sightings for each reported shape.


SELECT 
shape,
ROUND(AVG(duration_seconds), 2) AS avg_duration
FROM sightings
GROUP BY
shape
ORDER BY
avg_duration DESC 

/*Insights:
"Crescent" sightings have the longest average duration at over 10 hours (37,800 seconds), far above all others.

"Light" shapes are the second-longest, averaging over 4 hours — possibly due to slow-moving or stationary appearances.
*/