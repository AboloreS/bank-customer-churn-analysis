# Requirements Document: Bank Customer Churn Analysis

| | |
|---|---|
| **Author** | Aishat Abolore Sadiq |
| **Version** | 1.0 |
| **Date** | [add: date] |
| **Status** | Draft |

---

## 1. Background

The bank is losing customers. Leaving customers reduce the bank's deposits and income, and replacing them costs more than keeping them. Management does not currently have a clear view of which customers leave or why.

## 2. Business objectives

1. Measure how many customers are leaving (the churn rate).
2. Identify which customer groups are most likely to leave.
3. Give relationship and product teams a dashboard they can use to spot at-risk customers.
4. Recommend actions to reduce churn.

## 3. Stakeholders

| Stakeholder | Interest | What they need |
|---|---|---|
| Head of Retail Banking | Overall performance | A headline churn rate and its main causes |
| Relationship managers | Keeping their customers | A list of the customer groups most at risk |
| Product team | Product design | How the number and type of products relate to churn |
| Marketing team | Retention campaigns | Which groups to target, and in which countries |

## 4. Scope

**In scope**
- Analysis of the customer dataset described in the README
- Churn by country, gender, age, tenure, balance, credit score, products and activity
- A Power BI dashboard and written recommendations

**Out of scope**
- Predicting churn for individual customers (machine learning)
- Interviews with real customers
- Changes to bank systems

## 5. Business questions

| # | Question | Answered by |
|---|---|---|
| BQ1 | What is the overall churn rate? | SQL query 1 |
| BQ2 | Does churn differ by country? | SQL query 2 |
| BQ3 | Does churn differ by gender? | SQL query 3 |
| BQ4 | Which age groups leave most? | SQL query 4 |
| BQ5 | How does the number of products relate to churn? | SQL query 5 |
| BQ6 | Are inactive customers more likely to leave? | SQL query 6 |
| BQ7 | Are customers with higher balances more or less likely to leave? | SQL query 7 |
| BQ8 | Does credit score relate to churn? | SQL query 8 |
| BQ9 | Does tenure (years with the bank) relate to churn? | SQL query 9 |
| BQ10 | How much balance has the bank lost through churn? | SQL query 10 |
| BQ11 | Which high-value customers are at risk? | SQL query 11 |

## 6. Functional requirements (dashboard)

| ID | Requirement | Priority |
|---|---|---|
| FR1 | Show total customers, customers who left, churn rate and balance lost as headline figures | Must have |
| FR2 | Show churn rate by country, gender, age group and number of products | Must have |
| FR3 | Let users filter every page by country, gender and active status | Must have |
| FR4 | Show a list of high-balance customers who are inactive (at risk) | Should have |
| FR5 | Show churn by tenure and credit score band | Could have |

## 7. User stories

**US1.** As the **Head of Retail Banking**, I want to see the overall churn rate and balance lost, so that I understand the size of the problem.
*Acceptance criteria:* the dashboard's first page shows total customers, customers who left, churn rate (%) and total balance lost.

**US2.** As a **relationship manager**, I want to see which customer groups leave most, so that I can focus my retention calls.
*Acceptance criteria:* churn rate is shown by age group, country and activity status, and can be filtered.

**US3.** As a **relationship manager**, I want a list of high-balance inactive customers, so that I can contact them before they leave.
*Acceptance criteria:* a table lists inactive customers with a balance above the chosen threshold, sorted by balance.

**US4.** As a **product manager**, I want to see churn by number of products held, so that I can decide whether to promote additional products.
*Acceptance criteria:* a chart shows churn rate for customers with 1, 2, 3 and 4 products.

**US5.** As a **marketing manager**, I want to compare churn across countries, so that I can plan where to run retention campaigns.
*Acceptance criteria:* a chart shows churn rate by country, with the country filter applied across the page.

## 8. Assumptions and constraints

- The dataset is a public sample and may not reflect any specific bank.
- `Exited = 1` means the customer left the bank; `0` means they stayed.
- `IsActiveMember` is taken as given; the dataset does not define "active".
- Age, balance and credit score bands are my own choices, set out in the SQL queries.

## 9. Data dictionary

| Field | Description |
|---|---|
| CustomerId | Unique customer ID |
| Surname | Customer surname (not used in analysis) |
| CreditScore | Credit score |
| Geography | Country |
| Gender | Gender |
| Age | Age in years |
| Tenure | Years with the bank |
| Balance | Account balance |
| NumOfProducts | Number of bank products held |
| HasCrCard | 1 = has a credit card |
| IsActiveMember | 1 = active member |
| EstimatedSalary | Estimated annual salary |
| Exited | 1 = left the bank, 0 = stayed |

[confirm: check these column names against the dataset you download, and update if they differ]
