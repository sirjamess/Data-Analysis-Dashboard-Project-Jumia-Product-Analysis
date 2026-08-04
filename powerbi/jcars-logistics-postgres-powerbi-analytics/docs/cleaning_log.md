# JCars Logistics — Data Cleaning Log

This log tracks every data-quality issue identified in the raw dataset, the rule applied to address it, how many records were affected, and the decision made. Nothing is silently deleted — every flagged record is retained and marked, not removed, so the original scope of the data stays traceable.

### Issue: Blank Order IDs

- **Rule:** Convert empty/whitespace-only order_id values to a true NULL using NULLIF(TRIM(order_id), ''), and flag the row as having an invalid identifier.
- **Affected records:** 3
- **Decision:** Flagged, not deleted. Retained in the clean view with an is_valid_order_id = false flag so the rows stay visible for review rather than silently disappearing.

*Additional issues will be logged here as profiling and cleaning continue (dates, currencies, discounts, categories, ratings, returned flags, revenue/profit variance, and outliers).*