/* ========================================================================================
   ####  INSURANCE DATA WAREHOUSE SCHEMA  ####
   Fact & Dimension Table Creation Script
   Platform : Oracle 9i
   Project  : Data Warehousing Insurance Group
   ======================================================================================== */


/* ----------------------------------------------------------------------------------------
   ####  1. DATE DIMENSION  ####
   Calendar hierarchy used to join facts to time periods
   ---------------------------------------------------------------------------------------- */
CREATE TABLE date_dim (
    date_key      NUMBER          PRIMARY KEY,
    full_date     DATE,
    day           NUMBER,
    month         NUMBER,
    month_name    VARCHAR2(20),
    quarter       NUMBER,
    year          NUMBER
);


/* ----------------------------------------------------------------------------------------
   ####  2. CUSTOMER DIMENSION  ####  (SCD Type 2 — full history)
   Tracks customer demographic and contact changes over time
   ---------------------------------------------------------------------------------------- */
CREATE TABLE customer_dim (
    customer_key          NUMBER           PRIMARY KEY,
    customer_id           VARCHAR2(20),
    first_name            VARCHAR2(50),
    last_name             VARCHAR2(50),
    gender                VARCHAR2(10),
    address               VARCHAR2(200),
    phone_number          VARCHAR2(20),
    effective_start_dt    DATE,
    effective_end_dt      DATE,
    current_flag          CHAR(1)
);


/* ----------------------------------------------------------------------------------------
   ####  3. POLICY DIMENSION  ####  (SCD Type 1 / Type 2)
   Tracks policy attributes; corrections overwrite, coverage changes version
   ---------------------------------------------------------------------------------------- */
CREATE TABLE policy_dim (
    policy_key            NUMBER          PRIMARY KEY,
    policy_id             VARCHAR2(20),
    policy_type           VARCHAR2(50),
    policy_status         VARCHAR2(20),
    coverage_amount       NUMBER,
    premium_amount        NUMBER,
    effective_start_dt    DATE,
    effective_end_dt      DATE,
    current_flag          CHAR(1)
);


/* ----------------------------------------------------------------------------------------
   ####  4. AGENT DIMENSION  ####
   Descriptive attributes for insurance agents
   ---------------------------------------------------------------------------------------- */
CREATE TABLE agent_dim (
    agent_key             NUMBER           PRIMARY KEY,
    agent_id              VARCHAR2(20),
    agent_name            VARCHAR2(100),
    region                VARCHAR2(50),
    performance_rating    VARCHAR2(20)
);


/* ----------------------------------------------------------------------------------------
   ####  5. CLAIM TYPE DIMENSION  ####
   Classification and severity of insurance claims
   ---------------------------------------------------------------------------------------- */
CREATE TABLE claim_type_dim (
    claim_type_key    NUMBER           PRIMARY KEY,
    claim_category    VARCHAR2(50),
    severity_level    VARCHAR2(20),
    description       VARCHAR2(200)
);


/* ----------------------------------------------------------------------------------------
   ####  6. POLICY FACT TABLE  ####
   Measurable policy metrics linked to customer, agent, and date dimensions
   ---------------------------------------------------------------------------------------- */
CREATE TABLE policy_fact (
    policy_fact_key    NUMBER    PRIMARY KEY,
    policy_key         NUMBER,
    customer_key       NUMBER,
    agent_key          NUMBER,
    date_key           NUMBER,
    premium_amount     NUMBER,
    coverage_amount    NUMBER,
    policy_duration    NUMBER,

    CONSTRAINT fk_pf_policy     FOREIGN KEY (policy_key  ) REFERENCES policy_dim   (policy_key),
    CONSTRAINT fk_pf_customer   FOREIGN KEY (customer_key) REFERENCES customer_dim (customer_key),
    CONSTRAINT fk_pf_agent      FOREIGN KEY (agent_key   ) REFERENCES agent_dim    (agent_key),
    CONSTRAINT fk_pf_date       FOREIGN KEY (date_key    ) REFERENCES date_dim     (date_key)
);


/* ----------------------------------------------------------------------------------------
   ####  7. CLAIM FACT TABLE  ####
   Measurable claim metrics linked to customer, policy, claim type, and date
   ---------------------------------------------------------------------------------------- */
CREATE TABLE claim_fact (
    claim_fact_key         NUMBER          PRIMARY KEY,
    claim_id               VARCHAR2(20),
    customer_key           NUMBER,
    policy_key             NUMBER,
    claim_type_key         NUMBER,
    date_key               NUMBER,
    claim_amount           NUMBER,
    settlement_duration    NUMBER,

    CONSTRAINT fk_cf_customer     FOREIGN KEY (customer_key  ) REFERENCES customer_dim   (customer_key),
    CONSTRAINT fk_cf_policy       FOREIGN KEY (policy_key    ) REFERENCES policy_dim     (policy_key),
    CONSTRAINT fk_cf_claim_type   FOREIGN KEY (claim_type_key) REFERENCES claim_type_dim (claim_type_key),
    CONSTRAINT fk_cf_date         FOREIGN KEY (date_key      ) REFERENCES date_dim       (date_key)
);


/* ========================================================================================
   ####  END OF SCHEMA  ####
   ======================================================================================== */
