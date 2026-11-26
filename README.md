# Bank Customer Churn Analysis

A business analysis case study: understanding why customers leave a bank, and what the bank can do about it.

**Tools:** SQL · Microsoft Power BI · Excel
**Skills shown:** requirements gathering · user stories · data analysis · dashboard design · business recommendations

![Dashboard overview](dashboard/dashboard_overview.png)
<!-- [add: replace with a screenshot of your Power BI dashboard] -->

---

## 1. Business problem

A retail bank is losing customers. Each customer who leaves takes their balance with them and costs the bank the price of winning a replacement. The bank's management wants to know:

- How many customers are leaving?
- Which customers are most likely to leave?
- What should the bank do to keep them?

## 2. Approach

I approached this as a business analyst would on a real project:

1. **Understood the need.** I identified the stakeholders and wrote down what each of them needs to know. See the [requirements document](docs/requirements.md).
2. **Wrote user stories** to keep the analysis focused on decisions people will actually make.
3. **Explored the data in SQL** to answer each business question. See the [SQL queries](sql/02_analysis_queries.sql).
4. **Built a Power BI dashboard** so stakeholders can explore the findings themselves. See the [dashboard plan](dashboard/dashboard_plan.md).
5. **Turned the findings into recommendations** the bank can act on.

## 3. Data

- **Source:** [add: dataset name and link, e.g. "Bank Customer Churn" on Kaggle]
- **Size:** [add: number of rows] customers, [add: number] columns
- **Key fields:** country, gender, age, tenure, balance, number of products, credit card holder, active member, estimated salary, and whether the customer left (`Exited`)
- This is a public dataset. It contains no real customer data from any bank I have worked for.

## 4. Key findings

<!-- Fill these in after running the SQL queries. Use your real numbers. -->

| # | Finding | Evidence |
|---|---------|----------|
| 1 | [add: overall churn rate] | [add: query 1 result] |
| 2 | [add: which country has the highest churn] | [add: query 2 result] |
| 3 | [add: which age group leaves most] | [add: query 4 result] |
| 4 | [add: how number of products relates to churn] | [add: query 5 result] |
| 5 | [add: how inactive customers compare with active ones] | [add: query 6 result] |

## 5. Recommendations

<!-- Write 3–4 actions, each linked to a finding above. -->

1. [add: recommendation linked to finding X]
2. [add: recommendation linked to finding Y]
3. [add: recommendation linked to finding Z]

## 6. What I would do next

- [add: e.g. gather feedback from customers who left, to understand the reasons behind the numbers]
- [add: e.g. track churn monthly to see whether the recommendations work]

## Repository structure

```
bank-customer-churn-analysis/
├── README.md                   ← this file
├── docs/
│   └── requirements.md         ← stakeholders, requirements, user stories
├── sql/
│   ├── 01_create_table.sql     ← table setup
│   └── 02_analysis_queries.sql ← queries answering each business question
├── dashboard/
│   ├── dashboard_plan.md       ← pages, visuals and measures
│   └── [add: your .pbix file and screenshots]
└── data/
    └── [add: dataset, or a link to it]
```

## About me

I'm an MSc Financial Technology student at the University of Salford with a background in SME banking, looking for a business analyst placement from May 2027.
[add: LinkedIn profile link]
