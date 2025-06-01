-- This query retrieves the top 10 U.S. states with the highest number of reported UFO sightings.


SELECT 
state,
COUNT(*) AS sightings_count
FROM locations
GROUP BY state
ORDER BY
sightings_count DESC
LIMIT 10 


-- Insights: California reports the most UFO sightings by a wide margin. 
-- This could be due to its large population and high visibility of the sky
