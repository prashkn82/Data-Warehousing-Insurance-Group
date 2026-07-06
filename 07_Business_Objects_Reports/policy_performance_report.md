Policy Performance Report
1. Report Purpose
The Policy Performance Report evaluates how insurance policies perform across time, regions, agents, and customer segments.
It helps business teams understand premium trends, policy durations, coverage effectiveness, and overall profitability.

This report is a core analytical asset in the Data Warehousing Insurance Group project.

2. Data Sources Used
Policy_Fact  
Premium amounts, coverage, policy duration.

Policy_Dim  
Policy type, status, attributes.

Customer_Dim  
Customer demographics and SCD Type 2 history.

Agent_Dim  
Agent performance and region.

Date_Dim  
Calendar hierarchy for policy start and end dates.

3. Key Report Sections
A. Policy Summary Overview
Shows:

Total active policies

Policy types (Life, Auto, Health, Property)

Policy status distribution (Active, Inactive, Lapsed)

Average premium amount

Average coverage amount

B. Premium Trend Analysis
Includes:

Monthly premium collection

Quarterly premium growth

Year‑over‑year premium comparison

Region‑wise premium contribution

C. Policy Duration Insights
Displays:

Average policy duration

Short‑term vs long‑term policy distribution

Duration trends by policy type

D. Agent Performance Contribution
Shows:

Policies sold per agent

Premium generated per agent

Region‑wise agent ranking

E. Customer Segment Analysis
Includes:

Premium contribution by customer demographics

Policy type preference by age group

High‑value customer segments

4. BO Features Used in This Report
Drill‑down from policy → customer → agent

Prompts for filtering by:

Policy type

Region

Agent

Date range

Charts & graphs for premium trends

Cross‑tab tables for multi‑dimensional analysis

Conditional formatting to highlight:

High‑premium policies

Lapsed policies

Underperforming regions

5. Sample BO Query Logic (Semantic Layer)
Policy → Fact Join
Code
Policy_Dim.policy_key = Policy_Fact.policy_key
Policy → Customer Join
Code
Policy_Fact.customer_key = Customer_Dim.customer_key
Policy → Agent Join
Code
Policy_Fact.agent_key = Agent_Dim.agent_key
Date Dimension Join
Code
Policy_Fact.date_key = Date_Dim.date_key
6. Business Value
The Policy Performance Report helps:

Identify profitable policy types

Detect underperforming regions

Understand premium growth trends

Support pricing and underwriting decisions

Improve agent productivity

Optimize policy portfolio strategy

It is widely used by underwriting, finance, and sales teams.
