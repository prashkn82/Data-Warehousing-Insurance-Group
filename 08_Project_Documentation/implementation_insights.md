1. Introduction
This document captures the most valuable insights gained during the implementation of the Data Warehousing Insurance Group project.
Instead of simply listing lessons learned, it focuses on practical, actionable insights that directly improve ETL design, DW modeling, and reporting workflows.

These insights serve as a guide for future enhancements and new data warehousing initiatives.

2. Technical Implementation Insights
A. Clean Source Data Determines ETL Stability
Unclean data caused lookup failures, incorrect surrogate key mappings, and SCD inconsistencies.
Insight: Implement strong cleansing rules early in the pipeline to prevent downstream issues.

B. Lookup Caching Is Essential for Performance
Large dimensions (Customer, Policy) slowed down workflows.
Insight: Use persistent cache and sorted input to significantly reduce session runtime.

C. SCD Type 2 Requires Rigorous Date Management
Incorrect end dates created overlapping historical records.
Insight: Always validate effective_start_dt, effective_end_dt, and current_flag during ETL.

D. Star Schema Simplifies Reporting
A clean fact–dimension model made BO Universe creation straightforward.
Insight: Keep schema design simple, consistent, and business‑friendly.

E. Workflow Scheduling Must Align with Source Refresh
Some source systems refreshed late at night.
Insight: Schedule ETL after source refresh windows to avoid partial loads.

3. Functional Implementation Insights
A. Business Definitions Must Be Standardized
Teams used different definitions for “active policy,” “high‑severity claim,” and “premium category.”
Insight: Create a unified business glossary before building reports.

B. SCD Strategy Must Be Discussed Early
Some attributes initially used Type 1 but later required history.
Insight: Confirm SCD requirements with business users before ETL development.

C. Reporting Requirements Evolve Over Time
New dashboards were requested after initial deployment.
Insight: Build flexible universes and reusable ETL components to support future changes.

4. Operational Implementation Insights
A. Detailed Error Logging Saves Hours of Debugging
Missing logs made troubleshooting difficult.
Insight: Implement comprehensive session logs and error tables.

B. Incremental Loads Are More Efficient
Full loads were slow and unnecessary.
Insight: Use change‑data logic for daily ETL runs.

C. BO Report Scheduling Needs Monitoring
Some scheduled reports failed silently.
Insight: Set up monitoring alerts for BO scheduler failures.

5. Team & Process Insights
A. ETL & Reporting Teams Must Collaborate Early
BO team needed clarity on surrogate keys and SCD logic.
Insight: Conduct joint design sessions before development begins.

B. Version Control Prevents Mapping Conflicts
Multiple developers overwrote mappings.
Insight: Use Git or repository versioning for ETL, SQL, and documentation.

C. Documentation Accelerates Onboarding
Lack of documentation slowed down new team members.
Insight: Maintain updated mapping sheets, data dictionaries, and workflow diagrams.

6. Summary
The project reinforced the importance of:

Clean and validated source data

Strong SCD design

Efficient ETL workflows

Clear business definitions

Robust documentation

Cross‑team collaboration

These insights form a foundation for future improvements and new data warehousing projects.
