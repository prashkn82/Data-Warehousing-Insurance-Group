# 📦 Export & Import Steps (Oracle 9i)

> Backup and restore procedures for the **Insurance Data Warehouse** using Oracle's `exp` and `imp` utilities.

---

## 1️⃣ Introduction

**Export** and **Import** utilities (`exp` and `imp`) are used to **back up and restore** Oracle schema objects, data, and metadata. These steps were performed as part of the **Data Warehousing Insurance Group** project to:

- 🔁 Migrate data between environments
- 💾 Maintain backup copies of warehouse tables

---

## 2️⃣ Export (EXP) — Backup Process

### 🔹 Step 1: Open Command Prompt
Navigate to the Oracle `BIN` directory:

```bash
cd C:\oracle\ora92\bin
```

### 🔹 Step 2: Perform Full User Export
Export the DW user schema:

```bash
exp dw_user/dw_password file=C:\backup\dw_user_backup.dmp log=C:\backup\dw_user_backup.log owner=dw_user
```

### 🔹 Step 3: Verify Export Log
Check the log file for:

- ✅ Successful table exports
- ✅ Constraint and index creation
- ⚠️ Any warnings or errors

---

## 3️⃣ Import (IMP) — Restore Process

### 🔹 Step 1: Create User (If Not Exists)

```sql
CREATE USER dw_user IDENTIFIED BY dw_password;
GRANT CONNECT, RESOURCE TO dw_user;
```

### 🔹 Step 2: Start Import

```bash
imp dw_user/dw_password file=C:\backup\dw_user_backup.dmp log=C:\backup\dw_user_import.log fromuser=dw_user touser=dw_user
```

### 🔹 Step 3: Resolve Object Conflicts
If tables already exist:

```bash
imp dw_user/dw_password file=C:\backup\dw_user_backup.dmp ignore=y
```

> 💡 **Note:** `ignore=y` allows the import to continue even if objects already exist.

---

## 4️⃣ Common Export/Import Options

<table>
<tr>
<th>📤 Export Options</th>
<th>📥 Import Options</th>
</tr>
<tr>
<td>

```bash
tables=(policy_dim,claim_fact)
compress=n
buffer=100000
```

</td>
<td>

```bash
rows=y
indexes=y
constraints=y
grants=y
```

</td>
</tr>
</table>

---

## 5️⃣ Verification After Import

Run **SQL\*PLUS** checks to confirm a successful import:

| Check | Query |
|---|---|
| 🔢 Table Count | `select count(*) from policy_dim;` <br> `select count(*) from claim_fact;` |
| 🔒 Constraints | `select constraint_name, status from user_constraints;` |
| 📇 Indexes | `select index_name, status from user_indexes;` |

---

## 6️⃣ Outcome

The export/import process ensures **reliable backup and migration** of the insurance data warehouse schema.

> These steps were used throughout **development, testing, and deployment** of the DW environment. ✅
