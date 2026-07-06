Dimensional Modeling
1. Introduction
Dimensional modeling is the foundation of the Data Warehousing Insurance Group project. It structures data into intuitive, analysis‑friendly components — fact tables and dimension tables — enabling fast queries, historical tracking, and clear business insights.

This modeling approach follows Ralph Kimball’s methodology, which is ideal for analytical systems like insurance reporting.

2. Core Concepts
Fact Tables
Contain measurable business metrics such as:

Claim amount

Premium amount

Policy count

Settlement duration

Fact tables are typically numeric, additive, and time‑variant.

Dimension Tables
Contain descriptive attributes such as:

Customer details

Policy information

Agent details

Date attributes

Claim categories

Dimensions provide context to facts and support filtering, grouping, and drill‑down analysis.

3. Star Schema Design
The insurance warehouse uses a Star Schema, where:

The Fact Table sits at the center

Surrounding Dimension Tables connect via foreign keys

This design ensures:

Fast query performance

Simplified joins

Easy scalability

Clear business interpretation

4. Insurance DW Schema Components
Fact Tables
Claim_Fact  
Stores claim amounts, claim dates, settlement durations, and foreign keys to dimensions.

Policy_Fact  
Stores premium amounts, policy start/end dates, and policy performance metrics.

Dimension Tables
Customer_Dim  
Customer demographics, contact details, SCD Type 2 history.

Policy_Dim  
Policy type, status, coverage details, SCD Type 1/2 attributes.

Agent_Dim  
Agent name, region, performance category.

Date_Dim  
Full calendar hierarchy (day, week, month, quarter, year).

Claim_Type_Dim  
Claim category, severity, classification.

5. SCD Integration
Dimensional modeling supports Slowly Changing Dimensions (SCD):

Type 1 — Overwrite changes

Type 2 — Maintain full history

Type 3 — Limited history

These techniques ensure accurate historical reporting for insurance operations.

6. Benefits of Dimensional Modeling
Simplifies complex insurance data

Enables fast analytical queries

Supports historical trend analysis

Provides a unified view of customers, policies, and claims

Improves reporting accuracy and consistency

7. Outcome
Dimensional modeling provides the structural backbone of the insurance data warehouse. It ensures that analytical reporting is efficient, reliable, and aligned with business needs.
