# 🧮 Expression Transformation

> Row-level data cleansing, derivation, and business rule logic in **Informatica PowerCenter**.

---

## 1️⃣ Introduction

The **Expression Transformation** is one of the most frequently used components in Informatica PowerCenter. It allows **row-level manipulation** of data, enabling cleansing, formatting, derivation, and application of business rules before loading data into the warehouse.

This transformation plays a **crucial role** in the Data Warehousing Insurance Group project, especially for preparing **policy, customer, and claims data**.

---

## 2️⃣ Key Use Cases

| Use Case | Description |
|---|---|
| 🧹 Data Cleansing | Removing unwanted characters, trimming spaces, correcting formats |
| 🏗️ Data Derivation | Creating new fields such as full names, age, policy duration, claim category |
| 🔀 Conditional Logic | Applying `IIF` statements to categorize or validate data |
| 📅 Date Formatting | Converting legacy date formats into warehouse-standard formats |
| 📋 Business Rule Implementation | Mapping raw values to standardized insurance codes |

---

## 3️⃣ Common Functions Used

| Function | Purpose |
|---|---|
| `IIF()` | Conditional logic |
| `LTRIM()`, `RTRIM()`, `TRIM()` | Space removal |
| `TO_DATE()` | Date conversion |
| `UPPER()`, `LOWER()` | Case formatting |
| `SUBSTR()` | Extracting parts of strings |
| `REPLACE()` | Value substitution |

---

## 4️⃣ Sample Expression Logic

### 🔹 Full Name Creation
```sql
FULL_NAME = FIRST_NAME || ' ' || LAST_NAME
```

### 🔹 Policy Status Standardization
```sql
POLICY_STATUS_STD = IIF(POLICY_STATUS = 'A', 'ACTIVE',
                        IIF(POLICY_STATUS = 'I', 'INACTIVE', 'UNKNOWN'))
```

### 🔹 Claim Age Calculation
```sql
CLAIM_AGE = SYSDATE - CLAIM_DATE
```

### 🔹 Date Format Conversion
```sql
POLICY_START_DT = TO_DATE(POLICY_START_RAW, 'MM/DD/YYYY')
```

---

## 5️⃣ Best Practices

- ✅ Keep expressions **simple and readable**
- ✅ Use **comments** inside the transformation for clarity
- ✅ Avoid **overly complex nested `IIF`** statements
- ✅ Validate output using **session logs and SQL\*PLUS**
- ✅ Standardize **date and numeric formats** across all mappings

---

## 6️⃣ Outcome

The Expression Transformation ensures that all insurance data entering the warehouse is **clean, standardized, and ready** for analytical processing.

> It forms the **foundation** for accurate reporting and reliable ETL workflows. 🚀
