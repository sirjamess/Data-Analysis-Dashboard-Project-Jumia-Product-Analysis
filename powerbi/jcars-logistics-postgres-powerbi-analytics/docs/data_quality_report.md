## Load Validation

- Source row count (Jcars_logistics_dataset.xlsx, Raw_Car_Sales sheet): 276
- Loaded row count (logistics.car_sales_raw): 276 — confirmed match, no rows lost or rejected during import
- Column mapping: visually confirmed correct on a 10-row sample, no column-shifting
- Missing/blank Order IDs: 3 (stored as empty strings on load, not true NULL — detected via combined NULL/empty-string check)