-- =============================================================
-- Bank Customer Churn Analysis
-- 01: Create the customer table
-- Dataset: Customer-Churn-Records.csv (Kaggle, 10,000 rows, 18 columns)
-- Written for Microsoft SQL Server. Import the CSV into this
-- table (e.g. SSMS > right-click your database > Tasks >
-- Import Flat File).
-- =============================================================

CREATE TABLE bank_customers (
    RowNumber             INT,
    CustomerId            INT PRIMARY KEY,
    Surname               VARCHAR(50),
    CreditScore           INT,
    Geography             VARCHAR(30),
    Gender                VARCHAR(10),
    Age                   INT,
    Tenure                INT,
    Balance               DECIMAL(12, 2),
    NumOfProducts         INT,
    HasCrCard             INT,      -- 1 = yes, 0 = no
    IsActiveMember        INT,      -- 1 = yes, 0 = no
    EstimatedSalary       DECIMAL(12, 2),
    Exited                INT,      -- 1 = left the bank, 0 = stayed
    Complain              INT,      -- 1 = customer has complained, 0 = no
    [Satisfaction Score]  INT,      -- 1 (lowest) to 5 (highest)
    [Card Type]           VARCHAR(10), -- SILVER, GOLD, PLATINUM, DIAMOND
    [Point Earned]        INT       -- loyalty points
);

-- Quick checks after importing
SELECT COUNT(*) AS total_rows FROM bank_customers;   -- expect 10,000

SELECT TOP 10 * FROM bank_customers;

-- Check for missing values in key fields
SELECT
    SUM(CASE WHEN Geography IS NULL THEN 1 ELSE 0 END)            AS missing_geography,
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END)                  AS missing_age,
    SUM(CASE WHEN Balance IS NULL THEN 1 ELSE 0 END)              AS missing_balance,
    SUM(CASE WHEN Exited IS NULL THEN 1 ELSE 0 END)               AS missing_exited,
    SUM(CASE WHEN Complain IS NULL THEN 1 ELSE 0 END)             AS missing_complain,
    SUM(CASE WHEN [Satisfaction Score] IS NULL THEN 1 ELSE 0 END) AS missing_satisfaction
FROM bank_customers;
