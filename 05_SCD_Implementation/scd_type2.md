# 🕘 SCD Type 2 — Full History Tracking

> Every change creates a new record — complete historical accuracy is preserved.

---

## 📌 Summary

| Aspect | Detail |
|---|---|
| History | ✅ Full |
| Storage Impact | 🔴 High |
| ETL Complexity | 🟡 Medium |
| Best For | Customer address, policy coverage, agent region changes |

---

## 1️⃣ How It Works

When a change is detected:

1. 🔒 **Close** the existing record (`effective_end_dt = SYSDATE`, `current_flag = 'N'`)
2. ➕ **Insert** a new record with the updated values (`current_flag = 'Y'`)

```
CUST_ID | CITY        | EFFECTIVE_START | EFFECTIVE_END | CURRENT_FLAG
101     | Chicago     | 2022-01-01       | 2023-06-14    | N
101     | Austin      | 2023-06-15       | NULL          | Y
```

---

## 2️⃣ Check If Record Exists

```sql
SELECT customer_key,
       first_name,
       last_name,
       gender,
       address,
       phone_number,
       effective_start_dt,
       effective_end_dt,
       current_flag
FROM   customer_dim
WHERE  customer_id  = :src_customer_id
AND    current_flag = 'Y';
```

---

## 3️⃣ Close the Existing Record

```sql
UPDATE customer_dim
SET    effective_end_dt = SYSDATE,
       current_flag     = 'N'
WHERE  customer_id       = :src_customer_id
AND    current_flag      = 'Y';
```

---

## 4️⃣ Insert the New Record

```sql
INSERT INTO customer_dim (
    customer_key,
    customer_id,
    first_name,
    last_name,
    gender,
    address,
    phone_number,
    effective_start_dt,
    effective_end_dt,
    current_flag
)
VALUES (
    customer_seq.NEXTVAL,
    :src_customer_id,
    :new_first_name,
    :new_last_name,
    :new_gender,
    :new_address,
    :new_phone_number,
    SYSDATE,
    TO_DATE('31-DEC-9999', 'DD-MON-YYYY'),
    'Y'
);
```

---

## 5️⃣ Policy Dimension — Type 2 Logic

```sql
UPDATE policy_dim
SET    effective_end_dt = SYSDATE,
       current_flag     = 'N'
WHERE  policy_id         = :src_policy_id
AND    current_flag      = 'Y';

INSERT INTO policy_dim (
    policy_key,
    policy_id,
    policy_type,
    policy_status,
    coverage_amount,
    premium_amount,
    effective_start_dt,
    effective_end_dt,
    current_flag
)
VALUES (
    policy_seq.NEXTVAL,
    :src_policy_id,
    :new_policy_type,
    :new_policy_status,
    :new_coverage_amount,
    :new_premium_amount,
    SYSDATE,
    TO_DATE('31-DEC-9999', 'DD-MON-YYYY'),
    'Y'
);
```

---

## ✅ Key Notes

- SCD Type 2 maintains **full history**
- Every change creates a **new record**
- `current_flag = 'Y'` marks the **active** record
- `effective_end_dt = 31-DEC-9999` represents **"still active"**
