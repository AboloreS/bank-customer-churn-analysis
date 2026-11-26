-- =============================================================
-- Bank Customer Churn Analysis
-- 02: Queries answering each business question
-- Business questions (BQ) are listed in docs/requirements.md
-- Written for Microsoft SQL Server.
-- =============================================================


-- -------------------------------------------------------------
-- Q1 (BQ1): What is the overall churn rate?
-- -------------------------------------------------------------
SELECT
    COUNT(*)                                        AS total_customers,
    SUM(Exited)                                     AS customers_left,
    ROUND(100.0 * SUM(Exited) / COUNT(*), 2)        AS churn_rate_pct
FROM bank_customers;


-- -------------------------------------------------------------
-- Q2 (BQ2): Does churn differ by country?
-- -------------------------------------------------------------
SELECT
    Geography,
    COUNT(*)                                        AS customers,
    SUM(Exited)                                     AS customers_left,
    ROUND(100.0 * SUM(Exited) / COUNT(*), 2)        AS churn_rate_pct
FROM bank_customers
GROUP BY Geography
ORDER BY churn_rate_pct DESC;


-- -------------------------------------------------------------
-- Q3 (BQ3): Does churn differ by gender?
-- -------------------------------------------------------------
SELECT
    Gender,
    COUNT(*)                                        AS customers,
    SUM(Exited)                                     AS customers_left,
    ROUND(100.0 * SUM(Exited) / COUNT(*), 2)        AS churn_rate_pct
FROM bank_customers
GROUP BY Gender
ORDER BY churn_rate_pct DESC;


-- -------------------------------------------------------------
-- Q4 (BQ4): Which age groups leave most?
-- -------------------------------------------------------------
SELECT
    age_group,
    COUNT(*)                                        AS customers,
    SUM(Exited)                                     AS customers_left,
    ROUND(100.0 * SUM(Exited) / COUNT(*), 2)        AS churn_rate_pct
FROM (
    SELECT
        Exited,
        CASE
            WHEN Age < 30 THEN '1. Under 30'
            WHEN Age < 40 THEN '2. 30-39'
            WHEN Age < 50 THEN '3. 40-49'
            WHEN Age < 60 THEN '4. 50-59'
            ELSE               '5. 60+'
        END AS age_group
    FROM bank_customers
) AS banded
GROUP BY age_group
ORDER BY age_group;


-- -------------------------------------------------------------
-- Q5 (BQ5): How does the number of products relate to churn?
-- -------------------------------------------------------------
SELECT
    NumOfProducts,
    COUNT(*)                                        AS customers,
    SUM(Exited)                                     AS customers_left,
    ROUND(100.0 * SUM(Exited) / COUNT(*), 2)        AS churn_rate_pct
FROM bank_customers
GROUP BY NumOfProducts
ORDER BY NumOfProducts;


-- -------------------------------------------------------------
-- Q6 (BQ6): Are inactive customers more likely to leave?
-- -------------------------------------------------------------
SELECT
    CASE WHEN IsActiveMember = 1 THEN 'Active' ELSE 'Inactive' END AS activity_status,
    COUNT(*)                                        AS customers,
    SUM(Exited)                                     AS customers_left,
    ROUND(100.0 * SUM(Exited) / COUNT(*), 2)        AS churn_rate_pct
FROM bank_customers
GROUP BY IsActiveMember
ORDER BY churn_rate_pct DESC;


-- -------------------------------------------------------------
-- Q7 (BQ7): Are customers with higher balances more or less likely to leave?
-- -------------------------------------------------------------
SELECT
    balance_band,
    COUNT(*)                                        AS customers,
    SUM(Exited)                                     AS customers_left,
    ROUND(100.0 * SUM(Exited) / COUNT(*), 2)        AS churn_rate_pct
FROM (
    SELECT
        Exited,
        CASE
            WHEN Balance = 0        THEN '1. Zero balance'
            WHEN Balance < 50000    THEN '2. Under 50k'
            WHEN Balance < 100000   THEN '3. 50k-100k'
            WHEN Balance < 150000   THEN '4. 100k-150k'
            ELSE                         '5. 150k+'
        END AS balance_band
    FROM bank_customers
) AS banded
GROUP BY balance_band
ORDER BY balance_band;


-- -------------------------------------------------------------
-- Q8 (BQ8): Does credit score relate to churn?
-- -------------------------------------------------------------
SELECT
    credit_band,
    COUNT(*)                                        AS customers,
    SUM(Exited)                                     AS customers_left,
    ROUND(100.0 * SUM(Exited) / COUNT(*), 2)        AS churn_rate_pct
FROM (
    SELECT
        Exited,
        CASE
            WHEN CreditScore < 500 THEN '1. Under 500'
            WHEN CreditScore < 600 THEN '2. 500-599'
            WHEN CreditScore < 700 THEN '3. 600-699'
            WHEN CreditScore < 800 THEN '4. 700-799'
            ELSE                        '5. 800+'
        END AS credit_band
    FROM bank_customers
) AS banded
GROUP BY credit_band
ORDER BY credit_band;


-- -------------------------------------------------------------
-- Q9 (BQ9): Does tenure (years with the bank) relate to churn?
-- -------------------------------------------------------------
SELECT
    Tenure,
    COUNT(*)                                        AS customers,
    SUM(Exited)                                     AS customers_left,
    ROUND(100.0 * SUM(Exited) / COUNT(*), 2)        AS churn_rate_pct
FROM bank_customers
GROUP BY Tenure
ORDER BY Tenure;


-- -------------------------------------------------------------
-- Q10 (BQ10): How much balance has the bank lost through churn?
-- -------------------------------------------------------------
SELECT
    SUM(CASE WHEN Exited = 1 THEN Balance ELSE 0 END)                 AS balance_lost,
    SUM(Balance)                                                      AS total_balance,
    ROUND(100.0 * SUM(CASE WHEN Exited = 1 THEN Balance ELSE 0 END)
                / SUM(Balance), 2)                                    AS pct_balance_lost
FROM bank_customers;


-- -------------------------------------------------------------
-- Q11 (BQ11): Which high-value customers are at risk?
-- Inactive customers who are still with the bank and hold a
-- balance above 100,000. Change the threshold if needed.
-- -------------------------------------------------------------
SELECT
    CustomerId,
    Geography,
    Age,
    Tenure,
    Balance,
    NumOfProducts
FROM bank_customers
WHERE Exited = 0
  AND IsActiveMember = 0
  AND Balance > 100000
ORDER BY Balance DESC;

-- How many such customers, and how much balance do they hold?
SELECT
    COUNT(*)        AS at_risk_customers,
    SUM(Balance)    AS at_risk_balance
FROM bank_customers
WHERE Exited = 0
  AND IsActiveMember = 0
  AND Balance > 100000;


-- -------------------------------------------------------------
-- Q12 (extra): Country and activity combined
-- Shows whether inactivity matters more in some countries.
-- -------------------------------------------------------------
SELECT
    Geography,
    CASE WHEN IsActiveMember = 1 THEN 'Active' ELSE 'Inactive' END AS activity_status,
    COUNT(*)                                        AS customers,
    ROUND(100.0 * SUM(Exited) / COUNT(*), 2)        AS churn_rate_pct
FROM bank_customers
GROUP BY Geography, IsActiveMember
ORDER BY Geography, activity_status;
