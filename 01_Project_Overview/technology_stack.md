# 🛠️ Technology Stack

> A complete overview of the tools, platforms, and concepts powering the **Insurance Data Warehouse** project.

---

## 📌 Quick Summary

| Layer | Technology | Version |
|---|---|---|
| 🗄️ Database | Oracle | 9i R2 (9.2.0.1) |
| 🔄 ETL | Informatica PowerCenter | 7.0 |
| 📊 Reporting/BI | Business Objects | 5.0 |
| 💻 Query Interface | SQL\*PLUS | Oracle DB 9i |
| 🖥️ Platform | Windows | Windows Vista |

---

## 1️⃣ Database Technologies

### 🗄️ Oracle 9i R2 (9.2.0.1)
The **primary backend database** for the warehouse. Responsibilities include:

- 📦 Storing integrated insurance data
- 🧱 Managing schema objects, tablespaces, users & roles
- 💾 Performing backup and restore operations

### 💻 SQL\*PLUS
The command-line interface used for:

- ▶️ Executing SQL scripts
- ✅ Validating ETL loads
- 🔍 Performing ad-hoc data retrieval during development

---

## 2️⃣ ETL & Data Integration — Informatica PowerCenter 7.0

The **core ETL engine** responsible for extracting, cleansing, transforming, and loading heterogeneous insurance data into the warehouse.

### 🔧 Key Transformations Implemented

| Transformation | Icon | Purpose |
|---|---|---|
| Expression | 🧮 | Perform row-level calculations & derived fields |
| Lookup | 🔎 | Match and enrich data against reference tables |
| Filter | 🚦 | Apply conditional logic to include/exclude rows |
| Update Strategy | 🔁 | Drive **SCD Type 1 / 2 / 3** insert-update-delete logic |

---

## 3️⃣ Reporting & Analytics — Business Objects 5.0

Used to turn warehouse data into decision-ready insights:

- 📊 Analytical reports
- 📈 Executive dashboards
- 🧾 Insurance performance summaries

---

## 4️⃣ Data Warehousing Concepts

| Concept | Description |
|---|---|
| 🏗️ Dimensional Modeling | Star schema design for fast analytical queries |
| 📐 Fact & Dimension Tables | Core building blocks of the warehouse schema |
| 🕘 Slowly Changing Dimensions | SCD Types 1, 2 & 3 for tracking data changes |
| 📜 Historical Data Tracking | Preserves point-in-time accuracy for reporting |
| 🗂️ Metadata Management | Documents data lineage and structure |

---

## 5️⃣ Supporting Tools & Utilities

| Tool | Category | Purpose |
|---|---|---|
| 💾 RMAN / Cold Backup | Backup & Recovery | Protects Oracle database from data loss |
| 🚨 Alert Log Monitoring | Monitoring | Tracks database errors & health |
| 🔧 Workflow Manager & Monitor | Orchestration | Schedules and tracks Informatica ETL jobs |

---

## 6️⃣ Development Environment

```
OS:            Windows
Database:      Oracle 9i R2
ETL Tool:      Informatica PowerCenter 7.0
Query Tool:    SQL*PLUS
Reporting:     Business Objects 5.0
```

---

## 🧩 How the Stack Fits Together

```
   Source Systems  →  Informatica ETL  →  Oracle 9i Warehouse  →  Business Objects
  (Policy, Claims,     (Extract/Clean/       (Fact & Dim              (Reports &
   Customer, etc.)      Transform/Load)       Tables + SCD)            Dashboards)
```

> This layered stack ensures **reliable ingestion**, **accurate historical tracking**, and **fast, trustworthy reporting** across the insurance organization. 🚀
