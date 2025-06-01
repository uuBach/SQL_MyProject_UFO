-- This query returns the number of reported UFO sightings for each month of the year.


SELECT
sighted_month,
COUNT(*) AS count
FROM sightings
GROUP BY
sighted_month
ORDER BY
count DESC 

/*Insights:
July is the peak month for sightings, followed by August and June — indicating a strong summer spike.

Winter months (especially February and January) have the fewest reports, likely due to weather and reduced outdoor activity.

Overall, sightings increase with warmer weather and longer daylight, suggesting seasonality in observation or reporting behavior.
*/