# Brazil E-commerce Performance Dashboard

An end-to-end Business Intelligence project built with **PostgreSQL**, **SQL**, and **Tableau** using the **Olist Brazilian E-commerce Dataset**.

This project demonstrates how raw marketplace data can be transformed into business insights and strategic recommendations through data modeling, SQL analysis, KPI development, and interactive dashboard design.

---

## Dashboard

![Dashboard](Brazil%20E-commerce%20Performance%20Dashboard.png)

---

## Project Overview

This project simulates the work of a Business Analyst supporting an e-commerce marketplace.

Instead of focusing only on SQL queries or visualization, the project follows a complete business analysis workflow:

- Understand the business problem
- Prepare and integrate raw data
- Build analytical SQL queries
- Design executive KPIs
- Create an interactive Tableau dashboard
- Generate business insights
- Provide business recommendations

---

## Tech Stack

- **Database:** PostgreSQL
- **Query Language:** SQL
- **Visualization:** Tableau
- **Business Analysis:** KPI Design, Category Analysis, Seller Analysis, Customer Analysis
- **Data Domain:** Brazil E-commerce Performance

- ---

## Key Business Findings

- **Health & Beauty** generated the highest Gross Merchandise Value (GMV), indicating strong demand driven by transaction volume.
- **Watches & Gifts** recorded the highest average selling price, representing a premium product segment.
- **Seller revenue was highly concentrated**, with Pareto analysis showing that a relatively small number of sellers generated the majority of total GMV.
- **Longer delivery times were associated with lower customer review scores**, highlighting the importance of logistics performance.
- **São Paulo (SP)** generated the highest marketplace GMV, making it the platform's strongest regional market.

- ---

## Project Workflow

```text
Raw CSV Files
        │
        ▼
 PostgreSQL Database
        │
        ▼
 Data Cleaning & SQL Analysis
        │
        ▼
 KPI Development
        │
        ▼
 Tableau Dashboard
        │
        ▼
 Business Insights
        │
        ▼
 Business Recommendations
```

This project follows a complete Business Intelligence workflow, starting from raw transactional data and ending with business insights that support marketplace decision-making.

---

## Project Highlights

- Designed an end-to-end Business Intelligence workflow from raw data to business recommendations.
- Built a relational PostgreSQL database by integrating multiple e-commerce tables.
- Developed SQL queries to analyze marketplace performance across categories, sellers, customers, logistics, and regions.
- Designed an executive Tableau dashboard to communicate KPIs and business insights.
- Applied business thinking to translate analytical findings into strategic recommendations for marketplace operations.

- ---

## Repository Structure

```text
├── README.md                           # Project overview
├── LICENSE                             # MIT License
├── Brazil E-commerce Performance Dashboard.png
│
├── sql/
│   ├── 01_executive_kpi.sql
│   ├── 02_category_analysis.sql
│   ├── 03_seller_analysis.sql
│   ├── 04_customer_analysis.sql
│   ├── 05_logistics_analysis.sql
│   └── 06_pareto_analysis.sql
│
├── tableau/
│   └── Olist.twb
│
└── docs/

---

## How to Use

1. Review the dashboard overview in the project image.
2. Explore the SQL scripts in the `sql` folder.
3. Open the Tableau workbook (`.twb`) in Tableau Desktop to interact with the dashboard.
4. Read the key business findings and recommendations in the README.
