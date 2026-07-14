# 🧪 Sample Table Data

> Illustrative sample rows for the Insurance Data Warehouse fact and dimension tables, matching the schema in `insurance_dw_schema.sql`. Used as reference data for the sample report outputs.

> ⚠️ All names, IDs, and amounts below are **fictional sample data** for demonstration purposes only.

---

## 📅 `date_dim`

| date_key | full_date | day | month | month_name | quarter | year |
|---|---|---|---|---|---|---|
| 20240115 | 2024-01-15 | 15 | 1 | January | 1 | 2024 |
| 20240310 | 2024-03-10 | 10 | 3 | March | 1 | 2024 |
| 20240622 | 2024-06-22 | 22 | 6 | June | 2 | 2024 |
| 20240905 | 2024-09-05 | 5 | 9 | September | 3 | 2024 |
| 20241118 | 2024-11-18 | 18 | 11 | November | 4 | 2024 |

---

## 👤 `customer_dim` — SCD Type 2

| customer_key | customer_id | first_name | last_name | gender | address | phone_number | effective_start_dt | effective_end_dt | current_flag |
|---|---|---|---|---|---|---|---|---|---|
| 101 | C001 | Sarah | Bennett | F | 12 Elm St, Chicago | 555-0101 | 2022-01-01 | 2023-06-14 | N |
| 102 | C001 | Sarah | Bennett | F | 88 Oak Ave, Chicago | 555-0101 | 2023-06-15 | 31-DEC-9999 | Y |
| 103 | C002 | Michael | Chen | M | 45 Pine Rd, Austin | 555-0142 | 2021-05-10 | 31-DEC-9999 | Y |
| 104 | C003 | Emily | Davis | F | 9 Birch Ln, Seattle | 555-0198 | 2020-11-20 | 31-DEC-9999 | Y |
| 105 | C004 | Robert | Wilson | M | 200 Maple Dr, Miami | 555-0173 | 2019-08-01 | 31-DEC-9999 | Y |

---

## 📋 `policy_dim` — SCD Type 1 / Type 2

| policy_key | policy_id | policy_type | policy_status | coverage_amount | premium_amount | effective_start_dt | effective_end_dt | current_flag |
|---|---|---|---|---|---|---|---|---|
| 201 | P001 | Auto | Active | 25000 | 1200 | 2023-01-01 | 31-DEC-9999 | Y |
| 202 | P002 | Health | Active | 100000 | 4800 | 2022-03-15 | 31-DEC-9999 | Y |
| 203 | P003 | Life | Active | 250000 | 3200 | 2021-07-01 | 31-DEC-9999 | Y |
| 204 | P004 | Property | Lapsed | 180000 | 2100 | 2020-02-10 | 2024-02-09 | N |

---

## 🧑‍💼 `agent_dim`

| agent_key | agent_id | agent_name | region | performance_rating |
|---|---|---|---|---|
| 301 | A001 | John Carter | Midwest | High |
| 302 | A002 | Maria Lopez | South | Medium |
| 303 | A003 | David Kim | West | High |

---

## 🏷️ `claim_type_dim`

| claim_type_key | claim_category | severity_level | description |
|---|---|---|---|
| 401 | Auto Accident | Medium | Vehicle collision claim |
| 402 | Medical Treatment | High | Major health treatment claim |
| 403 | Property Damage | Low | Minor structural damage claim |

---

## 📋 `policy_fact`

| policy_fact_key | policy_key | customer_key | agent_key | date_key | premium_amount | coverage_amount | policy_duration |
|---|---|---|---|---|---|---|---|
| 501 | 201 | 102 | 301 | 20240115 | 1200 | 25000 | 12 |
| 502 | 202 | 103 | 302 | 20240310 | 4800 | 100000 | 12 |
| 503 | 203 | 104 | 301 | 20240622 | 3200 | 250000 | 24 |
| 504 | 204 | 105 | 303 | 20240905 | 2100 | 180000 | 12 |

---

## 💰 `claim_fact`

| claim_fact_key | claim_id | customer_key | policy_key | claim_type_key | date_key | claim_amount | settlement_duration |
|---|---|---|---|---|---|---|---|
| 601 | CL001 | 102 | 201 | 401 | 20240310 | 3200 | 18 |
| 602 | CL002 | 103 | 202 | 402 | 20240622 | 12500 | 34 |
| 603 | CL003 | 105 | 204 | 403 | 20240905 | 850 | 9 |

---

## 🔗 How These Tables Connect

```
customer_dim (102) → policy_fact (501) → policy_dim (201, Auto)
customer_dim (102) → claim_fact (601)  → claim_type_dim (401, Auto Accident)
agent_dim (301, John Carter) → policy_fact (501, 503)
```

This sample dataset is used consistently across `sample_report_output.md` and the dashboard visual mockup, so the numbers tell one coherent story end-to-end.
