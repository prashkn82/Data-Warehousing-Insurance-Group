Lookup Transformation
1. Introduction
The Lookup Transformation in Informatica PowerCenter is used to fetch related data from reference tables, dimension tables, or flat files. It enriches incoming source data by matching keys and retrieving additional attributes required for warehouse loading.

In the Data Warehousing Insurance Group project, Lookup Transformations are heavily used for validating policy codes, fetching customer details, and ensuring referential integrity during ETL.

2. Types of Lookups
Connected Lookup  
Part of the main data flow; returns values directly to downstream transformations.

Unconnected Lookup  
Called using :LKP expression; useful for conditional or on‑demand lookups.

3. Lookup Cache Options
Static Cache  
Loaded once; used for most dimension lookups.

Dynamic Cache  
Updates cache during session; used for SCD Type 2 logic.

Persistent Cache  
Saved and reused across sessions to improve performance.

4. Common Use Cases
Fetching Customer Dimension attributes

Validating Policy Status Codes

Mapping Claim Category from reference tables

Ensuring foreign key integrity before loading fact tables

Implementing SCD Type 2 using dynamic lookup cache

5. Sample Lookup Logic
Connected Lookup Example
Lookup on POLICY_DIM table:

Code
POLICY_KEY = LKP_POLICY_DIM.POLICY_KEY
Unconnected Lookup Example
Code
:LKUP_CUST_NAME(CUST_ID)
Lookup Condition
Code
POLICY_DIM.POLICY_ID = SRC_POLICY.POLICY_ID
6. Best Practices
Use indexed columns for lookup conditions

Enable cache for frequently used lookups

Use persistent cache for large dimension tables

Avoid unnecessary lookup ports to reduce memory usage

Validate lookup output using session logs

7. Outcome
Lookup Transformations ensure that all incoming insurance data is enriched, validated, and aligned with warehouse standards. They play a critical role in maintaining data consistency and supporting accurate analytical reporting.
