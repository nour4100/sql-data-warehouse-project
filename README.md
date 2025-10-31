# 🏗️ SQL Data Warehouse Project

## 📌 Project Overview

This project demonstrates the **end-to-end process of building a SQL-based Data Warehouse** — from raw data ingestion to advanced business analytics.
The goal is to **organize, cleanse, and prepare data** for reporting and to extract **valuable business insights** using SQL.

---

## 🧱 Project Architecture

The project follows a **three-layer architecture**:

| Layer                      | Description                                    | Key Activities                                          |
| -------------------------- | ---------------------------------------------- | ------------------------------------------------------- |
| **Bronze (Raw Data)**      | Stores raw data loaded directly from CSV files | Data ingestion, storage, and initial validation         |
| **Silver (Cleansed Data)** | Holds cleaned and standardized data            | Data quality checks, transformations, and deduplication |
| **Gold (Business Data)**   | Contains modeled, analytics-ready data         | Data integration, modeling, and reporting views         |

---

## ⚙️ Tools & Technologies

* **SQL Server / SSMS**
* **T-SQL (DDL, DML, Stored Procedures)**
* **BULK INSERT**
* **CTEs & Window Functions**
* **Data Modeling Concepts**

---

## 🧩 Step-by-Step Workflow

### 🥉 1. Bronze Layer — *Raw Data Ingestion*

* Created a database: `Datawarehouse`
* Designed **Bronze tables** for each source CSV file using DDL.
* Loaded data using a **Stored Procedure** with the `BULK INSERT` command.
* Performed **basic exploration** to understand schema and content.

### 🧼 2. Data Quality Checks (Bronze)

* Checked for:

  * NULL or duplicate primary keys
  * Unwanted spaces
  * Invalid or negative cost values
  * Invalid date orders
  * Data consistency (`Sales = Quantity * Price`)
* Identified duplicates and resolved them using the `ROW_NUMBER()` function to keep the most recent record.
* Derived missing or invalid price values.

### 🥈 3. Silver Layer — *Data Cleansing & Transformation*

* Created **Silver tables** for standardized and validated data.
* Wrote an **ETL process** to:

  * Truncate Silver tables.
  * Insert cleaned, transformed data from Bronze.
* Ensured data accuracy, consistency, and readiness for integration.

### 🥇 4. Gold Layer — *Data Integration & Modeling*

* Performed **data modeling** to link key dimensions and facts.
* Joined multiple sources to create a **unified business view**.
* Created **SQL Views** for business reporting and analysis.

---

## 🔍 5. Exploratory Data Analysis (EDA)

Goal: *Understand the data before advanced analysis.*

Performed:

* **Data profiling** using `COUNT`, `SUM`, `AVG`, and `MIN/MAX`.
* **Basic aggregations and subqueries** to explore patterns in sales, customers, and regions.

---

## 📊 6. Advanced Data Analytics

Goal: *Answer business questions and measure performance.*

* **Change Over Time Analysis**
  Track sales and profit trends across months/years.

* **Cumulative Analysis**
  Use running totals and moving averages to analyze performance over time.

* **Performance Analysis (YoY / MoM)**
  Compare current vs. previous periods to measure growth and efficiency.

* **Part-to-Whole Analysis**
  Identify which products, customers, or regions contribute most to total sales.

* **Data Segmentation Analysis**
  Group data by ranges or categories (e.g., product type, region, or customer group) for deeper insights.

---

## 📈 Business Impact

* Improved **data accuracy and reliability** through automated quality checks.
* Enabled **faster data-driven decisions** by transforming raw CSVs into a structured warehouse.
* Created a **scalable SQL pipeline** for ongoing analysis and reporting.
* Strengthened understanding of **ETL, data modeling, and analytical SQL**.

---

## 🧠 Key Learnings

* Hands-on experience with **data warehousing architecture (Bronze–Silver–Gold)**
* Advanced SQL concepts: **CTEs, window functions, stored procedures**
* Strong grasp of **data cleansing, validation, and integration workflows**
* Translating raw data into **business insights**

---

## 📂 Project Structure

```
📦 SQL-Data-Warehouse-Project
 ┣ 📜 bronze_load_procedure.sql
 ┣ 📜 silver_etl_process.sql
 ┣ 📜 gold_views.sql
 ┣ 📜 data_quality_checks.sql
 ┣ 📜 advanced_analysis_queries.sql
 ┣ 📁 data/
 ┃ ┣ 📄 orders.csv
 ┃ ┣ 📄 customers.csv
 ┃ ┣ 📄 products.csv
 ┃ ┗ 📄 regions.csv
 ┗ 📄 README.md
```

---

## 🚀 Future Improvements

* Automate data load using SSIS or Python.
* Connect Gold layer to Power BI for dynamic visualization.
* Add scheduled ETL jobs for real-time updates.

---

👤 **Author:** Nour Mohamed
📅 **Version:** 1.0
💡 *"Turning raw data into reliable business insights through SQL."*
