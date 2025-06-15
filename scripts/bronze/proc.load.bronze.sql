/*
===================================================================================================
Stored procedure: load bronze layer (source -> bornze)
===================================================================================================
script purpose:
this stored procedure loads data into the 'bronze' schema from external csv files.
It performs the follwing actions:
- truncates the bronze table before loading data.
- uses the 'BULK INSERT' command to load data from csv files to bronze tables.
===================================================================================================
*/

TRUNCATE TABLE bronze.crm_cust_info;
BULK INSERT bronze.crm_cust_info
FROM 'F:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.CSV'
WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

TRUNCATE TABLE bronze.crm_prd_info;
BULK INSERT bronze.crm_prd_info
FROM 'F:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.CSV'
WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

TRUNCATE TABLE bronze.crm_sales_details;
BULK INSERT bronze.crm_sales_details
FROM 'F:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.CSV'
WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

TRUNCATE TABLE bronze.erp_cust_az12;
BULK INSERT bronze.erp_cust_az12
FROM 'F:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\cust_az12.CSV'
WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

TRUNCATE TABLE bronze.erp_loc_a101;
BULK INSERT bronze.erp_loc_a101
FROM 'F:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\loc_a101.CSV'
WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

TRUNCATE TABLE bronze.erp_px_cat_g1v2;
BULK INSERT bronze.erp_px_cat_g1v2
FROM 'F:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.CSV'
WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
