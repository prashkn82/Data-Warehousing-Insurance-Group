/* ============================================================================
   ####  MONITOR ALERT LOG FILES  ####
   Insurance Data Warehouse — Oracle 9i
   ============================================================================ */


/* ----------------------------------------------------------------------------
   ####  1. LOCATE THE ALERT LOG  ####
   ---------------------------------------------------------------------------- */
SELECT value AS alert_log_path
FROM   v$parameter
WHERE  name = 'background_dump_dest';


/* ----------------------------------------------------------------------------
   ####  2. SCAN FOR ORA- ERRORS  ####
   Requires OS-level access to the alert log file
   ---------------------------------------------------------------------------- */
-- Example OS command (Windows):
-- findstr "ORA-" C:\oracle\admin\INSU_DW\bdump\alert_INSU_DW.log

-- Example OS command (Linux/Unix):
-- grep "ORA-" /oracle/admin/INSU_DW/bdump/alert_INSU_DW.log


/* ----------------------------------------------------------------------------
   ####  3. CHECK DATABASE INSTANCE STATUS  ####
   ---------------------------------------------------------------------------- */
SELECT instance_name,
       status,
       database_status
FROM   v$instance;


/* ----------------------------------------------------------------------------
   ####  4. CHECK TABLESPACE USAGE  ####
   A common source of alert log space warnings
   ---------------------------------------------------------------------------- */
SELECT tablespace_name,
       ROUND(SUM(bytes) / 1024 / 1024, 2) AS size_mb
FROM   dba_data_files
GROUP  BY tablespace_name;


/* ----------------------------------------------------------------------------
   ####  5. CHECK FOR DATAFILES NEEDING ATTENTION  ####
   ---------------------------------------------------------------------------- */
SELECT file_name,
       status,
       ROUND(bytes / 1024 / 1024, 2) AS size_mb
FROM   dba_data_files
WHERE  status != 'AVAILABLE';


/* ----------------------------------------------------------------------------
   ####  6. CHECK FOR RECENT INVALID OBJECTS  ####
   Alert log errors often coincide with invalid schema objects
   ---------------------------------------------------------------------------- */
SELECT owner,
       object_name,
       object_type,
       status
FROM   dba_objects
WHERE  status = 'INVALID';


/* ============================================================================
   ####  END OF SCRIPT  ####
   ============================================================================ */
