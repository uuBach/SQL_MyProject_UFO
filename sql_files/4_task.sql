SELECT 
  locations.state,
  ROUND(AVG(sightings.duration_seconds), 2) AS avg_duration,
  MAX(sightings.duration_seconds) AS max_duration
FROM sightings
INNER JOIN locations ON locations.location_id = sightings.location_id
GROUP BY 
  locations.state
ORDER BY
  avg_duration DESC
