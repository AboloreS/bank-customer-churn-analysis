# Bank Customer Churn Analysis

A business analysis case study: understanding why customers leave a bank, and what the bank can do about it.

**Tools:** SQL (SQLite) · Microsoft Power BI
**Skills shown:** requirements gathering · user stories · data analysis · dashboard design · business recommendations

---

## 1. Business problem

A retail bank is losing customers. It also records customer complaints and satisfaction scores, which may help explain why. Each customer who leaves takes their balance with them and costs the bank the price of winning a replacement. The bank's management wants to know:

- How many customers are leaving?
- Which customers are most likely to leave?
- What should the bank do to keep them?

## 2. Approach

I approached this as a business analyst would on a real project:

1. **Understood the need.** I identified the stakeholders and wrote down what each of them needs to know. See the [requirements document](requirements.md).
2. **Wrote user stories** to keep the analysis focused on decisions people will actually make.
3. **Explored the data in SQL** to answer each business question. See the [SQL queries](02_analysis_queries.sql).
4. **Designed a Power BI dashboard** so stakeholders can explore the findings themselves (in progress). See the [dashboard plan](dashboard_plan.md).
5. **Turned the findings into recommendations** the bank can act on.

## 3. Data

- **Source:** Bank Customer Churn dataset (Kaggle), file `Customer-Churn-Records.csv`
- **Size:** 10,000 customers, 18 columns
- **Key fields:** country, gender, age, tenure, balance, number of products, active member, complaints, satisfaction score, card type, loyalty points, and whether the customer left
- This is a public dataset. It contains no real customer data from any bank I have worked for.

## 4. Key findings

**1. One in five customers left, and they took a quarter of the money.**
2,038 of 10,000 customers left (20.4%). They held 185.7 million of the bank's 764.9 million in balances (24.3%), so the bank is losing more value than customers.

**2. Customers with exactly two products are the most loyal.**

| Products held | Customers | Churn rate |
|---|---|---|
| 1 | 5,084 | 27.7% |
| 2 | 4,590 | **7.6%** |
| 3 | 266 | 82.7% |
| 4 | 60 | 100.0% |

Moving from one product to two goes with much lower churn, but customers with three or four products almost all leave. The 3- and 4-product groups are small, but the pattern is strong.

**3. Churn rises sharply with age.**
Under 30: 7.6% · 30–39: 10.9% · 40–49: 30.8% · **50–59: 56.0%** · 60+: 28.0%

More than half of customers in their 50s left.

**4. Germany has double the churn of France and Spain.**
Germany 32.4% · Spain 16.7% · France 16.2%. Inactive customers in Germany leave at **41.1%**, the highest of any country and activity group.

**5. Inactive customers leave at nearly twice the rate of active ones.**
Inactive 26.9% · Active 14.3%. This holds in every country.

**6. Women leave more often than men.**
Women 25.1% · Men 16.5%.

**7. 1,584 high-value customers are at risk right now.**
These customers are still with the bank but are inactive and hold balances over 100,000. Together they hold **210.6 million**, more than the bank has already lost to churn.

**8. Some factors made little difference.**
Credit score (19.5–23.7%), years with the bank (17.2–23.0%), satisfaction score (19.6–21.8%), card type (19.3–21.8%) and loyalty points (19.4–21.4%) all show churn close to the 20.4% average.

### A note on the data

Complaints match churn almost exactly: 2,034 of the 2,044 customers who complained left (99.5%), and only 4 of the 7,956 who did not complain left. A real early-warning signal would rarely be this exact. The dataset does not record when complaints were made, so they were most likely logged as customers left. That means complaints cannot help the bank spot at-risk customers in advance, and I have not used them as a driver of churn.

It is also surprising that satisfaction scores show no link to churn. On a real project, I would ask the data owners how and when both fields are collected before relying on them.

## 5. Recommendations

1. **Call the 1,584 high-value inactive customers first.** Give relationship managers this list, starting with Germany and customers aged 40–59, where churn is highest. Together they hold 210.6 million in balances.
2. **Help single-product customers take up a second product.** Customers with two products leave at 7.6%, compared with 27.7% for those with one. Offer a second product that fits their needs.
3. **Review how three- and four-product bundles are sold.** Almost all of these customers leave. Check whether they were sold products they did not need, and whether the bundles meet customer needs.
4. **Find out why German customers leave.** Gather feedback from customers in Germany, and compare pricing, service and competitor offers with France and Spain.
5. **Re-engage inactive customers and design for customers in their 40s and 50s.** Use reminders and offers to bring inactive customers back, and look at products for this age group, such as savings and retirement planning.
6. **Improve complaint data.** Record the date and reason for every complaint, so complaints can flag risk before customers leave rather than after.

## 6. What I would do next

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
