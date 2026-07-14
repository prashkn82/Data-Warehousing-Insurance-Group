# 📊 Sample Report Output

> Mock Business Objects report outputs, built from the sample dataset in `sample_table_data.md`, illustrating what each report looks like when rendered in WebI.

> ⚠️ All data below is **fictional sample output** for demonstration purposes only.

---

## 👤 Customer Profile Report

**Customer: Sarah Bennett (C001)**

| Field | Value |
|---|---|
| Address | 88 Oak Ave, Chicago |
| Phone | 555-0101 |
| Active Policy | P001 — Auto |
| Premium Paid | $1,200 |
| Total Claims Filed | 1 |
| Total Claim Amount | $3,200 |
| Net Contribution | −$2,000 |
| Risk Category | 🟡 Medium |

---

## 📋 Policy Performance Report

| Policy ID | Type | Status | Premium | Coverage | Duration (mo) | Agent |
|---|---|---|---|---|---|---|
| P001 | Auto | Active | $1,200 | $25,000 | 12 | John Carter |
| P002 | Health | Active | $4,800 | $100,000 | 12 | Maria Lopez |
| P003 | Life | Active | $3,200 | $250,000 | 24 | John Carter |
| P004 | Property | Lapsed | $2,100 | $180,000 | 12 | David Kim |

**Summary:** Total premium collected = **$11,300** across 4 policies · Average coverage = **$138,750**

---

## 💰 Claim Summary Report

| Claim ID | Category | Severity | Amount | Settlement (days) | Customer |
|---|---|---|---|---|---|
| CL001 | Auto Accident | 🟡 Medium | $3,200 | 18 | Sarah Bennett |
| CL002 | Medical Treatment | 🔴 High | $12,500 | 34 | Michael Chen |
| CL003 | Property Damage | 🟢 Low | $850 | 9 | Robert Wilson |

**Summary:** Total claim payout = **$16,550** · Average settlement duration = **20 days**

> ⚠️ CL002 (Medical Treatment) is flagged as **high severity** and **longest settlement duration** — highlighted for claims team review.

---

## 🧑‍💼 Agent Productivity Report

| Agent | Region | Policies Sold | Premium Generated | Performance |
|---|---|---|---|---|
| John Carter | Midwest | 2 | $4,400 | 🟢 High |
| Maria Lopez | South | 1 | $4,800 | 🟡 Medium |
| David Kim | West | 1 | $2,100 | 🟢 High |

**Top Performer (by premium):** Maria Lopez — $4,800 generated from a single high-value Health policy

---

## 📈 Premium Trend Dashboard (Tabular View)

| Month | Premium Collected |
|---|---|
| January 2024 | $1,200 |
| March 2024 | $4,800 |
| June 2024 | $3,200 |
| September 2024 | $2,100 |

**Quarterly Rollup:**

| Quarter | Total Premium |
|---|---|
| Q1 2024 | $6,000 |
| Q2 2024 | $3,200 |
| Q3 2024 | $2,100 |
| Q4 2024 | $0 |

> See `sample_dashboard_visual.svg` for the chart version of this trend.

---

## 🧾 Notes on This Sample Output

- All figures are derived directly from the sample dataset in `sample_table_data.md`
- Real report output in WebI would include interactive drill-down, prompts, and conditional formatting — not shown in this static markdown mockup
- Use this file as a **reference for expected report shape** when validating actual BO report builds
