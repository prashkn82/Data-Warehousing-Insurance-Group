Claim Summary Report
1. Report Purpose
The Claim Summary Report provides a consolidated view of all insurance claims filed by customers.
It helps claims teams, underwriting, and management analyse claim frequency, severity, settlement duration, and financial impact.

This report is one of the most critical analytical outputs in the Data Warehousing Insurance Group project.

2. Data Sources Used
Claim_Fact  
Claim amount, settlement duration, claim date.

Claim_Type_Dim  
Claim category, severity level, description.

Customer_Dim  
Customer demographics and SCD Type 2 history.

Policy_Dim  
Policy type, coverage, status.

Date_Dim  
Calendar hierarchy for claim dates.

3. Key Report Sections
A. Claim Overview
Shows:

Total claims filed

Total claim amount

Average claim amount

Claim severity distribution

Claim category breakdown

B. Claim Frequency Analysis
Includes:

Claims per customer

Claims per policy

Claims per region

Monthly and yearly claim trends

C. Claim Severity Insights
Displays:

High‑severity claims

Medium‑severity claims

Low‑severity claims

Severity‑wise financial impact

D. Settlement Duration Analysis
Shows:

Average settlement duration

Long‑pending claims

Fast‑settled claims

Duration trends by claim category

E. Financial Impact Summary
Includes:

Total claim payout

Net loss ratio

High‑impact claim categories

Region‑wise claim cost distribution

4. BO Features Used in This Report
Drill‑down from claim → customer → policy

Prompts for filtering by:

Claim category

Severity

Region

Date range

Charts & graphs for claim trends

Cross‑tab tables for multi‑dimensional analysis

Conditional formatting to highlight:

High‑severity claims

Long settlement durations

High‑cost claim categories

5. Sample BO Query Logic (Semantic Layer)
Claim → Customer Join
Code
Claim_Fact.customer_key = Customer_Dim.customer_key
Claim → Policy Join
Code
Claim_Fact.policy_key = Policy_Dim.policy_key
Claim → Claim Type Join
Code
Claim_Fact.claim_type_key = Claim_Type_Dim.claim_type_key
Date Dimension Join
Code
Claim_Fact.date_key = Date_Dim.date_key
6. Business Value
The Claim Summary Report helps:

Identify high‑risk customers

Detect costly claim categories

Understand settlement efficiency

Support fraud detection

Improve underwriting and pricing strategies

Provide management with clear claim trends

It is one of the most important reports for claims and risk management teams.
