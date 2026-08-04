# JCars Logistics — PostgreSQL & Power BI Analytics Project

## Problem Statement

JCars Logistics is a vehicle import and dealership business operating across multiple branches in Kenya, handling everything from sourcing and sales to last-mile delivery. As the business has grown, its record-keeping has not kept pace: sales, customer, vehicle, payment, and delivery information is still tracked in a single spreadsheet maintained manually across branches and sales teams.

This has created a reporting problem for management. Dates are entered in whatever format a given branch happens to use. Prices and costs appear with currency symbols, commas, and shorthand notation mixed inconsistently within the same column. Discounts are recorded as percentages in some rows and decimals in others, with a number of entries that are not valid discounts at all. Vehicle makes, transmission types, and payment statuses are spelled and capitalized inconsistently depending on who entered them. In several cases, the revenue figure recorded for an order does not match what the order's own price, quantity, and discount would actually calculate to.

The practical effect is that management cannot currently answer basic questions with confidence — which branches are actually the most profitable, which vehicle models are underperforming on margin, where logistics costs are eating into revenue, or how much revenue is sitting uncollected — because the underlying data has never been validated or standardized.

This project addresses that gap by building a proper analytics foundation: a PostgreSQL database that preserves the original records exactly as received, a documented SQL cleaning layer that resolves the inconsistencies above without silently discarding anything, and a Power BI reporting layer that gives management a reliable, interactive view into sales performance, profitability, logistics efficiency, and collections risk — along with concrete, evidence-based recommendations on where to act first.

## Architecture

The project follows a layered pipeline: raw data is ingested unchanged, cleaned entirely in SQL, then modeled and visualized in Power BI.

```
Excel source (Jcars_logistics_dataset.xlsx — 276 rows, 32 columns)
   ↓
Raw PostgreSQL table (logistics.car_sales_raw — all TEXT columns, unmodified)
   ↓
Clean SQL view (logistics.vw_car_sales_clean — parsed, standardized, flagged)
   ↓
Power BI semantic model (star schema — FactSales + Dim tables, DAX measures)
   ↓
Power BI report (5 dashboard pages)
   ↓
Power BI Service / screenshots
   ↓
GitHub documentation (this repository)
```

| Stage | Description |
|---|---|
| **Excel source** | Original dataset (`Jcars_logistics_dataset.xlsx`), 276 rows / 32 columns, with known data-quality issues (mixed date formats, currency symbols, invalid discounts, text in numeric fields). |
| **Raw PostgreSQL table** | `logistics.car_sales_raw`. All columns typed as `TEXT` to guarantee every row loads without rejection, preserving the original data as-is for traceability. |
| **Clean SQL view** | `logistics.vw_car_sales_clean`. Applies all cleaning rules: currency/discount normalization, date parsing, category standardization, revenue/profit calculation, and outlier flagging. No records are deleted — invalid rows are flagged, not removed. |
| **Power BI semantic model** | Built from the clean view. Star schema with one fact table (`FactSales`) and seven dimension tables (`DimDate`, `DimCustomer`, `DimVehicle`, `DimGeography`, `DimSalesRep`, `DimPayment`, `DimDeliveryStatus`). |
| **Power BI report** | Five dashboard pages: Executive Overview, Vehicle & Sales Performance, Customers & Payments, Logistics & Delivery, Returns/Exceptions/Data Quality. |
| **Power BI Service** | Published report or documented screenshots/walkthrough (see `/screenshots`). |
| **GitHub documentation** | SQL scripts, data dictionary, cleaning log, data-quality report, and dashboard screenshots — all in this repository. |

## Tools Used

| Tool | Purpose |
|---|---|
| **Aiven PostgreSQL** | Cloud-hosted database for raw and cleaned data. |
| **DBeaver** | SQL client used to create the schema/tables, load data, and write cleaning/profiling queries. |
| **Power BI Desktop** | Semantic modeling, DAX measures, and dashboard build. |
| **GitHub** | Version control and project documentation. |
| **Excel** | Used only to export the original worksheet as UTF-8 CSV for loading into PostgreSQL. No cleaning performed in Excel. |

## Workflow
## Dashboard Pages
## Findings
## Recommendations
## Challenges
## Future Improvements