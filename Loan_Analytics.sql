CREATE DATABASE finance_data;
USE finance_data;


--  --------------------------------------KPI_1-----------------------------------------------------------------

SELECT YEAR(issue_d) AS year_d,SUM(loan_amnt) AS loan_amount 
FROM f_1
GROUP BY year_d
ORDER BY YEAR(issue_d);

--  --------------------------------------KPI_2-----------------------------------------------------------------

SELECT c.grade, c.sub_grade, sum(t.revol_bal),(revol_util*100) as rev_util FROM f_1 AS c INNER JOIN f_2 AS t ON c.id=t.id
GROUP BY c.grade, c.sub_grade,rev_util
ORDER BY c.grade;


--  --------------------------------------KPI_3-----------------------------------------------------------------

SELECT c.verification_status, sum(t.total_pymnt) FROM f_1 AS c INNER JOIN f_2 AS t on c.id = t.id
WHERE c.verification_status in ('Verified','Not Verified')
GROUP BY c.verification_status
ORDER BY c.verification_status;


--  --------------------------------------KPI_4-----------------------------------------------------------------

SELECT c.addr_state, c.loan_status, YEAR(t.last_credit_pull_d) AS last_credit_pull_d,sum(revol_bal) AS revol_bal  
FROM f_1 AS c INNER JOIN f_2 AS t ON c.id=t.id
GROUP BY c.addr_state,c.loan_status,YEAR(last_credit_pull_d)
ORDER BY c.addr_state,YEAR(t.last_credit_pull_d),c.loan_status;


--  --------------------------------------KPI_5-----------------------------------------------------------------

SELECT c.home_ownership, YEAR(t.last_pymnt_d) AS last_pymt_d,round(sum(t.last_pymnt_amnt),2) AS last_pymt_amt
FROM f_1 AS c INNER JOIN f_2 AS t ON c.id=t.id 
WHERE year(t.last_pymnt_d) != "null"
GROUP BY c.home_ownership,YEAR(t.last_pymnt_d)
ORDER BY YEAR(t.last_pymnt_d);



--  --------------------------------------KPI_6-----------------------------------------------------------------

SELECT c.purpose,sum(c.loan_amnt) AS tot_loan_amt,round(sum(t.total_pymnt),2) AS tot_pymt,round(avg(c.int_rate),2) AS avg_interest_rate,round(sum(t.total_pymnt - c.loan_amnt)/sum(c.loan_amnt)*100,2) AS profit_perct
FROM f_1 AS c INNER JOIN f_2 AS t ON c.id=t.id
GROUP BY c.purpose
ORDER BY c.purpose;








