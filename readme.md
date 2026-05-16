# Supply Chain Delivery Delay Analysis

## Project Overview
This project analyzes shipment delays using the DataCo Supply Chain Dataset. The objective is to identify operational factors contributing to late deliveries and uncover patterns across shipping modes, customer segments, and global markets.

The analysis was conducted using:
- Microsoft Excel
- PostgreSQL
- Power BI (planned)

---

## Business Problem
Late deliveries negatively impact customer satisfaction, operational efficiency, and logistics costs. This project investigates:
- Which shipping modes experience the highest delays
- Whether delays vary across customer segments or markets
- Whether premium shipping services are operationally unrealistic

---

## Dataset
Dataset: DataCo Smart Supply Chain Dataset  
Source: Kaggle  
Records analyzed: 180,519 orders

---

## Tools Used
- Microsoft Excel
- PostgreSQL
- Power BI

---

# Excel Analysis

## Key Findings

### Finding 1 — Shipping Mode Performance
First Class shipping recorded a 100.0% late delivery rate despite being a premium service. Standard Class handled the highest order volume (103,153 orders) while maintaining the lowest late rate at 39.8%.

### Finding 2 — Customer Segment Analysis
Late delivery rates remained consistently high across all customer segments, ranging from 57.1% to 57.6%, indicating that delays are caused by broader operational inefficiencies rather than customer segment differences.

### Finding 3 — Market Analysis
Late delivery rates were consistently high across all markets, ranging from 56.8% to 57.7%. The small variation across regions suggests delays are a global operational issue rather than a market-specific problem.

### Finding 4 — Shipping Mode vs Market
Cross-analysis of shipping mode and market showed nearly identical delay patterns across regions. First Class shipping recorded a 100% late delivery rate across all markets, reinforcing the possibility of systemic issues in premium shipping operations.

---

## Project Status
Current Progress:
- Excel exploratory analysis completed
- PivotTables, PivotCharts, and heatmap analysis completed
- PostgreSQL database created
- CSV dataset successfully imported into PostgreSQL
- SQL data profiling completed
- SQL cleaning and feature creation in progress
- Power BI dashboard development pending
---

## Planned Next Steps
- Write SQL data profiling queries
- Create cleaned SQL views for analysis
- Perform SQL business analysis on delivery delays
- Build interactive Power BI dashboard
- Create executive summary dashboard

---

## Repository Structure

supply-chain-delay-analysis/
│
├── DataCoSupplyChainDataset.csv
├── supply_chain_analysis.xlsx
├── README.md
│
└── sql/
    └── 01_create_table.sql
     └── 02_data_profiling.sql
```