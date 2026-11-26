-- =============================================================
-- Bank Customer Churn Analysis
-- 01: Create the customer table
-- Written for Microsoft SQL Server. Import the CSV into this
-- table (e.g. SSMS > Tasks > Import Flat File).
-- =============================================================

CREATE TABLE bank_customers (
    RowNumber        INT,
    CustomerId       INT PRIMARY KEY,
    Surname          VARCHAR(50),
    CreditScore      INT,
    Geography        VARCHAR(30),
    Gender           VARCHAR(10),
    Age              INT,
    Tenure           INT,
    Balance          DECIMAL(12, 2),
    NumOfProducts    INT,
    HasCrCard        INT,      -- 1 = yes, 0 = no
    IsActiveMember   INT,      -- 1 = yes, 0 = no
    EstimatedSalary  DECIMAL(12, 2),
    Exited           INT       -- 1 = left the bank, 0 = stayed
);

-- Quick checks after importing
SELECT COUNT(*) AS total_rows FROM bank_customers;

SELECT TOP 10 * FROM bank_customers;

-- Check for missing values in key fields
SELECT
    SUM(CASE WHEN Geography IS NULL THEN 1 ELSE 0 END)     AS missing_geography,
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END)           AS missing_age,
    SUM(CASE WHEN Balance IS NULL THEN 1 ELSE 0 END)       AS missing_balance,
    SUM(CASE WHEN Exited IS NULL THEN 1 ELSE 0 END)        AS missing_exited
FROM bank_customers;
