# 🔁 SCD Type 1 — Overwrite Changes

> No history maintained — the existing dimension record is updated in place.

---

## 📌 Summary

| Aspect | Detail |
|---|---|
| History | ❌ Not maintained |
| Storage Impact | 🟢 Low |
| ETL Complexity | 🟢 Low |
| Best For | Corrections, non-critical attributes |

---

## 1️⃣ How It Works

When a change is detected in a dimension attribute, **SCD Type 1 overwrites** the existing record — the old value is lost permanently.

```
BEFORE:  CUST_ID=101   PHONE=555-0100
AFTER:   CUST_ID=101   PHONE=555-9999   ← old value gone
```

---

## 2️⃣ Customer Dimension Update

```sql
UPDATE customer_dim
SET
    first_name      = :new_first_name,
    last_name       = :new_last_name,
    gender          = :new_gender,
    address         = :new_address,
    phone_number    = :new_phone_number
WHERE customer_id   = :src_customer_id;
```

---

## 3️⃣ Policy Dimension Update

```sql
UPDATE policy_dim
SET
    policy_type       = :new_policy_type,
    policy_status     = :new_policy_status,
    coverage_amount   = :new_coverage_amount,
    premium_amount    = :new_premium_amount
WHERE policy_id       = :src_policy_id;
```

---

## 4️⃣ Agent Dimension Update

```sql
UPDATE agent_dim
SET
    agent_name            = :new_agent_name,
    region                = :new_region,
    performance_rating    = :new_performance_rating
WHERE agent_id            = :src_agent_id;
```

---

## ✅ Key Notes

- SCD Type 1 does **NOT** maintain history
- Old values are **overwritten permanently**
- Best used for **corrections** or **non-critical attributes**
