SCD Comparison (Type 1 vs Type 2 vs Type 3)
1. Introduction
Slowly Changing Dimensions (SCD) define how changes in dimension attributes are handled over time.
In the Data Warehousing Insurance Group project, all three SCD types were used depending on business requirements.

This document compares Type 1, Type 2, and Type 3 in a clear, practical way.

2. SCD Type 1 — Overwrite Changes
Definition
Overwrites old values with new values.
No historical tracking.

Best For
Data corrections

Non‑critical attributes

Standardizing codes

Example
Customer changes phone number → old number is replaced.

3. SCD Type 2 — Full History Tracking
Definition
Creates a new record for every change.
Maintains complete historical data.

Best For
Customer address changes

Policy coverage updates

Agent region changes

Example
Customer moves to a new city → old record is closed, new record inserted.

4. SCD Type 3 — Limited History
Definition
Stores only the previous value along with the current value.

Best For
Tracking only the last change

Attributes where full history is not required

Example
Policy status changes → store current and previous status only.

5. Comparison Table
Feature	Type 1	Type 2	Type 3
History Maintained	No	Full	Partial
Storage Required	Low	High	Medium
ETL Complexity	Low	Medium	Low
Typical Use Case	Corrections	Full history	Last change only
DW Impact	Fast, simple	Accurate historical reporting	Limited analytics


6. How They Were Used in This Project
Customer_Dim
Implemented Type 2

Full history of address, phone, and demographic changes

Policy_Dim
Mixed Type 1 and Type 2

Critical attributes → Type 2

Non‑critical attributes → Type 1

Agent_Dim
Implemented Type 1

Only the latest agent details are required

Claim_Type_Dim
Implemented Type 1

No historical tracking needed

7. Outcome
Using the correct SCD type ensures:

Accurate historical reporting

Reliable trend analysis

Proper handling of insurance data changes

Optimized storage and ETL performance

SCD implementation is one of the most important components of a robust insurance data warehouse.
