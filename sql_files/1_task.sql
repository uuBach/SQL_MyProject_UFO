SELECT 
state,
COUNT(*) AS sightings_count
FROM locations
GROUP BY state
ORDER BY
sightings_count DESC
LIMIT 10 