USE pract;

-- Consider P1(a, b) and P2(c, d) be two points on 2D plane, where (a, b) be minimum and maximum values of Northern Latitude and (c, d) be 
-- minimum and maximum values of Western Longitude.
-- Write a query to print the Manhattan Distance between points P1 and P2 up to 4 decimal digits.

SELECT ROUND(ABS(A - C) + ABS(B - D), 4) AS dist FROM (SELECT MIN(LAT_N) AS A, MIN(LONG_W) AS B , MAX(LAT_N) AS C , MAX(LONG_W) AS D 
FROM STATION) AS temp;