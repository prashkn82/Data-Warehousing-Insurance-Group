# 🖥️ Oracle Installation Steps

> Step-by-step guide to installing and configuring **Oracle 9i** as the backend database for the **Insurance Data Warehouse** project.

---

## 1️⃣ Pre-Installation Requirements

| Requirement | Details |
|---|---|
| 🪟 OS | Windows OS with administrative privileges |
| 💾 RAM | Minimum 2 GB (recommended **4 GB**) |
| 💽 Disk Space | Sufficient for Oracle binaries and database files |
| 🛡️ Antivirus | Disable during installation to avoid file-locking issues |
| 👤 Username | No special characters (Oracle requirement) |

---

## 2️⃣ Software Components

- 🗄️ **Oracle 9i Release 2** (9.2.0.1)
- ⚙️ **Oracle Universal Installer** (OUI)
- 🧰 **Database Configuration Assistant** (DBCA)
- 🌐 **Net Configuration Assistant** (NETCA)

---

## 3️⃣ Installation Procedure

### 🔹 Step 1: Launch Oracle Universal Installer
- 💿 Insert Oracle installation media or mount the ISO
- ▶️ Run `setup.exe`
- ✅ OUI performs prerequisite checks
- 📥 Choose **Install/Deinstall Products**

### 🔹 Step 2: Select Installation Type
- 🏢 Choose **Enterprise Edition** (recommended for DW projects)
- 📁 Use default installation paths unless customization is required

### 🔹 Step 3: Install Database Software
- OUI copies files and configures **Oracle Home**
- After installation, choose **Create a Database using DBCA**

### 🔹 Step 4: Create the Database (DBCA)

| Setting | Value |
|---|---|
| Database Type | General Purpose |
| SID | `INSU_DW` |
| Archive Log Mode | ✅ Enabled (recommended for DW) |
| Memory Settings | Configure SGA/PGA |
| Sample Schemas | Create if needed |

### 🔹 Step 5: Configure Network (NETCA)

| Setting | Value |
|---|---|
| Listener Name | `LISTENER` |
| Default Port | `1521` |
| Protocol | `TCP` |

Verify listener status:

```bash
lsnrctl status
```

### 🔹 Step 6: Post-Installation Tasks

**Add Oracle environment variables:**
- `ORACLE_HOME`
- `ORACLE_SID`
- `PATH` update

**Test SQL\*PLUS connectivity:**

```sql
sqlplus /nolog
connect sys as sysdba
```

---

## 4️⃣ Verification

| Check | Command |
|---|---|
| 🟢 Database status | `select status from v$instance;` |
| 🌐 Listener status | `lsnrctl status` |
| 📂 Data dictionary access | `select * from dba_tables;` |

---

## 5️⃣ Outcome

**Oracle 9i** is successfully installed and configured as the backend database for the **Data Warehousing Insurance Group** project, supporting:

- 🔄 ETL loads
- 🏗️ Schema design
- 📊 Reporting

> A solid database foundation is now in place for the entire warehouse build. ✅
