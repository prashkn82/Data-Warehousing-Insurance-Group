Oracle Installation Steps
1. Pre‑Installation Requirements
Windows OS with administrative privileges

Minimum 2 GB RAM (recommended 4 GB)

Sufficient disk space for Oracle binaries and database files

Disable antivirus during installation to avoid file‑locking issues

Ensure system username has no special characters (Oracle requirement)

2. Software Components
Oracle 9i Release 2 (9.2.0.1)

Oracle Universal Installer (OUI)

Database Configuration Assistant (DBCA)

Net Configuration Assistant (NETCA)

3. Installation Procedure
Step 1: Launch Oracle Universal Installer
Insert Oracle installation media or mount the ISO

Run setup.exe

OUI performs prerequisite checks

Choose Install/Deinstall Products

Step 2: Select Installation Type
Choose:

Enterprise Edition (recommended for DW projects)

Default installation paths unless customization is required

Step 3: Install Database Software
OUI copies files and configures Oracle Home

After installation, choose Create a Database using DBCA

Step 4: Create the Database (DBCA)
Select General Purpose database

Set SID: INSU_DW

Enable Archive Log Mode (recommended for DW)

Configure memory settings (SGA/PGA)

Create sample schemas if needed

Step 5: Configure Network (NETCA)
Create a listener named LISTENER

Default port: 1521

Protocol: TCP

Verify listener status using:

Code
lsnrctl status
Step 6: Post‑Installation Tasks
Add Oracle environment variables:

ORACLE_HOME

ORACLE_SID

PATH update

Test SQL*PLUS connectivity:

Code
sqlplus /nolog
connect sys as sysdba
4. Verification
Check database status:

Code
select status from v$instance;
Validate listener:

Code
lsnrctl status
Confirm data dictionary views are accessible:

Code
select * from dba_tables;
5. Outcome
Oracle 9i is successfully installed and configured as the backend database for the Data Warehousing Insurance Group project, supporting ETL loads, schema design, and reporting.
