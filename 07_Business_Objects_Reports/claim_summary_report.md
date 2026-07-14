# 💰 Claim Summary Report

> A consolidated view of all insurance claims filed by customers.

---

## 1️⃣ Report Purpose

The **Claim Summary Report** provides a consolidated view of all insurance claims filed by customers. It helps claims teams, underwriting, and management analyse **claim frequency, severity, settlement duration, and financial impact**.

> This report is one of the **most critical analytical outputs** in the Data Warehousing Insurance Group project.

---

## 2️⃣ Data Sources Used

| Source | Provides |
|---|---|
| `Claim_Fact` | Claim amount, settlement duration, claim date |
| `Claim_Type_Dim` | Claim category, severity level, description |
| `Customer_Dim` | Customer demographics and SCD Type 2 history |
| `Policy_Dim` | Policy type, coverage, status |
| `Date_Dim` | Calendar hierarchy for claim dates |

---

## 3️⃣ Key Report Sections

### 🅰️ Claim Overview
- Total claims filed
- Total claim amount
- Average claim amount
- Claim severity distribution
- Claim category breakdown

### 🅱️ Claim Frequency Analysis
- Claims per customer
- Claims per policy
- Claims per region
- Monthly and yearly claim trends

### 🅲️ Claim Severity Insights
- 🔴 High-severity claims
- 🟡 Medium-severity claims
- 🟢 Low-severity claims
- Severity-wise financial impact

### 🅳️ Settlement Duration Analysis
- Average settlement duration
- Long-pending claims
- Fast-settled claims
- Duration trends by claim category

### 🅴️ Financial Impact Summary
- Total claim payout
- Net loss ratio
- High-impact claim categories
- Region-wise claim cost distribution

---

## 4️⃣ BO Features Used in This Report

| Feature | Details |
|---|---|
| 🔽 Drill-down | Claim → customer → policy |
| 🎛️ Prompts | Claim category, severity, region, date range |
| 📊 Charts & graphs | Claim trends |
| 🧮 Cross-tab tables | Multi-dimensional analysis |
| 🎨 Conditional formatting | High-severity claims, long settlement durations, high-cost categories |

---

## 5️⃣ Sample BO Query Logic (Semantic Layer)

**Claim → Customer Join**
```sql
Claim_Fact.customer_key = Customer_Dim.customer_key
```

**Claim → Policy Join**
```sql
Claim_Fact.policy_key = Policy_Dim.policy_key
```

**Claim → Claim Type Join**
```sql
Claim_Fact.claim_type_key = Claim_Type_Dim.claim_type_key
```

**Date Dimension Join**
```sql
Claim_Fact.date_key = Date_Dim.date_key
```

---

## 6️⃣ Business Value

The Claim Summary Report helps:

- ⚠️ Identify high-risk customers
- 💸 Detect costly claim categories
- ⏱️ Understand settlement efficiency
- 🕵️ Support fraud detection
- 💡 Improve underwriting and pricing strategies
- 📊 Provide management with clear claim trends

> It is one of the **most important reports** for claims and risk management teams. 🚀
