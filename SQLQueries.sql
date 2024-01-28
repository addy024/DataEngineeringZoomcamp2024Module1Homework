-- Question 3

SELECT
	COUNT(1)
FROM 
	green_taxi_trips
WHERE 
	CAST(lpep_pickup_datetime AS DATE) = TIMESTAMP '2019-09-18' 
	AND 
	CAST(lpep_dropoff_datetime AS DATE) = TIMESTAMP '2019-09-18';
	
	
-- Question 4

SELECT 
	CAST(lpep_pickup_datetime AS DATE) as "pickup_date",
	MAX(trip_distance) as "longest_trip"
FROM 
	green_taxi_trips
GROUP BY 
	CAST(lpep_pickup_datetime AS DATE)
ORDER BY 
	"longest_trip" DESC
Limit 1;

-- Question 5

SELECT
    z."Borough",
    SUM(g."total_amount") AS total_amount_sum
FROM
    green_taxi_trips g
LEFT JOIN
    zones z ON g."PULocationID" = z."LocationID"
WHERE
    z."Borough" != 'Unknown'
    AND CAST(g.lpep_pickup_datetime AS DATE) = '2019-09-18'
GROUP BY
    z."Borough"
HAVING
    SUM(g."total_amount") > 50000;


-- Question 6

WITH RankedZones AS (
    SELECT 
        puTaxi."tip_amount",
        doZone."Zone" AS "Drop off Zone Name",
        RANK() OVER (ORDER BY puTaxi."tip_amount" DESC) AS rnk
    FROM 
        green_taxi_trips puTaxi
    LEFT JOIN 
        zones puZone ON puTaxi."PULocationID" = puZone."LocationID"
    LEFT JOIN 
        zones doZone ON puTaxi."DOLocationID" = doZone."LocationID"
    WHERE 
        EXTRACT('MONTH' FROM puTaxi."lpep_pickup_datetime") = 9 
        AND EXTRACT('YEAR' FROM puTaxi."lpep_pickup_datetime") = 2019 
        AND puZone."Zone" = 'Astoria'
)
SELECT tip_amount, "Drop off Zone Name" from RankedZones where rnk = 1;


