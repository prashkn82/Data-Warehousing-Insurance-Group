# 🕘 Slowly Changing Dimensions (SCD) Explained

> How the **Insurance Data Warehouse** captures and preserves historical changes in customer, policy, and agent data.

---

## 1️⃣ Introduction

**Slowly Changing Dimensions (SCD)** are essential for maintaining historical accuracy in a data warehouse — insurance data such as **customer details, policy attributes, and agent information** changes over time.

SCD techniques ensure that these changes are captured correctly for **reporting and trend analysis**.

This file explains **SCD Types 1, 2, and 3**, all of which were implemented in the Data Warehousing Insurance Group project.

---

## 2️⃣ Why SCD Matters in Insurance DW

Insurance operations rely heavily on **historical tracking**:

- 🏠 Customer address changes
- 📋 Policy status updates
- 💳 Premium adjustments
- 🏷️ Claim category reclassification

> ⚠️ Without SCD, reports would display **incorrect historical values**, resulting in inaccurate business insights.

---

## 3️⃣ SCD Type 1 — Overwrite Changes

**Definition:** Updates the existing record by overwriting old values. **No history is maintained.**

BEFORE:  CUST_ID=101   PHONE=555-0100
AFTER:   CUST_ID=101   PHONE=555-9999   ← old value gone forever

**Use Cases**
- Correcting data errors
- Updating non-critical attributes
- Standardising codes or descriptions

**Example:** Customer changes phone number → old number is replaced.

| ✅ Pros | ❌ Cons |
|---|---|
| Simple | No historical tracking |
| Fast | Cannot audit past values |
| Minimal storage | Not suitable for trend analysis |

---

## 4️⃣ SCD Type 2 — Full History Tracking

**Definition:** Creates a **new record** whenever a change occurs. Maintains **complete historical data**.

CUST_ID | ADDRESS        | EFFECTIVE_START | EFFECTIVE_END | CURRENT_FLAG
101     | 12 Elm St      | 2022-01-01       | 2023-06-14    | N
101     | 88 Oak Ave     | 2023-06-15       | NULL          | Y

**Use Cases**
- Customer address changes
- Policy coverage updates
- Agent region changes

**Common Columns**
- `effective_start_date`
- `effective_end_date`
- `current_flag`

| ✅ Pros | ❌ Cons |
|---|---|
| Full historical accuracy | More storage |
| Ideal for analytical reporting | More ETL complexity |
| Supports point-in-time queries |Requires surrogate keys |

---

## 5️⃣ SCD Type 3 — Limited History

**Definition:** Stores only the **previous value** along with the current value.

CUST_ID | CURRENT_POLICY_STATUS | PREVIOUS_POLICY_STATUS
101     | ACTIVE                 | LAPSED

**Use Cases**
- Tracking only the last change
- Attributes where a full history is not required

**Example Columns**
- `current_policy_status`
- `previous_policy_status`

| ✅ Pros | ❌ Cons |
|---|---|
| Less storage than Type 2 | Only one level of history |
| Simple to implement | |

---

## 6️⃣ SCD Comparison Table

| SCD Type | History Maintained | Storage | Complexity | Best For |
|---|---|---|---|---|
| **Type 1** | ❌ No | 🟢 Low | 🟢 Low | Corrections, non-critical changes |
| **Type 2** | ✅ Full | 🔴 High | 🟡 Medium | Customer, Policy, Agent history |
| **Type 3** | 🟡 Partial | 🟡 Medium | 🟢 Low | Limited historical tracking |

---

## 7️⃣ Which SCD Type Should You Use?**

<img width="627" height="215" alt="image" src="https://github.com/user-attachments/assets/0cc2481f-8f55-4843-9019-91f649d9c1e2" />


---

**Outcome**

SCD implementation ensures that the insurance data warehouse **accurately reflects historical changes**. This enables:

- 📈 Trend analysis
- 👤 Customer behavior tracking
- 📋 Policy evolution reporting
- 🎯 Accurate claim analytics

> SCD is a **core component** of reliable insurance data warehousing. 🚀
