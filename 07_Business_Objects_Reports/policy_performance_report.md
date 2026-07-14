# 📋 Policy Performance Report

> Evaluates how insurance policies perform across time, regions, agents, and customer segments.

---

## 1️⃣ Report Purpose

The **Policy Performance Report** evaluates how insurance policies perform across **time, regions, agents, and customer segments**. It helps business teams understand premium trends, policy durations, coverage effectiveness, and overall profitability.

> This report is a **core analytical asset** in the Data Warehousing Insurance Group project.

---

## 2️⃣ Data Sources Used

| Source | Provides |
|---|---|
| `Policy_Fact` | Premium amounts, coverage, policy duration |
| `Policy_Dim` | Policy type, status, attributes |
| `Customer_Dim` | Customer demographics and SCD Type 2 history |
| `Agent_Dim` | Agent performance and region |
| `Date_Dim` | Calendar hierarchy for policy start and end dates |

---

## 3️⃣ Key Report Sections

### 🅰️ Policy Summary Overview
- Total active policies
- Policy types (Life, Auto, Health, Property)
- Policy status distribution (Active, Inactive, Lapsed)
- Average premium amount
- Average coverage amount

### 🅱️ Premium Trend Analysis
- Monthly premium collection
- Quarterly premium growth
- Year-over-year premium comparison
- Region-wise premium contribution

### 🅲️ Policy Duration Insights
- Average policy duration
- Short-term vs long-term policy distribution
- Duration trends by policy type

### 🅳️ Agent Performance Contribution
- Policies sold per agent
- Premium generated per agent
- Region-wise agent ranking

### 🅴️ Customer Segment Analysis
- Premium contribution by customer demographics
- Policy type preference by age group
- High-value customer segments

---

## 4️⃣ BO Features Used in This Report

| Feature | Details |
|---|---|
| 🔽 Drill-down | Policy → customer → agent |
| 🎛️ Prompts | Policy type, region, agent, date range |
| 📊 Charts & graphs | Premium trends |
| 🧮 Cross-tab tables | Multi-dimensional analysis |
| 🎨 Conditional formatting | High-premium policies, lapsed policies, underperforming regions |

---

## 5️⃣ Sample BO Query Logic (Semantic Layer)

**Policy → Fact Join**
```sql
Policy_Dim.policy_key = Policy_Fact.policy_key
```

**Policy → Customer Join**
```sql
Policy_Fact.customer_key = Customer_Dim.customer_key
```

**Policy → Agent Join**
```sql
Policy_Fact.agent_key = Agent_Dim.agent_key
```

**Date Dimension Join**
```sql
Policy_Fact.date_key = Date_Dim.date_key
```

---

## 6️⃣ Business Value

The Policy Performance Report helps:

- 💰 Identify profitable policy types
- 🗺️ Detect underperforming regions
- 📈 Understand premium growth trends
- 💡 Support pricing and underwriting decisions
- 🧑‍💼 Improve agent productivity
- 🎯 Optimize policy portfolio strategy

> It is widely used by **underwriting, finance, and sales teams**. 🚀
