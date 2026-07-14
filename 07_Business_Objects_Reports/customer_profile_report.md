# 👤 Customer Profile Report

> A consolidated, 360-degree view of each insurance customer.

---

## 1️⃣ Report Purpose

The **Customer Profile Report** provides a consolidated, **360-degree view** of each insurance customer. It combines data from multiple dimensions and fact tables to help business users analyze customer demographics, policy history, claim activity, and overall engagement.

> This is one of the **most frequently used** Business Objects reports in the Data Warehousing Insurance Group project.

---

## 2️⃣ Data Sources Used

| Source | Provides |
|---|---|
| `Customer_Dim` | Customer demographics, address, phone, SCD Type 2 history |
| `Policy_Fact` | Premium amounts, coverage, policy duration |
| `Policy_Dim` | Policy type, status, attributes |
| `Claim_Fact` | Claim amounts, settlement durations |
| `Claim_Type_Dim` | Claim category and severity |
| `Date_Dim` | Calendar hierarchy for policy and claim dates |

---

## 3️⃣ Key Report Sections

### 🅰️ Customer Demographics
- Full name
- Gender
- Address
- Phone number
- Region
- Current vs historical records (SCD Type 2)

### 🅱️ Policy Summary
- Active policies
- Policy type
- Premium amount
- Coverage amount
- Policy duration
- Policy status (Active, Inactive, Lapsed)

### 🅲️ Claim Summary
- Total claims filed
- Claim categories
- Claim severity
- Claim amounts
- Settlement durations
- Year-wise claim distribution

### 🅳️ Customer Lifetime Value (CLV) Indicators

Derived metrics:

- 💰 Total premium paid
- 💸 Total claim amount
- 📊 Net contribution
- ⚠️ Risk category (based on claim frequency)

---

## 4️⃣ BO Features Used in This Report

| Feature | Details |
|---|---|
| 🔽 Drill-down | Customer → policy → claim |
| 🎛️ Prompts | Customer ID, region, policy status, date range |
| 🧮 Cross-tab tables | Year-wise analysis |
| 📊 Charts | Premium and claim trends |
| 🎨 Conditional formatting | High-risk customers |

---

## 5️⃣ Sample BO Query Logic (Semantic Layer)

**Customer → Policy Join**
```sql
Customer_Dim.customer_key = Policy_Fact.customer_key
```

**Policy → Claim Join**
```sql
Policy_Fact.policy_key = Claim_Fact.policy_key
```

**Date Dimension Join**
```sql
Claim_Fact.date_key = Date_Dim.date_key
```

---

## 6️⃣ Business Value

The Customer Profile Report helps:

- 💎 Identify high-value customers
- ⚠️ Detect high-risk customers
- 🧠 Understand customer behavior
- 💡 Support underwriting decisions
- 🤝 Improve customer retention strategies

> It is a **core operational and analytical report** used by underwriting, claims, and customer service teams. 🚀
