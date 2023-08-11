CREATE DATABASE insurance;
USE insurance;


CREATE VIEW brokerage_fees AS 
SELECT client_name, branch_name, solution_group, account_executive, income_class, Amount, income_due_date, revenue_transaction_type FROM brokerage
UNION ALL
SELECT client_name, branch_name, solution_group, account_executive, income_class, Amount, income_due_date, revenue_transaction_type FROM fees;

-- ---------------------------------------KPI_1------------------------------------------------------------------------------------------------

SELECT Account_Executive,COUNT(meeting_date) AS 'No_of_meeting'
FROM meetg
GROUP BY Account_Executive
ORDER BY COUNT(meeting_date) DESC;

-- ---------------------------------------KPI_2------------------------------------------------------------------------------------------------

SELECT product_group,COUNT(product_group) AS 'count'
FROM oppty
GROUP BY product_group
ORDER BY COUNT(product_group) DESC;

-- ---------------------------------------KPI_3------------------------------------------------------------------------------------------------

SELECT stage,SUM(revenue_amount) AS 'rev_amt'
FROM oppty
GROUP BY stage
ORDER BY COUNT(revenue_amount) DESC;

-- ---------------------------------------KPI_4------------------------------------------------------------------------------------------------

SELECT opportunity_name,SUM(revenue_amount) AS 'rev_amt'
FROM oppty
GROUP BY opportunity_name
ORDER BY SUM(revenue_amount) DESC
LIMIT 4;

-- ---------------------------------------KPI_5------------------------------------------------------------------------------------------------

SELECT account_executive,income_class, CASE
WHEN 'NEW' THEN COUNT(income_class)
WHEN 'CROSS SELL' THEN COUNT(income_class)
WHEN 'RENEWAL' THEN COUNT(income_class)
ELSE COUNT(income_class)
END AS 'count'
FROM invoice
WHERE income_class != 'NA'
GROUP BY account_executive,income_class
ORDER BY account_executive,income_class;

-- ---------------------------------------KPI_5------------------------------------------------------------------------------------------------

SELECT SUM(b.amount) AS 'Achieved',SUM(i.amount) AS 'Invoice',SUM(t.cross_sell_budget) AS 'Target' FROM invoice AS i LEFT JOIN brokerage AS b 
ON i.index=b.index  
LEFT JOIN ind_bgt AS t ON i.index=t.index;


-- ---------------------------------------KPI_6------------------------------------------------------------------------------------------------



 








