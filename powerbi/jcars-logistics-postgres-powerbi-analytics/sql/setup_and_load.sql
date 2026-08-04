-- Initial database setup for the JCars Logistics project
-- creates the database, schema, raw ingestion table, and documents how the source data was loaded.
--NOTE;
--Run the CREATE DATABASE command once while connected to defaultdb
--Reconnect to jcars_logistics before running the remaining statements in this script.

-- create the database(run while connected to defaultdb)
create database jcars_logistics;

--Reconnect to created jcars_logistics database before continuing

-- create the schema 
create schema logistics;

-- set default schema to logistics (avoid repeated schema referencing for this session)
set search_path to logistics;

show search_path;

--create raw table with columns formated as TEXT to prevent rejected rows during first load from data quality issues
--The table preserves the original dataset unchanged; all cleaning and transformations are performed later in another sql script file.
create table car_sales_raw(
    order_id TEXT,
    order_date TEXT,
    delivery_date TEXT,
    customer_name TEXT,
    customer_type TEXT,
    customer_age TEXT,
    region TEXT,
    county TEXT,
    city TEXT,
    branch TEXT,
    sales_rep TEXT,
    lead_source TEXT,
    car_make TEXT,
    car_model TEXT,
    vehicle_type TEXT,
    vehicle_year TEXT,
    fuel_type TEXT,
    transmission TEXT,
    color TEXT,
    units_sold TEXT,
    unit_selling_price TEXT,
    unit_cost TEXT,
    discount TEXT,
    delivery_fee TEXT,
    logistics_cost TEXT,
    payment_method TEXT,
    payment_status TEXT,
    delivery_status TEXT,
    customer_rating TEXT,
    review_count TEXT,
    returned TEXT,
    revenue_recorded TEXT
    );

-- Data loaded using DBeaver's Data Transfer wizard (right-click table -> Import Data)
-- Original excel file,Jcars_logistics_dataset.xlsx, Raw_Car_Sales sheet (276 rows, 32 columns), converted into CSV (UTF-8) before importing
-- column-mapping to ensure the excel CSV file column headers matched the existing columns in above created table(avoid auto creation of new colums)



