-- This query returns the top 3 longest UFO sightings for each reported shape, including the date of each sighting.


WITH cte_table AS(
    SELECT
    shape,
    duration_seconds,
    sighted_year,
    sighted_month,
    sighted_day,
    ROW_NUMBER() OVER(
        PARTITION BY shape
        ORDER BY duration_seconds DESC,
        sighted_year ASC,
        sighted_month ASC,
        sighted_day ASC
    ) AS rn
    FROM sightings
)
SELECT
    shape,
    duration_seconds,
    sighted_year,
    sighted_month,
    sighted_day
    FROM cte_table
    WHERE rn IN(1, 2, 3)


/* Insights:
Some UFO shapes like "cigar" and "changing" were reported to last over 2 days, with one cigar-shaped sighting lasting 21 days (1,814,400 seconds).

Extremely long durations appear across various decades (e.g., 1961, 2002, 2010), indicating this pattern isn't limited to modern sightings.
*/ 