/* ============================================================================
   TABLESPACE MANAGEMENT SCRIPT
   Project   : Data Warehousing Insurance Group
   Platform  : Oracle 9i Backend
   Purpose   : Create tablespaces, DW user, and grant required privileges
   ============================================================================ */


/* ----------------------------------------------------------------------------
   SECTION 1 : CREATE PERMANENT TABLESPACE
   Stores all persistent insurance warehouse data (fact/dimension tables)
   ---------------------------------------------------------------------------- */
CREATE TABLESPACE insurance_data
    DATAFILE               'C:\oracle\oradata\INSU_DW\insurance_data01.dbf'
    SIZE                    200M
    AUTOEXTEND              ON
    NEXT                    50M
    MAXSIZE                 UNLIMITED
    EXTENT MANAGEMENT       LOCAL
    SEGMENT SPACE MANAGEMENT AUTO;


/* ----------------------------------------------------------------------------
   SECTION 2 : CREATE TEMPORARY TABLESPACE
   Used for sort operations, joins, and temporary segments
   ---------------------------------------------------------------------------- */
CREATE TEMPORARY TABLESPACE insurance_temp
    TEMPFILE    'C:\oracle\oradata\INSU_DW\insurance_temp01.dbf'
    SIZE         100M
    AUTOEXTEND   ON
    NEXT         20M
    MAXSIZE      UNLIMITED;


/* ----------------------------------------------------------------------------
   SECTION 3 : CREATE USER FOR DW PROJECT
   Dedicated schema owner for the insurance data warehouse
   ---------------------------------------------------------------------------- */
CREATE USER dw_user
    IDENTIFIED BY           dw_password
    DEFAULT TABLESPACE      insurance_data
    TEMPORARY TABLESPACE    insurance_temp;


/* ----------------------------------------------------------------------------
   SECTION 4 : GRANT REQUIRED PRIVILEGES
   Minimum privileges needed for schema creation and ETL operations
   ---------------------------------------------------------------------------- */
GRANT CONNECT, RESOURCE      TO dw_user;
GRANT CREATE VIEW            TO dw_user;
GRANT UNLIMITED TABLESPACE   TO dw_user;


/* ----------------------------------------------------------------------------
   SECTION 5 : VERIFY TABLESPACES
   Confirms tablespaces were created successfully and are ONLINE
   ---------------------------------------------------------------------------- */
SELECT tablespace_name,
       status,
       contents
FROM   dba_tablespaces;


/* ----------------------------------------------------------------------------
   SECTION 6 : VERIFY DATAFILES
   Confirms datafile size and association with the correct tablespace
   ---------------------------------------------------------------------------- */
SELECT file_name,
       tablespace_name,
       bytes / 1024 / 1024 AS size_mb
FROM   dba_data_files;


/* ============================================================================
   END OF SCRIPT
   ============================================================================ */
