USE practice;

SELECT m.id, m.title, m.category, c.memid, concat_ws('_',c.first_name, c.last_name) AS customer, c.movieid 
FROM movies m INNER JOIN members c ON m.id=c.movieid;

SELECT m.id, m.title, m.category, c.memid, concat_ws('_',c.first_name, c.last_name) AS customer, c.movieid 
FROM movies m LEFT JOIN members c ON m.id=c.movieid;

SELECT m.id, m.title, m.category, c.memid, concat_ws('_',c.first_name, c.last_name) AS customer, c.movieid 
FROM movies m RIGHT JOIN members c ON m.id=c.movieid;

SELECT m.id, m.title, m.category, c.memid, concat_ws('_',c.first_name, c.last_name) AS customer, c.movieid 
FROM movies m CROSS JOIN members c;