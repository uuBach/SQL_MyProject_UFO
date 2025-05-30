SELECT
sighted_year,
COUNT(*)
FROM sightings
GROUP BY
sighted_year
ORDER BY
sighted_year