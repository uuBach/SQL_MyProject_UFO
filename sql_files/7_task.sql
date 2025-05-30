WITH AS decades_and_shape(
SELECT 
FLOOR(sighted_year/10) * 10 AS decades,
shape,
COUNT(*) total
FROM sightings
INNER JOIN locations ON locations.location_id = sightings.location_id
GROUP BY
shape,
decades 
ORDER BY
total DESC
)