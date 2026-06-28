# superstore-aws-analytics
End-to-end data pipeline using AWS S3, Glue, Athena and Power BI to analyze Superstore sales data
# Superstore Sales Analytics — AWS Data Pipeline

End-to-end data pipeline using AWS S3, Glue, Athena and Power BI to analyze Superstore sales data.

---

## Tech Stack

- **Amazon S3** — Raw data storage
- **AWS Glue** — Database, Crawler and Data Catalog
- **Amazon Athena** — Serverless SQL querying
- **Power BI** — Interactive dashboard via live ODBC connection
- **SQL** — 10 analytical queries for business insights

---

## Pipeline Architecture

```
Kaggle Dataset (SampleSuperstore.csv)
        │
        ▼
   Amazon S3 Bucket
(Data storage)
        │
        ▼
   AWS Glue Database
(Created manually)
        │
        ▼
   AWS Glue Crawler
(Crawls S3 → auto-creates tables)
        │
        ▼
   AWS Glue Data Catalog
(Tables visible in catalog)
        │
        ▼
   Amazon Athena
(SQL queries on cataloged data)
        │
        ▼
   Power BI Dashboard
(Connected directly via Amazon Athena ODBC Driver)
```

---

## Project Structure

```
superstore-aws-analytics/
├── README.md
├── queries/
│   └── superstore_queries.sql       ← 10 analytical SQL queries
├── results/
│   ├── query_01_sales_by_region.csv
│   ├── query_02_top_profitable_cities.csv
│   ├── query_03_top_loss_states.csv
│   ├── query_04_discount_impact_on_profit.csv
│   ├── query_05_sales_by_segment.csv
│   ├── query_06_avg_sales_per_segment.csv
│   ├── query_07_profit_margin_by_category.csv
│   ├── query_08_sales_by_region_category.csv
│   ├── query_09_top5_states_by_sales.csv
│   └── query_10_region_profit_contribution.csv
├── dashboard/
│   └── Superstore_Dashboard.pbix
└── data/
    └── SampleSuperstore.csv
```

---

## SQL Queries

| # | Query | Description |
|---|-------|-------------|
| 01 | Sales by Region | Total sales and profit across all regions |
| 02 | Top Profitable Cities | Top 10 cities by profit |
| 03 | Top Loss States | Top 10 states with highest losses |
| 04 | Discount Impact | How discount ranges affect profit |
| 05 | Sales by Segment | Revenue breakdown by customer segment |
| 06 | Avg Sales per Segment | Average order value per segment |
| 07 | Profit Margin by Category | Profit margin % for each category |
| 08 | Region vs Category | Sales and profit by region and category |
| 09 | Top 5 States by Sales | Ranked top 5 states by revenue |
| 10 | Region Profit Contribution | Each region's % contribution to total profit |

---

## DAX Measures (Power BI)

```dax
Total Profit = SUM(ayush_superstore_data_2026[profit])

Profit Margin % = DIVIDE(SUM(ayush_superstore_data_2026[profit]), SUM(ayush_superstore_data_2026[sales])) * 100
```

---

## Key Insights

- West region leads in total sales at $725K
- Technology category has the highest profit margin
- Tables and Bookcases are the most loss-making sub-categories
- Consumer segment generates the highest revenue

---

## Setup

1. Download dataset from **Kaggle** (Sample Superstore)
2. Create an **S3 bucket** and upload the CSV
3. Create a **Glue Database** manually
4. Run **AWS Glue Crawler** pointing to the S3 bucket — it auto-creates tables in the Glue Catalog
5. Verify tables in **Glue Data Catalog**
6. Open **Amazon Athena** and run SQL queries on the cataloged data
7. Install **Amazon Athena ODBC Driver 2.x** and configure DSN
8. Connect **Power BI Desktop** directly to Athena via ODBC and build dashboard

---

## Author

**Ayush** — Data Analyst  
[LinkedIn](https://linkedin.com/in/ayush-ramreddy-96481a325) • [GitHub](https://github.com/ayushreddy80)
