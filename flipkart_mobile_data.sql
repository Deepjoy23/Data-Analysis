-- database creation-------------
create database flipkart;

-- viewing the table--------------------------
select * from flipkart_mobile_data;
select * from flipkart_mobile_data_2;

-- auto increment of primary key when a table exist without a primary key and it's column--------------- 
alter table flipkart_mobile_data 
add column product_id int not null auto_increment primary key;

-- details of a table-------------------
describe flipkart_mobile_data;

-- droping a column from a table--------------
alter table flipkart_mobile_data
drop column product_id;

-- rearrange the column sequence in a table------
alter table flipkart_mobile_data
modify column product_id int first;

-- Updating some null values in a table----------
update flipkart_mobile_data
set ratings = null
where product_id in (430,427,425,422);

-- Rename a Column of a Table----
alter table flipkart_mobile_data 
change sales_price sale_price_before_discount double;

-- Changing the discount_percent column logic (discount_percent = discount_percent*100)--- 
update flipkart_mobile_data
set discount_percent = discount_percent*100;

-- Changing the discount_percent data type as decimal(10,2)--- 
alter table flipkart_mobile_data 
modify column discount_percent decimal(10,2);

-- View a column of discounted_amount [logic = ((sale_price_before_discount*(100-discount_percent))/100) ]------------
select a.*, round(((sale_price_before_discount*(100-discount_percent))/100),2) as discounted_amount from flipkart_mobile_data a;

-- View a column of sales_after_discount_crore [logic = ((sales_crore*(100-discount_percent))/100) ]------------
select a.*, round(((sales*(100-discount_percent))/100),2) as sales_after_discount_crore from flipkart_mobile_data a;

-- Rename a Column of a Table----
alter table flipkart_mobile_data 
change sales total_sales_before_discount_crore decimal(10,2);



