Business Objects Report Overview
1. Introduction
Business Objects (BO) is the reporting and analytics layer used in the Data Warehousing Insurance Group project.
It enables business users to generate interactive, drill‑down reports based on the Oracle 9i data warehouse populated through Informatica ETL workflows.

BO provides a user‑friendly interface for querying fact and dimension tables, visualising trends, and making data‑driven decisions.

2. Key BO Components Used
Universe Designer  
Builds the semantic layer mapping DW tables to business terms.

Web Intelligence (WebI)  
Used for creating interactive reports and dashboards.

BO Repository  
Stores universes, reports, and security metadata.

Report Scheduler  
Automates report delivery via email or shared folders.

3. Universe Design Overview
The BO Universe acts as a bridge between the technical DW schema and business‑friendly reporting terms.

Universe Components
Classes → Logical groupings (Customer, Policy, Claims)

Objects → Columns mapped from DW tables

Joins → Define relationships between fact and dimension tables

Contexts → Prevent fan traps and chasm traps

Benefits
Simplifies complex SQL

Ensures consistent business definitions

Enables drag‑and‑drop report creation

4. Reports Developed in This Project
Customer Profile Report
Shows customer demographics, policy history, and claim activity.

Policy Performance Report
Analyses premium trends, coverage amounts, and policy durations.

Claim Summary Report
Displays claim amounts, settlement durations, and claim categories.

Agent Productivity Report
Evaluates agent performance based on policy sales and claim handling.

Premium Trend Dashboard
Visualises premium collection across months, quarters, and years.

5. BO Features Utilised
Drill‑down & drill‑up navigation

Filters & prompts for dynamic reporting

Cross‑tab tables for multi‑dimensional analysis

Charts & graphs for visual insights

Scheduled report delivery for management teams

6. Outcome
Business Objects provides a powerful reporting layer that transforms warehouse data into actionable insights.
It enables:

Faster decision‑making

Accurate KPI tracking

Clear visualization of insurance trends

Self‑service analytics for business users

BO is the final and most visible layer of the insurance data warehouse ecosystem.
