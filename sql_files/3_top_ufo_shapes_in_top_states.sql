-- This query identifies the most commonly reported UFO shapes in the top 5 U.S. states with the highest number of sightings.


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


/* Insights: 
“Light” is the most commonly reported UFO shape in all top states.

Shapes like circle, triangle, and fireball consistently appear among the top.

The pattern is remarkably consistent across regions, suggesting either a shared perception or reporting bias.
*/