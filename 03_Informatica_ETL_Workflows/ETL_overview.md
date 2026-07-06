1. Introduction
The ETL (Extract–Transform–Load) process is the backbone of the Data Warehousing Insurance Group project. Using Informatica PowerCenter 7.0, insurance data from multiple heterogeneous sources is extracted, cleansed, transformed, and loaded into the Oracle 9i data warehouse.
This ensures consistent, accurate, and analysis‑ready data for reporting and business intelligence.

2. ETL Architecture
The ETL workflow follows a structured pipeline:

Extraction  
Data is pulled from source systems such as policy databases, claims systems, customer records, and legacy flat files.

Transformation  
Business rules, data cleansing, validation, and SCD logic are applied using Informatica transformations.

Loading  
Processed data is loaded into dimension and fact tables within the Oracle 9i warehouse.

3. Key Informatica Components Used
Workflow Manager – Designing sessions, tasks, and workflows

Workflow Monitor – Monitoring workflow execution

Repository Manager – Managing folders and metadata

Designer Tool – Creating mappings and transformations

4. Major Transformations Implemented
Expression Transformation  
Used for data cleansing, formatting, and applying business rules.

Lookup Transformation  
Used to fetch reference data from dimension tables.

Filter Transformation  
Removes unwanted or invalid records.

Update Strategy Transformation  
Implements SCD Type 1 and Type 2 logic.

Aggregator Transformation  
Used for summarizing claim amounts and policy counts.

5. ETL Workflow Steps
Step 1: Source Definition
Define source tables such as:

Policy master

Customer master

Claims transaction data

Step 2: Mapping Development
Create mappings using:

Source qualifiers

Transformations

Target definitions

Step 3: Session Configuration
Configure:

Commit intervals

Error handling

Pre‑session and post‑session commands

Step 4: Workflow Creation
Build workflows to run sessions in sequence or parallel.

Step 5: Monitoring & Error Handling
Use Workflow Monitor to:

Track session status

Review logs

Identify rejected rows

6. Outcome
The ETL workflows successfully integrate and transform insurance data into a unified warehouse. Informatica ensures high performance, reliability, and scalability for analytical reporting.


