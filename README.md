# Revenue & Growth Command Center

## Project Overview

The Revenue & Growth Command Center is an end-to-end Business Intelligence and Analytics project built using MySQL and Power BI.

This project simulates a real-world e-commerce business environment and focuses on:

- Revenue analytics
- Funnel analysis
- Customer behavior analysis
- KPI tracking
- RFM customer segmentation
- Executive dashboard reporting

The system was designed to replicate how modern businesses monitor growth, user behavior, conversion performance, and customer value using data-driven decision making.

---

# Business Problem

Modern businesses generate large amounts of customer, session, order, and payment data. However, raw data alone does not provide actionable insights.

This project solves the following business challenges:

- Identifying revenue trends
- Tracking conversion performance
- Detecting funnel drop-offs
- Understanding customer engagement
- Segmenting high-value customers
- Measuring acquisition channel performance

---

# Tech Stack

## Database & Querying
- MySQL
- SQL

## Analytics & Visualization
- Power BI
- DAX

## Data Modeling
- Relational Data Modeling
- KPI Layer Design
- Funnel Analytics
- RFM Segmentation

---

# Dataset Overview

The project uses simulated large-scale e-commerce datasets generated using SQL.

## Core Tables

| Table Name | Description |
|------------|-------------|
| users | Customer profile and acquisition data |
| sessions | User browsing and engagement activity |
| orders | Customer purchase transactions |
| order_items | Product-level order details |
| payments | Payment and revenue information |
| rfm_analysis | Customer segmentation metrics |
| kpi_summary | Business KPI calculations |

---

# Key Features

## Executive KPI Dashboard
- Total Revenue
- Total Orders
- Average Order Value (AOV)
- Conversion Rate
- Active Users

---

## Funnel Analysis
Analyzed the complete customer journey:

Sessions → Converted Sessions → Orders → Successful Payments

Key insights:
- Conversion drop-offs
- Funnel leakage
- Payment failure impact

---

## Customer Segmentation (RFM)
Implemented RFM Analysis using:
- Recency
- Frequency
- Monetary Value

Customer groups:
- VIP Customers
- Loyal Customers
- Regular Customers
- At-Risk Customers

---

## Behavior & Acquisition Analysis
Analyzed:
- Device performance
- Marketing channel effectiveness
- User engagement vs conversion behavior

---

# Power BI Dashboard Pages

## 1. Revenue & Growth Overview
Executive-level KPI tracking and revenue trends.

## 2. Conversion Funnel Analysis
Customer journey and drop-off analysis.

## 3. Customer Value & Segmentation
RFM segmentation and high-value customer analysis.

## 4. Behavior & Acquisition Insights
User engagement, device behavior, and acquisition performance.

---

# SQL Modules

| File | Purpose |
|------|----------|
| 01_database_schema.sql | Database and table creation |
| 02_data_generation.sql | Synthetic data generation |
| 03_kpi_analysis.sql | KPI calculations |
| 04_funnel_analysis.sql | Funnel analytics |
| 05_rfm_segmentation.sql | Customer segmentation |

---

# Key Business Insights

- Identified major funnel drop-offs before purchase completion
- Analyzed revenue contribution by acquisition channel
- Detected high-value customer segments using RFM scoring
- Evaluated user engagement impact on conversion
- Measured payment success and failure trends

---

# Dashboard Design

The dashboard was designed using a premium dark executive-style UI with:
- Glassmorphism-inspired panels
- Executive KPI cards
- Funnel analytics visuals
- Customer intelligence views
- Behavior analytics sections

---

# Project Structure

```bash
Revenue-Growth-Command-Center/
│
├── README.md
│
├── SQL/
│   ├── 01_database_schema.sql
│   ├── 02_data_generation.sql
│   ├── 03_kpi_analysis.sql
│   ├── 04_funnel_analysis.sql
│   ├── 05_rfm_segmentation.sql
│
├── Dataset/
│   ├── users.csv
│   ├── sessions.csv
│   ├── orders.csv
│   ├── payments.csv
│   ├── kpi_summary.csv
│   ├── rfm_analysis.csv
│
├── Dashboard/
│   ├── revenue_growth_dashboard.pbix
│   ├── dashboard_screenshots/
│
└── Assets/
    ├── dashboard_preview.png
