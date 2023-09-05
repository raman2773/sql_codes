USE pract;

CREATE TABLE TRIANGLES (  A INT NOT NULL,
                          B INT NOT NULL,
                          C INT NOT NULL 
					   );
      
INSERT INTO TRIANGLES VALUES  (10,10,15), 
							  (20,20,20), 
							  (12,13,15), 
							  (15,16,40);
							  
INSERT INTO TRIANGLES VALUES(20,20,15);	
			
 SELECT * FROM triangles; 
  
  
-- Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements 
-- for each record in the table:
-- Not A Triangle: The given values of A, B, and C don't form a triangle.
-- Equilateral: It's a triangle with sides of equal length.
-- Isosceles: It's a triangle with sides of equal length.
-- Scalene: It's a triangle with sides of differing lengths. Input Format

SELECT
  CASE
    WHEN A + B > C AND A+C>B AND B+C>A THEN 
      CASE
        WHEN A = B AND B = C THEN 'Equilateral' 
        WHEN A = B OR B = C OR A = C THEN 'Isosceles' 
        ELSE 'Scalene' 
      END 
    ELSE 'Not A Triangle' 
  END AS type_
  FROM triangles;
  