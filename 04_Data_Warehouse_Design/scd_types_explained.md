Slowly Changing Dimensions (SCD) Explained
1. Introduction
Slowly Changing Dimensions (SCD) are essential for maintaining historical accuracy in a data warehouse—insurance data — such as customer details, policy attributes, and agent information — changes over time.
SCD techniques ensure that these changes are captured correctly for reporting and trend analysis.

This file explains SCD Types 1, 2, and 3, all of which were implemented in the Data Warehousing Insurance Group project.

2. Why SCD Matters in Insurance DW
Insurance operations rely heavily on historical tracking:

Customer address changes

Policy status updates

Premium adjustments

Claim category reclassification

Without SCD, reports would display incorrect historical values, resulting in inaccurate business insights.

3. SCD Type 1 — Overwrite Changes
Definition
Updates the existing record by overwriting old values.
No history is maintained.

Use Cases
Correcting data errors

Updating non‑critical attributes

Standardizing codes or descriptions

Example
Customer changes phone number → old number is replaced.

Pros
Simple

Fast

Minimal storage

Cons
No historical tracking

4. SCD Type 2 — Full History Tracking
Definition
Creates a new record whenever a change occurs.
Maintains complete historical data.

Use Cases
Customer address changes

Policy coverage updates

Agent region changes

Common Columns
effective_start_date

effective_end_date

current_flag

Pros
Full historical accuracy

Ideal for analytical reporting

Cons
More storage

More ETL complexity

5. SCD Type 3 — Limited History
Definition
Stores only the previous value along with the current value.

Use Cases
Tracking only the last change

Attributes where a full history is not required

Example Columns
current_policy_status

previous_policy_status

Pros
Less storage than Type 2

Simple to implement

Cons
Only one level of history

6. SCD Comparison Table
SCD Type	History Maintained	Storage	Complexity	Best For
Type 1	No	Low	Low	Corrections, non‑critical changes
Type 2	Full	High	Medium	Customer, Policy, Agent history
Type 3	Partial	Medium	Low	Limited historical tracking


7. Outcome
SCD implementation ensures that the insurance data warehouse accurately reflects historical changes. This enables:

Trend analysis

Customer behavior tracking

Policy evolution reporting

Accurate claim analytics

SCD is a core component of reliable insurance data warehousing.
