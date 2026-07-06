/* ============================================================
   TABLESPACE MANAGEMENT SCRIPT
   Data Warehousing Insurance Group Project
   Oracle 9i Backend
   ============================================================ */

/* 1. Create Permanent Tablespace */
CREATE TABLESPACE insurance_data
DATAFILE 'C:\oracle\oradata\INSU_DW\insurance_data01.dbf'
SIZE 200M
AUTOEXTEND ON
NEXT 50M
MAXSIZE UNLIMITED
EXTENT MANAGEMENT LOCAL
SEGMENT SPACE MANAGEMENT AUTO;

/* 2. Create Temporary Tablespace */
CREATE TEMPORARY TABLESPACE insurance_temp
TEMPFILE 'C:\oracle\oradata\INSU_DW\insurance_temp01.dbf'
SIZE 100M
AUTOEXTEND ON
NEXT 20M
MAXSIZE UNLIMITED;

/* 3. Create User for DW Project */
CREATE USER dw_user
IDENTIFIED BY dw_password
DEFAULT TABLESPACE insurance_data
TEMPORARY TABLESPACE insurance_temp;

/* 4. Grant Required Privileges */
GRANT CONNECT, RESOURCE TO dw_user;
GRANT CREATE VIEW TO dw_user;
GRANT UNLIMITED TABLESPACE TO dw_user;

/* 5. Verify Tablespaces */
SELECT tablespace_name, status, contents
FROM dba_tablespaces;

/* 6. Verify Datafiles */
SELECT file_name, tablespace_name, bytes/1024/1024 AS size_mb
FROM dba_data_files;

/* ============================================================
   END OF SCRIPT
   ============================================================ */
