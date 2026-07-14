# ⏳ SCD Type 3 — Limited History

> Stores only the current and previous value — no full history, no new rows.

---

## 📌 Summary

| Aspect | Detail |
|---|---|
| History | 🟡 Partial (1 prior value only) |
| Storage Impact | 🟡 Medium |
| ETL Complexity | 🟢 Low |
| Best For | Tracking only the last change (e.g. policy status, agent region) |

---

## 1️⃣ How It Works

Unlike Type 2, **no new row is inserted**. The existing row is updated in place — the current value shifts into a `previous_*` column, and the new value replaces it.

```
POLICY_ID | CURRENT_STATUS | PREVIOUS_STATUS
P-2048    | ACTIVE          | LAPSED
```

---

## 2️⃣ Add Supporting Columns (One-Time Setup)

```sql
ALTER TABLE policy_dim ADD (
    current_policy_status    VARCHAR2(20),
    previous_policy_status   VARCHAR2(20)
);
```

---

## 3️⃣ Check Current Value Before Update

```sql
SELECT policy_id,
       current_policy_status,
       previous_policy_status
FROM   policy_dim
WHERE  policy_id = :src_policy_id;
```

---

## 4️⃣ Shift Current → Previous, Apply New Value

```sql
UPDATE policy_dim
SET    previous_policy_status = current_policy_status,
       current_policy_status  = :new_policy_status
WHERE  policy_id               = :src_policy_id;
```

---

## 5️⃣ Agent Dimension — Type 3 Logic

```sql
ALTER TABLE agent_dim ADD (
    current_region     VARCHAR2(50),
    previous_region    VARCHAR2(50)
);

UPDATE agent_dim
SET    previous_region = current_region,
       current_region  = :new_region
WHERE  agent_id         = :src_agent_id;
```

---

## 6️⃣ Verify the Change

```sql
SELECT policy_id,
       current_policy_status,
       previous_policy_status
FROM   policy_dim
WHERE  policy_id = :src_policy_id;
```

---

## ✅ Key Notes

- SCD Type 3 stores only **ONE** prior value, not full history
- **No new rows** are inserted — existing rows are updated in place
- Best suited for attributes where **only the last change matters**
- ⚠️ Cannot answer *"what was the value 3 changes ago"* — use **Type 2** for that
