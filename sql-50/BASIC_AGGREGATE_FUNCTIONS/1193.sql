Create table If Not Exists Transactions (id int, country varchar(4), state enum('approved', 'declined'), amount int, trans_date date)
Truncate table Transactions
insert into Transactions (id, country, state, amount, trans_date) values ('121', 'US', 'approved', '1000', '2018-12-18')
insert into Transactions (id, country, state, amount, trans_date) values ('122', 'US', 'declined', '2000', '2018-12-19')
insert into Transactions (id, country, state, amount, trans_date) values ('123', 'US', 'approved', '2000', '2019-01-01')
insert into Transactions (id, country, state, amount, trans_date) values ('124', 'DE', 'approved', '2000', '2019-01-07')

# Write your MySQL query statement below

SELECT DATE_FORMAT(trans_date, '%Y-%m') month,
country,
COUNT(*) trans_count,
SUM(
    CASE
        WHEN state = 'approved' THEN 1
        ELSE 0
    END
) approved_count,
SUM(amount) trans_total_amount,
SUM(
    CASE
        WHEN state = 'approved' THEN amount
        ELSE 0
    END
) approved_total_amount
FROM Transactions
GROUP BY month, country;