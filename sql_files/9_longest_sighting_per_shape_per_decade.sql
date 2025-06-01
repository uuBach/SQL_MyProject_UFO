-- This query returns the longest reported UFO sighting for each shape in each decade, including the date of the sighting.


WITH cte_table_1 AS(
    SELECT shape,
    FLOOR(sighted_year/10) * 10 AS decade,
    duration_seconds,
    sighted_year,
    sighted_month,
    sighted_day,
    ROW_NUMBER() OVER(
        PARTITION BY shape, FLOOR(sighted_year/10) * 10
        ORDER BY duration_seconds DESC,
        sighted_year ASC,
        sighted_month ASC,
        sighted_day ASC
    ) AS rn
    FROM sightings
)

SELECT
shape,
decade,
duration_seconds,
sighted_year,
sighted_month,
sighted_day
FROM cte_table_1
WHERE
rn = 1 

/* Insight:
“Changing” and “chevron” shapes show the widest time span in top-duration sightings, from the 1940s up to the 2010s, suggesting they are consistently reported across eras.
*/