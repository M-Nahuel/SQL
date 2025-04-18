Create table If Not Exists Products (product_id int, new_price int, change_date date)
Truncate table Products
insert into Products (product_id, new_price, change_date) values ('1', '20', '2019-08-14')
insert into Products (product_id, new_price, change_date) values ('2', '50', '2019-08-14')
insert into Products (product_id, new_price, change_date) values ('1', '30', '2019-08-15')
insert into Products (product_id, new_price, change_date) values ('1', '35', '2019-08-16')
insert into Products (product_id, new_price, change_date) values ('2', '65', '2019-08-17')
insert into Products (product_id, new_price, change_date) values ('3', '20', '2019-08-18')

# Write your MySQL query statement below


-- SELECT prod.product_id,
--     COALESCE((
--         SELECT new_price
--         FROM Products
--         WHERE product_id = prod.product_id AND change_date <= '2019-08-16'
--         ORDER BY change_date DESC
--         LIMIT 1),
--         10) price
-- FROM (
--     SELECT DISTINCT(product_id)
--     FROM Products
-- ) prod;

WITH sorted AS (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY product_id
            ORDER BY change_date DESC
        ) num
    FROM Products
    WHERE change_date <= '2019-08-16'
),
latest AS (
    SELECT product_id, new_price
    FROM sorted
    WHERE num = 1
),
products AS (
    SELECT DISTINCT(product_id)
    FROM Products
)
SELECT prod.product_id, 
COALESCE(last.new_price,10) price
FROM products prod
LEFT JOIN latest last ON prod.product_id = last.product_id;