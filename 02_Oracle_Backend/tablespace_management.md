# 🗄️ Tablespace Management Script

> Oracle 9i script to create tablespaces, the DW schema user, and required privileges for the **Insurance Data Warehouse** project.

---

## 1️⃣ Create Permanent Tablespace

Stores all **persistent insurance warehouse data** (fact/dimension tables).

```sql
CREATE TABLESPACE insurance_data
    DATAFILE               'C:\oracle\oradata\INSU_DW\insurance_data01.dbf'
    SIZE                    200M
    AUTOEXTEND              ON
    NEXT                    50M
    MAXSIZE                 UNLIMITED
    EXTENT MANAGEMENT       LOCAL
    SEGMENT SPACE MANAGEMENT AUTO;
```

---

## 2️⃣ Create Temporary Tablespace

Used for **sort operations, joins**, and temporary segments.

```sql
CREATE TEMPORARY TABLESPACE insurance_temp
    TEMPFILE    'C:\oracle\oradata\INSU_DW\insurance_temp01.dbf'
    SIZE         100M
    AUTOEXTEND   ON
    NEXT         20M
    MAXSIZE      UNLIMITED;
```

---

## 3️⃣ Create User for DW Project

Dedicated **schema owner** for the insurance data warehouse.

```sql
CREATE USER dw_user
    IDENTIFIED BY           dw_password
    DEFAULT TABLESPACE      insurance_data
    TEMPORARY TABLESPACE    insurance_temp;
```

---

## 4️⃣ Grant Required Privileges

Minimum privileges needed for **schema creation and ETL operations**.

```sql
GRANT CONNECT, RESOURCE      TO dw_user;
GRANT CREATE VIEW            TO dw_user;
GRANT UNLIMITED TABLESPACE   TO dw_user;
```

| Privilege | Purpose |
|---|---|
| `CONNECT, RESOURCE` | Basic login & object creation rights |
| `CREATE VIEW` | Allows creation of reporting views |
| `UNLIMITED TABLESPACE` | Removes storage quota restrictions |

---

## 5️⃣ Verify Tablespaces

Confirms tablespaces were created successfully and are **ONLINE**.

```sql
SELECT tablespace_name,
       status,
       contents
FROM   dba_tablespaces;
```

---

## 6️⃣ Verify Datafiles

Confirms datafile size and association with the correct tablespace.

```sql
SELECT file_name,
       tablespace_name,
       bytes / 1024 / 1024 AS size_mb
FROM   dba_data_files;
```

---

## ✅ Outcome

This script establishes the **storage foundation** of the Insurance Data Warehouse:

- 📦 Dedicated data & temp tablespaces
- 👤 A secure schema owner (`dw_user`)
- 🔐 Correctly scoped privileges
- 🔍 Built-in verification queries to confirm success
