USE pract;

-- Consider P1(a, b) and P2(c, d) be two points on 2D plane, where (a, b) be minimum and maximum values of Northern Latitude and (c, d) be minimum 
-- and maximum values of Western Longitude.
-- Write a query to print the Euclidean Distance between points P1 and P2 up to 4 decimal digits.

SELECT CAST(SQRT((C-A) * (C-A) + (D-B) * (D-B)) AS DECIMAL (6, 4)) AS dist 
FROM (
	SELECT MAX(LAT_N) AS A , MIN(LAT_N) AS B , MAX(LONG_W) AS C , MIN(LONG_W) AS D
	FROM STATION
	) AS X;