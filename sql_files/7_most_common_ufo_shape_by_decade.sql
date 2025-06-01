-- This query identifies the most frequently reported UFO shape for each decade based on sighting data.


WITH cte_table_1 AS(
    SELECT
    FLOOR(sighted_year/10) * 10 AS decade,
    shape,
    COUNT(*) AS total
    FROM sightings
    GROUP BY
    decade, shape
), cte_table_2 AS(
    SELECT *,
    ROW_NUMBER() OVER(
        PARTITION BY decade
        ORDER BY total DESC
    ) AS rn
    FROM cte_table_1
)
SELECT
decade,
shape,
total
FROM cte_table_2
WHERE
rn = 1
ORDER BY
decade ASC


/* Insights:
From the 1940s to 1970s, "disk" was the most reported UFO shape across all decades.

Starting in the 1990s, "light" became the dominant shape and remained so into the 2010s.
*/