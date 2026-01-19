# End-to-End-Retail-Performance-and-Behavioral-Analytics
This Project delivers an End-to-End Retail Sales Analytics Solution using **Python, SQL and Power BI**, designed to provide executive-level insights through interactive dashboards and business-focused KPI's.

The Solution transforms raw transactional data into actionable insights covering:
  - Sales Performance
  - Profitability
  - Returns Analysis
  - Channel comparison (In-Store vs Online)
  - Product, category, and store-level trends

The Project Follows **industry best practices** in:
  - Data Cleaning and Validation
  - SQL- based business analysis
  - Star Schema modeling
  - DAX Optimization
  - Executive Dashboard Storytelling

##  End-to-End Analytics Workflow
Raw Data
   ↓
Python (EDA & Data Cleaning)
   ↓
SQL (Business Questions & Insights)
   ↓
Power BI (Data Modeling, DAX, Dashboards)

# Business Objectives
  - Track **Total Revenue, Profit, and Return Rate**
  - Compare **In-Store vs Online sales channels**
  - Identify **Top performing Products**
  - Analyze **product returns by category**
  - Monitor **monthly sales trends**

# Data Model (Star Schema)
The report is built using a **star schema** for performance and scalability.

# Fact Tables
  -**FactSales** - Transactional-level sales data
  -**FactReturns** - Returned orders data
# Dimension Tables
  -**DimProducts** - Product details (Product ID, Name, Category,Brand)
  -**DimStores** - Store information
  -**DimCustomers** - Customer demographics
  -**DimDate** - Calendar table for time intelligence
- One-to-Many relationships
- Single-direction filter flow
- Optimized for DAX performance

# Key KPI's
  - **Total Revenue**
  - **Total Profit**
  - **Profit Margin %**
  - **Total Orders**
  - **Return Rate %**
  - **Average Order Value**
  - **Month-Over-Month Growth**
All KPI's are built using **Custom DAX measures**

# Dashboards Included
## Executive Dashboard
  - KPI cards for quick decision-making
  - Revenue & Profit trends
  - Channel-wise performance
  - Dynamic titles responding to slicers
# Product & Category Analysis
  - Top products by Revenue
  - Return rate by category
  - Revenue vs returns comparison
# Store & Channel Performance
  - In-Store vs Online analysis
  - Store-level profitability
  - Regional sales performance

# DAX Highlights
  - Time intelligence (MoM,YoY)
  - Return rate and lag analysis
  - Dynamic titles using SELECTED VALUE

# Performance Optimization
  - Star schema modeling
  - Measures instead of calculated columns
  - Reduced cardinality
  - Optimized relationships

# Tools & Technologies
  - Python (Data Cleaning & EDA)
  - SQL (Business Analysis)
  - Power BI Desktop
  - DAX
  - Power Query (ETL)
  - CSV Datasets

# Key Insights
  - In-Store sales generate higher revenue but show high return rates.
  - Personal Care leads revenue contribution
  - Home & Kitchen products experience the highest return rates
  - A small group of customers contributes a significant portion of profit
  - Flagship stores disproportionately impact total profitability
