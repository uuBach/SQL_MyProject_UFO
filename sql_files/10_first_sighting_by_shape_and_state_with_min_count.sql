-- This query returns the earliest recorded UFO sighting for each shape in each state, 
-- filtered to only include shape-state combinations with at least 5 total sightings.


WITH cte_table_1 AS(
    SELECT 
    sightings.shape AS shape,
    locations.state AS state,
    sightings.sighted_year AS sighted_year,
    sightings.sighted_month AS sighted_month,
    sightings.sighted_day AS sighted_day,
    COUNT(*) OVER(
        PARTITION BY shape, state
    ) AS total,
    ROW_NUMBER() OVER(
        PARTITION BY sightings.shape, locations.state
        ORDER BY sightings.sighted_year ASC,
        sightings.sighted_month ASC,
        sightings.sighted_day ASC
    ) AS rn
    FROM sightings
    INNER JOIN locations 
    ON locations.location_id = sightings.location_id
)
SELECT
shape,
state,
total,
sighted_year,
sighted_month,
sighted_day
FROM cte_table_1
WHERE rn = 1 
AND
total>=5

/*Insights:
States like California, Florida, and Arizona show early and high-frequency sightings, indicating both early exposure and strong reporting volume.

Some shapes (e.g. “changing”) appear decades earlier in certain states (e.g. Florida in 1969 vs. Connecticut in 2000), showing geographic variation in when shapes are first reported.
*/