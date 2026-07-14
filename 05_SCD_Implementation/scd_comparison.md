# ⚖️ SCD Comparison (Type 1 vs Type 2 vs Type 3)

> A practical, side-by-side comparison of how each SCD type was applied in the **Insurance Data Warehouse**.

---

## 📌 Quick Summary

| Feature | Type 1 | Type 2 | Type 3 |
|---|---|---|---|
| **History Maintained** | ❌ No | ✅ Full | 🟡 Partial (1 prior value) |
| **Storage Required** | 🟢 Low | 🔴 High | 🟡 Medium |
| **ETL Complexity** | 🟢 Low | 🟡 Medium | 🟢 Low |
| **Typical Use Case** | Corrections | Full history | Last change only |
| **DW Impact** | Fast, simple | Accurate historical reporting | Limited analytics |

---

## 1️⃣ Introduction

**Slowly Changing Dimensions (SCD)** define how changes in dimension attributes are handled over time.

In the Data Warehousing Insurance Group project, **all three SCD types** were used depending on business requirements. This document compares **Type 1, Type 2, and Type 3** in a clear, practical way — with real before/after examples.

---

## 2️⃣ SCD Type 1 — Overwrite Changes

**Definition:** Overwrites old values with new values. **No historical tracking.**

```
BEFORE:  CUST_ID=101   PHONE=555-0100
AFTER:   CUST_ID=101   PHONE=555-9999   ← old value is gone
```

**Best For**
- Data corrections
- Non-critical attributes
- Standardizing codes

**Example:** Customer changes phone number → old number is replaced.

---

## 3️⃣ SCD Type 2 — Full History Tracking

**Definition:** Creates a **new record** for every change. Maintains **complete historical data**.

```
CUST_ID | CITY        | EFFECTIVE_START | EFFECTIVE_END | CURRENT_FLAG
101     | Chicago     | 2022-01-01       | 2023-06-14    | N
101     | Austin      | 2023-06-15       | NULL          | Y
```

**Best For**
- Customer address changes
- Policy coverage updates
- Agent region changes

**Example:** Customer moves to a new city → old record is closed, new record inserted.

---

## 4️⃣ SCD Type 3 — Limited History

**Definition:** Stores only the **previous value** along with the current value.

```
POLICY_ID | CURRENT_STATUS | PREVIOUS_STATUS
P-2048    | ACTIVE          | LAPSED
```

**Best For**
- Tracking only the last change
- Attributes where full history is not required

**Example:** Policy status changes → store current and previous status only.

---

## 5️⃣ Which One Should You Pick?

```
Do you need to see the value's full change history?
        │
        ├── No — just fix the data   →  Type 1
        │
        ├── Yes — every change matters →  Type 2
        │
        └── Only the last change matters → Type 3
```

---

## 6️⃣ How They Were Used in This Project

| Dimension | SCD Type Used | Reason |
|---|---|---|
| `Customer_Dim` | **Type 2** | Full history of address, phone, and demographic changes |
| `Policy_Dim` | **Mixed Type 1 & 2** | Critical attributes → Type 2; non-critical attributes → Type 1 |
| `Agent_Dim` | **Type 1** | Only the latest agent details are required |
| `Claim_Type_Dim` | **Type 1** | No historical tracking needed |

---

## 7️⃣ Trade-off at a Glance

| If you prioritize... | Choose |
|---|---|
| ⚡ Speed & simplicity | Type 1 |
| 📊 Complete audit trail | Type 2 |
| ⚖️ A middle ground | Type 3 |

---

## 8️⃣ Outcome

Using the **correct SCD type** ensures:

- ✅ Accurate historical reporting
- ✅ Reliable trend analysis
- ✅ Proper handling of insurance data changes
- ✅ Optimized storage and ETL performance

> SCD implementation is one of the **most important components** of a robust insurance data warehouse. 🚀
