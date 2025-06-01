-- This query identifies the U.S. state with the highest number of UFO sightings for each year.


WITH cte_table_1 AS(
SELECT
sightings.sighted_year,
locations.state,
COUNT(*) AS total
FROM sightings
INNER JOIN locations
ON locations.location_id = sightings.location_id
GROUP BY
sightings.sighted_year,
locations.state), 
cte_table_2 AS(
    SELECT *,
    ROW_NUMBER() OVER(
        PARTITION BY sighted_year
        ORDER BY total DESC
    ) AS rn
    FROM cte_table_1)

SELECT
*
FROM cte_table_2
WHERE rn = 1

/*Insights:
California frequently appears as the top state, especially from the 1980s onward, reflecting its consistent high volume of reports.

In earlier decades (1910s–1940s), the top state varies widely each year, often with only 1–2 sightings, suggesting sparse data or low awareness.

Over time, the leading state's total sightings per year grow significantly, indicating a general rise in UFO reporting nationwide.
*/
