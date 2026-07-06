Export & Import Steps (Oracle 9i)
1. Introduction
Export and Import utilities (exp and imp) are used to back up and restore Oracle schema objects, data, and metadata. These steps were performed as part of the Data Warehousing Insurance Group project to migrate data between environments and maintain backup copies of warehouse tables.

2. Export (EXP) – Backup Process
Step 1: Open Command Prompt
Navigate to the Oracle BIN directory:

Code
cd C:\oracle\ora92\bin
Step 2: Perform Full User Export
Export the DW user schema:

Code
exp dw_user/dw_password file=C:\backup\dw_user_backup.dmp log=C:\backup\dw_user_backup.log owner=dw_user
Step 3: Verify Export Log
Check the log file for:

Successful table exports

Constraint and index creation

Any warnings or errors

3. Import (IMP) – Restore Process
Step 1: Create User (If Not Exists)
Code
CREATE USER dw_user IDENTIFIED BY dw_password;
GRANT CONNECT, RESOURCE TO dw_user;
Step 2: Start Import
Code
imp dw_user/dw_password file=C:\backup\dw_user_backup.dmp log=C:\backup\dw_user_import.log fromuser=dw_user touser=dw_user
Step 3: Resolve Object Conflicts
If tables already exist:

Code
imp dw_user/dw_password file=C:\backup\dw_user_backup.dmp ignore=y
ignore=y allows import to continue even if objects already exist.

4. Common Export/Import Options
Export Options
Code
tables=(policy_dim,claim_fact)
compress=n
buffer=100000
Import Options
Code
rows=y
indexes=y
constraints=y
grants=y
5. Verification After Import
Run SQL*PLUS checks:

Check Table Count
Code
select count(*) from policy_dim;
select count(*) from claim_fact;
Check Constraints
Code
select constraint_name, status from user_constraints;
Check Indexes
Code
select index_name, status from user_indexes;
6. Outcome
The export/import process ensures reliable backup and migration of the insurance data warehouse schema. These steps were used during development, testing, and deployment of the DW environment.
