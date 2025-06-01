-- This query calculates the average and maximum reported UFO sighting durations for each U.S. state.


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


-- Insights: Some states report significantly higher average sighting durations than others, which may indicate variations in observation conditions, witness behavior, or regional interpretations of unidentified aerial phenomena.
