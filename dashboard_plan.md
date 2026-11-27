# Power BI Dashboard Plan

This plan links each dashboard page to the user stories in [requirements.md](requirements.md).

## Setup

1. Open Power BI Desktop and choose **Get data → Text/CSV**, then select the dataset.
2. Check the column types in Power Query: `Balance` and `EstimatedSalary` as decimal numbers; `Exited`, `IsActiveMember` and `HasCrCard` as whole numbers.
3. Add these calculated columns (Modelling → New column):

```DAX
Age Group =
SWITCH(TRUE(),
    bank_customers[Age] < 30, "Under 30",
    bank_customers[Age] < 40, "30-39",
    bank_customers[Age] < 50, "40-49",
    bank_customers[Age] < 60, "50-59",
    "60+")

Activity Status =
IF(bank_customers[IsActiveMember] = 1, "Active", "Inactive")

Status =
IF(bank_customers[Exited] = 1, "Left", "Stayed")

Complaint Status =
IF(bank_customers[Complain] = 1, "Complained", "No complaint")
```

4. Add these measures (Modelling → New measure):

```DAX
Total Customers = COUNTROWS(bank_customers)

Customers Left = CALCULATE(COUNTROWS(bank_customers), bank_customers[Exited] = 1)

Churn Rate = DIVIDE([Customers Left], [Total Customers])

Balance Lost = CALCULATE(SUM(bank_customers[Balance]), bank_customers[Exited] = 1)

At-Risk Customers =
CALCULATE(
    COUNTROWS(bank_customers),
    bank_customers[Exited] = 0,
    bank_customers[IsActiveMember] = 0,
    bank_customers[Balance] > 100000)
```

Format **Churn Rate** as a percentage (Measure tools → Format → Percentage).

## Page 1: Overview (US1)

| Visual | Fields |
|---|---|
| 4 cards | Total Customers · Customers Left · Churn Rate · Balance Lost |
| Bar chart | Churn Rate by Geography |
| Donut chart | Total Customers by Status (Left / Stayed) |
| Slicers | Geography · Gender · Activity Status |

## Page 2: Who leaves? (US2, US4, US5)

| Visual | Fields |
|---|---|
| Column chart | Churn Rate by Age Group (sort: Under 30 → 60+) |
| Column chart | Churn Rate by NumOfProducts |
| Bar chart | Churn Rate by Activity Status |
| Bar chart | Churn Rate by Gender |
| Slicers | Geography · Gender |

## Page 3: At-risk customers (US3)

| Visual | Fields |
|---|---|
| Card | At-Risk Customers |
| Table | CustomerId · Geography · Age · Tenure · Balance · NumOfProducts, filtered to Exited = 0, IsActiveMember = 0, Balance > 100,000, sorted by Balance (descending) |
| Slicer | Geography |

## Page 4: Customer feedback (US6)

| Visual | Fields |
|---|---|
| Column chart | Churn Rate by Complaint Status |
| Column chart | Churn Rate by Satisfaction Score (1 → 5) |
| Bar chart | Churn Rate by Card Type |
| Slicers | Geography · Activity Status |

## Finishing

- Give each page a clear title, e.g. "Who is leaving the bank?"
- Use one main colour, plus one highlight colour for "Left".
- Take a screenshot of each page and upload it to this repository.
- Save the file as `bank_churn_dashboard.pbix` and upload it to this repository.
