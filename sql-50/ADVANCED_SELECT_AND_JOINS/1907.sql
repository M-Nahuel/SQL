Create table If Not Exists Accounts (account_id int, income int)
Truncate table Accounts
insert into Accounts (account_id, income) values ('3', '108939')
insert into Accounts (account_id, income) values ('2', '12747')
insert into Accounts (account_id, income) values ('8', '87709')
insert into Accounts (account_id, income) values ('6', '91796')

# Write your MySQL query statement below

SELECT category, COUNT(account_id) accounts_count
FROM (
    SELECT
        CASE
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            ELSE 'High Salary'
        END AS category,
        account_id
    FROM Accounts
) grouped
GROUP BY category;

-- PENDING: Does not yet handle test cases where no accounts fall into a given income range
-- (e.g: no accounts with 'Low Salary' -> missing category in output)
-- to be fixed by ensuring all 3 categories appear even with 0 count
