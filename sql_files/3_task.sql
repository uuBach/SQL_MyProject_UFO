WITH top_states AS
(
    SELECT 
    state,
    COUNT(*) AS sightings_count
    FROM locations
    GROUP BY state
    ORDER BY
    sightings_count DESC
    LIMIT 5
)

SELECT 
locations.state,
sightings.shape,
COUNT(*) AS count
FROM locations
INNER JOIN sightings ON sightings.location_id = locations.location_id
WHERE state IN (SELECT state FROM top_states)
GROUP BY
locations.state,
sightings.shape
ORDER BY
locations.state,
count DESC
