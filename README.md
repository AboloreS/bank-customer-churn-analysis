# Bank Customer Churn Analysis

A business analysis case study: understanding why customers leave a bank, and what the bank can do about it.

**Tools:** SQL · Microsoft Power BI · Excel
**Skills shown:** requirements gathering · user stories · data analysis · dashboard design · business recommendations

---

## 1. Business problem

A retail bank is losing customers. Each customer who leaves takes their balance with them and costs the bank the price of winning a replacement. The bank's management wants to know:

- How many customers are leaving?
- Which customers are most likely to leave?
- What should the bank do to keep them?

## 2. Approach

I approached this as a business analyst would on a real project:

1. **Understood the need.** I identified the stakeholders and wrote down what each of them needs to know. See the [requirements document](requirements.md).
2. **Wrote user stories** to keep the analysis focused on decisions people will actually make.
3. **Explored the data in SQL** to answer each business question. See the [SQL queries](02_analysis_queries.sql).
4. **Built a Power BI dashboard** so stakeholders can explore the findings themselves. See the [dashboard plan](dashboard_plan.md).
5. **Turned the findings into recommendations** the bank can act on.

## 3. Data

- **Source:** Bank Customer Churn dataset (Kaggle)
- **Key fields:** country, gender, age, tenure, balance, number of products, credit card holder, active member, estimated salary, and whether the customer left
- This is a public dataset. It contains no real customer data from any bank I have worked for.

## 4. Key findings and recommendations

*Analysis in progress. Findings, the dashboard and recommendations will be added here.*

## 5. What I would do next

- Gather feedback from customers who left, to understand the reasons behind the numbers.
- Track the churn rate monthly to see whether the recommended actions are working.
- Test a simple retention campaign on one at-risk group and compare it with a group that did not receive it.

## Files in this project

| File | What it contains |
|---|---|
| `README.md` | This overview |
| `requirements.md` | Stakeholders, business questions, requirements and user stories |
| `01_create_table.sql` | Table setup and data checks |
| `02_analysis_queries.sql` | SQL queries answering each business question |
| `dashboard_plan.md` | Power BI pages, visuals and measures |

## About me

I'm an MSc Financial Technology student at the University of Salford with a background in SME banking, looking for a business analyst placement from May 2027.

[Connect with me on LinkedIn](https://www.linkedin.com/in/aishat-abolore-sadiq-1b8872187/)
