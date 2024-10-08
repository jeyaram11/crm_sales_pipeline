--create staging schema, contains all load tables
CREATE SCHEMA crm_sales_pipeline_staging;  

--create datawarhouse, contains all transformed data
CREATE SCHEMA crm_sales_pipeline_warehouse;

--create sales_pipeline fact table
CREATE TABLE crm_sales_pipeline_warehouse.sales_data (
  oppoturnity_id varchar(50) PRIMARY KEY NOT NULL,
  sales_agent_id integer,
  product_id integer,
  account_id integer,
  deal_stage varchar(30),
  engage_stage date,
  close_date date,
  close_value integer,
  FOREIGN KEY (sales_agent_id) REFERENCES crm_sales_pipeline_warehouse.sales_agents(sales_agent_id),
  FOREIGN KEY (product_id) REFERENCES crm_sales_pipeline_warehouse.products(product_id),
  FOREIGN KEY (account_id) REFERENCES crm_sales_pipeline_warehouse.accounts(account_id)
  );

 --create sales_agent_table
 CREATE TABLE crm_sales_pipeline_warehouse.sales_agents (
 sales_agent_id int PRIMARY KEY NOT NULL,
 manager varchar(30),
 regional_office varchar(50)
);

--create products table
CREATE TABLE crm_sales_pipeline_warehouse.products (
product_id int PRIMARY KEY NOT NULL,
product varchar(30),
series varchar(30),
sales_price numeric
);

--create accounts table
CREATE TABLE crm_sales_pipeline_warehouse.accounts (
 account_id int primary key NOT NULL,
 account varchar(30),
 sector varchar(30),
 year_established int,
 revenue numeric(10,2),
 employees int,
 office_location varchar(50),
 subsidary_of varchar(50)
 );


--adding created at table to OLTP database
ALTER TABLE sales_data
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ADD COLUMN updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;



CREATE TABLE sales_data (
oppoturnity_id varchar(100),
sales_data varchar (50),
product varchar(100),
account varchar(100),
deal_stage varchar(20),
engage_data timestamp,
close_date timestamp,
close_value numeric,
created_at timestamp,
updated_at timestamp
);


