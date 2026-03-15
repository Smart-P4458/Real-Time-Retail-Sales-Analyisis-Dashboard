# Real-Time-Retail-Sales-Analyisis-Dashboard
This project demonstrates the end-to-end process of building a real-time retail analytics dashboard using Python, PostgreSQL, and Power BI. The goal is to transform raw CSV datasets into actionable insights for business, technical, and management decision-making.

---

Dashboard Image

![Main Dashboard Overview](https://github.com/Smart-P4458/Real-Time-Retail-Sales-Analyisis-Dashboard/blob/main/Images/Power%20BI%20Retail%20Sales%20Dashboard.png?raw=true)

---

# Real-Time Retail Sales Analysis

## Introduction
This capstone project demonstrates the end-to-end process of building a **real-time retail analytics dashboard** using **Python, PostgreSQL, and Power BI**.  
The goal is to transform raw CSV datasets into actionable insights that support **business, technical, and management decision-making**.

---

## Objectives
- Clean, normalize, and structure raw retail sales data.  
- Upload processed data into PostgreSQL directly from Python.  
- Perform exploratory analysis to answer real-world business questions.  
- Build an interactive Power BI dashboard with drillthrough capabilities.  
- Enable dynamic KPI tracking, seasonal analysis, promotion effectiveness, and customer/product deep dives.  

---

##  Tools & Technologies
- **Python (Pandas, Jupyter Notebook):** Data cleaning, normalization, SQL table creation, and direct upload to PostgreSQL.  
- **PostgreSQL:** Relational database for structured data storage.  
- **SQL (DDL & Queries):** Table creation and data import.  
- **Power BI:** Visualization and dashboard design.  
- **Tabular Editor 2:** Advanced calculation groups.  
- **CSV Files:** Raw datasets.  

---

##  Data Preparation & Upload (Python)
**Steps:**
1. Import raw CSV datasets into Jupyter Notebook.  
2. Clean and normalize data using Pandas.  
3. Explode nested fields where necessary.  
4. Create relational tables using SQL DDL statements.  
5. Upload cleaned and structured data directly into PostgreSQL from Python.  

**Screenshot Placeholder:** *Python code for cleaning, normalization, SQL table creation, and PostgreSQL upload*

---

## 🗄 Database Setup (PostgreSQL)
**Steps:**
1. Design relational schema for retail sales data.  
2. Verify successful upload of tables from Python.  
3. Run SQL queries to validate data integrity and perform simple analysis.  

**Screenshot Placeholder:** *PostgreSQL schema, tables, and queries*

---

##  Data Integration (Power BI)
**Steps:**
1. Connect Power BI to PostgreSQL using Direct Query mode.  
2. Import tables one-by-one using advanced SQL queries.  
3. Create relationships between tables for accurate modeling.  
4. Implement field parameters for dynamic metric selection.  
5. Use calculation groups (via Tabular Editor 2) to streamline measures.  

**Screenshot Placeholder:** *Power BI data model and query imports*

---

## 📊 Dashboard Design
**Main Page:**
- KPIs: Total Revenue, Quantity Sold, Transactions, Revenue Growth.  
- Seasonal revenue distribution.  
- Store-type and promotion effectiveness.  
- Customer and product revenue breakdown.  

**Drillthrough Page:**
- Customer-specific deep dive.  
- Product-level revenue and transaction details.  
- Promotion impact on individual purchases.  

## Main Dashboard showing Tooltip insights
![Dashboard with Tooltip](https://github.com/Smart-P4458/Real-Time-Retail-Sales-Analyisis-Dashboard/blob/main/Images/PBIDashboard%20with%20Tooltip.png?raw=true)

---

## Drillthrough Customer/ Product Deep Dive Page
![Customer / Product Drillthrough](https://github.com/Smart-P4458/Real-Time-Retail-Sales-Analyisis-Dashboard/blob/main/Images/PBI_Customer_Product%20Deep%20Dive%20page.png?raw=true)

---

## 🔍 Key Insights
- Seasonal revenue is evenly distributed across Spring, Summer, Fall, and Winter.  
- Promotions (BOGO, Discounts) significantly influence revenue distribution.  
- Top customers and products drive a large share of revenue.  
- Store-type performance varies, with supermarkets and convenience stores leading.  

**Screenshot Placeholder:** *Key insights visualization*

---

## 💼 Business Impact
- Supports strategic planning by identifying seasonal and promotional drivers.  
- Enables customer segmentation and personalized marketing.  
- Improves inventory and supply chain decisions.  
- Provides real-time visibility for executives and managers.  

**Screenshot Placeholder:** *Business impact infographic*

---

## ✅ Conclusion
This project showcases the integration of **data engineering, database management, and business intelligence visualization**.  
By combining **Python (for cleaning and PostgreSQL upload)**, **PostgreSQL (for structured storage)**, and **Power BI (for visualization)**, the dashboard delivers **actionable insights** that support **real-time decision-making in retail**.

---

##  How to Run
1. Clone the repository:  
   ```bash
   git clone https://github.com/your-username/real-time-retail-sales-analysis.git
