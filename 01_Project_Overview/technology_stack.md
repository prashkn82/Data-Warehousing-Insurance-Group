Technology Stack
1. Database Technologies
Oracle 9i R2 (9.2.0.1)  
Primary backend database used for storing integrated insurance data, managing schema objects, tablespaces, users, roles, and performing backup/restore operations.

SQL\PLUS*
Used for executing SQL scripts, validating ETL loads, and performing data retrieval during warehouse development.

2. ETL & Data Integration Tools
Informatica PowerCenter 7.0  
Core ETL tool used to extract, cleanse, transform, and load heterogeneous insurance data into the warehouse.
Key transformations implemented:

Expression

Lookup

Filter

Update Strategy (for SCD Type 1/2/3)

3. Reporting & Analytics
Business Objects 5.0 (BO)  
Used for generating analytical reports, dashboards, and insurance performance summaries based on warehouse data.

4. Data Warehousing Concepts
Dimensional Modeling (Star Schema)

Fact Tables & Dimension Tables

Slowly Changing Dimensions (SCD Types 1, 2, 3)

Historical Data Tracking

Metadata Management

5. Supporting Tools & Utilities
Oracle Backup Tools (RMAN, Cold Backup)

Alert Log Monitoring

Workflow Manager & Monitor (Informatica)

6. Development Environment
Windows-based Oracle & Informatica setup

SQL\*PLUS command-line interface

Business Objects reporting environment
