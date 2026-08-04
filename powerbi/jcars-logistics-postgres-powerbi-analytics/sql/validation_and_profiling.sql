--Confirm the CSV import completed correctly before any cleaning or profiling begins
--profile the data to identify quality issues that need addressing in the clean view

--Confirm the CSV import completed correctly before any cleaning or profiling begins
select COUNT(*) from logistics.car_sales_raw; 
--Expected rows from source (Jcars_logistics_dataset.xlsx) = 276

--Visual inspection to confirm column mapping was correct during import
select * from logistics.car_sales_raw limit 10; 
--confirmed: no column-shifting, values in expected field

--load-integrity check for nulls
select count(*) from logistics.car_sales_raw where order_id is null or trim(order_id) = '';
--checks for true nulls and empty-string values, since Excel exports blank cells as '' rather than NULL
	--confirmed result = 3





