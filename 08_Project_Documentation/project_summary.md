Project Summary – Data Warehousing Insurance Group
1. Introduction
The Data Warehousing Insurance Group project is a complete end‑to‑end data warehousing implementation built using Oracle 9i, Informatica PowerCenter, and Business Objects (BO).
It integrates raw operational insurance data into a structured, analytical warehouse that supports reporting, trend analysis, and decision‑making across underwriting, claims, finance, and customer service teams.

This summary provides a clear, consolidated overview of the entire project.

2. Project Architecture Overview
A. Source Systems
Policy administration system

Claims processing system

Customer management system

Agent performance system

B. ETL Layer – Informatica PowerCenter
Key components:

Source Qualifier

Lookup Transformation

Expression Transformation

Aggregator Transformation

Update Strategy

SCD Type 1 & Type 2 logic

Workflow Manager & Monitor

C. Data Warehouse – Oracle 9i
Schema design:

Star Schema

Fact Tables: Policy_Fact, Claim_Fact

Dimension Tables: Customer_Dim, Policy_Dim, Agent_Dim, Claim_Type_Dim, Date_Dim

SCD Implementation: Type 1, Type 2, Type 3

D. Reporting Layer – Business Objects
Tools used:

Universe Designer

Web Intelligence (WebI)

Report Scheduler

Reports developed:

Customer Profile Report

Policy Performance Report

Claim Summary Report

Agent Productivity Report

Premium Trend Dashboard

3. End‑to‑End Data Flow
Extract  
Raw data pulled from source systems using Informatica.

Transform

Data cleansing

Lookup enrichment

SCD handling

Aggregation

Validation

Load  
Data loaded into Oracle DW fact and dimension tables.

Report  
BO Universe maps DW tables → business‑friendly objects → interactive reports.

4. Key Business Outcomes
A. Improved Decision‑Making
Accurate premium trends

Clear claim severity insights

Better customer segmentation

Strong agent performance visibility

B. Enhanced Operational Efficiency
Faster reporting cycles

Automated ETL workflows

Reduced manual data preparation

C. Reliable Historical Tracking
Full SCD Type 2 history for customers and policies

Accurate trend analysis across years

D. Unified Data View
Single source of truth for policies, claims, customers, and agents

5. Technical Highlights
Robust SCD Type 2 implementation

Optimised lookup caching

Clean star schema design

Efficient SQL*Plus validation scripts

BO Universe with well‑defined contexts

Drill‑down enabled dashboards

6. Project Deliverables
Complete DW schema

ETL mappings & workflows

SCD scripts

SQL validation scripts

BO Universe

BO reports & dashboards

Full documentation (this repository)

7. Conclusion
The Data Warehousing Insurance Group project successfully delivers a scalable, reliable, and analytically powerful data warehouse.
It transforms raw insurance data into meaningful insights that support business growth, operational efficiency, and strategic decision‑making.

This repository serves as a complete technical and functional reference for the entire project.
