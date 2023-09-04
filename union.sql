USE practice;

SELECT mealname, rate FROM meals 
UNION  
SELECT drinkname, rate FROM drinks;

SELECT mealname AS item, rate FROM meals
UNION  
SELECT drinkname, rate FROM drinks
ORDER BY item;