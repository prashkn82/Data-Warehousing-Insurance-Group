# 📊 Business Problem

## 1️⃣ Background

Insurance companies typically operate **multiple systems** for policy management, claims processing, customer information, and financial transactions. These systems often store data in **different formats, databases, and legacy applications**, making it difficult to achieve **unified reporting and analytics**.

---

## 2️⃣ Key Challenges

### 🧩 Data Fragmentation
Information is scattered across various operational systems, leading to **inconsistent and incomplete views** of customers and policies.

### 🕒 Lack of Historical Tracking
Traditional **OLTP systems overwrite old data**, making it impossible to analyze historical changes in customer profiles, policy updates, or claim statuses.

### 🐢 Slow and Manual Reporting
Business teams rely on **manual data extraction and spreadsheets**, resulting in delays and errors in decision-making.

### 🔀 No Single Source of Truth
Different departments maintain their **own datasets**, causing discrepancies in reports and KPIs.

### 📉 Limited Analytical Capability
Without a centralized warehouse, **advanced analytics** — such as trend analysis, risk assessment, and performance monitoring — become difficult.

| Challenge | Impact |
|---|---|
| Data Fragmentation | Inconsistent, incomplete views |
| No Historical Tracking | Cannot analyze trends over time |
| Manual Reporting | Delays and errors |
| No Single Source of Truth | Conflicting KPIs across teams |
| Limited Analytics | Poor risk & performance visibility |

---

## 3️⃣ Business Need

The insurance organization requires a **centralized data warehouse** that can:

- ✅ Integrate data from multiple **heterogeneous sources**
- ✅ Maintain **historical records** using SCD techniques
- ✅ Provide **accurate and consistent** reporting
- ✅ Support **analytical dashboards** for business decision-making
- ✅ Improve **operational efficiency** and reduce manual effort

---

## 4️⃣ Solution Overview

This project delivers a **complete data warehousing solution** using:

| Component | Technology |
|---|---|
| 🗄️ Backend Storage | Oracle 9i |
| 🔄 ETL Workflows | Informatica PowerCenter |
| 📈 Reporting & Analytics | Business Objects |
| 🏗️ Data Modeling | Dimensional Modeling |
| 🕘 Historical Tracking | SCD Types 1, 2, 3 |

> **Result:** A **unified, reliable, and scalable** data warehouse that supports the insurance group's analytical and reporting needs. 🚀
