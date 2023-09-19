Create table If Not Exists Activity (player_id int, device_id int, event_date date, games_played int)
Truncate table Activity
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-01', '5')
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-02', '6')
insert into Activity (player_id, device_id, event_date, games_played) values ('2', '3', '2017-06-25', '1')
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '1', '2016-03-02', '0')
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '4', '2018-07-03', '5')

# Write your MySQL query statement below

SELECT ROUND(SUM(
  CASE
    WHEN DATEDIFF(A.event_date,B.first) = 1
    THEN 1
    ELSE 0
  END
)/COUNT(DISTINCT B.player_id), 2) fraction
FROM (SELECT player_id, MIN(event_date) first FROM Activity GROUP BY player_id) B
JOIN Activity A
ON A.player_id = B.player_id
