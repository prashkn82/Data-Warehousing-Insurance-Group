# 🧑‍💼 Agent Productivity Report

> Evaluates how effectively insurance agents contribute to policy sales, premium generation, and claim handling.

---

## 1️⃣ Report Purpose

The **Agent Productivity Report** evaluates how effectively insurance agents contribute to **policy sales, premium generation, and claim handling**. It helps management identify high-performing agents, underperforming regions, and opportunities for training or resource allocation.

> This report is a **key operational and performance-tracking tool** in the Data Warehousing Insurance Group project.

---

## 2️⃣ Data Sources Used

| Source | Provides |
|---|---|
| `Agent_Dim` | Agent name, region, performance rating |
| `Policy_Fact` | Policies sold, premium amounts, coverage amounts |
| `Policy_Dim` | Policy type, status, attributes |
| `Claim_Fact` | Claims handled by agents (if applicable) |
| `Date_Dim` | Calendar hierarchy for policy start dates |

---

## 3️⃣ Key Report Sections

### 🅰️ Agent Performance Overview
- Total policies sold
- Total premium generated
- Region-wise performance
- Active vs inactive agents
- Performance rating distribution

### 🅱️ Premium Contribution Analysis
- Premium generated per agent
- Premium trends over months/quarters
- Comparison across regions
- High-value agents

### 🅲️ Policy Sales Insights
- Policies sold by type (Life, Auto, Health, Property)
- Policy status distribution
- Average coverage amount per agent
- Policy duration trends

### 🅳️ Regional Productivity Comparison
- Region-wise agent ranking
- Premium contribution by region
- Policy count by region
- Underperforming vs high-performing regions

### 🅴️ Claim Handling Efficiency *(if applicable)*
- Claims handled per agent
- Average settlement duration
- High-severity claim involvement
- Claim resolution efficiency

---

## 4️⃣ BO Features Used in This Report

| Feature | Details |
|---|---|
| 🔽 Drill-down | Region → agent → policy |
| 🎛️ Prompts | Region, agent, policy type, date range |
| 📊 Charts & graphs | Productivity trends |
| 🧮 Cross-tab tables | Multi-dimensional analysis |
| 🎨 Conditional formatting | High-performing agents, low-performing regions, high-premium contributors |

---

## 5️⃣ Sample BO Query Logic (Semantic Layer)

**Agent → Policy Join**
```sql
Agent_Dim.agent_key = Policy_Fact.agent_key
```

**Policy → Policy Dimension Join**
```sql
Policy_Fact.policy_key = Policy_Dim.policy_key
```

**Date Dimension Join**
```sql
Policy_Fact.date_key = Date_Dim.date_key
```

---

## 6️⃣ Business Value

The Agent Productivity Report helps:

- 🏆 Identify top-performing agents
- ⚠️ Detect underperforming regions
- 🎯 Optimize resource allocation
- 💰 Support incentive and bonus decisions
- 📈 Improve sales strategy
- 🎓 Enhance agent training programs

> It is widely used by **sales leadership, regional managers, and executive teams**. 🚀
