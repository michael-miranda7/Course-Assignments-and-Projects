Michael Miranda

Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 853
Server version: 5.7.24-0ubuntu0.16.04.1 (Ubuntu)

Copyright (c) 2000, 2018, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use mrm5671;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> describe customers;
+--------+----------+------+-----+---------+-------+
| Field  | Type     | Null | Key | Default | Extra |
+--------+----------+------+-----+---------+-------+
| cno    | int(11)  | NO   | PRI | NULL    |       |
| cname  | char(10) | YES  |     | NULL    |       |
| street | char(20) | YES  |     | NULL    |       |
| zip    | int(11)  | NO   | MUL | NULL    |       |
| phone  | char(20) | YES  |     | NULL    |       |
+--------+----------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> select * from customers;
+------+---------+------------------+-------+--------------+
| cno  | cname   | street           | zip   | phone        |
+------+---------+------------------+-------+--------------+
| 1111 | Charles | 123 Main St.     | 67226 | 316-636-5555 |
| 2222 | Bertram | 237 Ash Avenue   | 67226 | 316-689-5555 |
| 3333 | Barbara | 111 Inwood St.   | 60606 | 316-111-1234 |
| 4444 | Will    | 111 Kenwood St.  | 54444 | 416-111-1234 |
| 5555 | Bill    | 211 Marlwood St. | 28408 | 416-111-1235 |
| 6666 | Keely   | 211 Pinewood St. | 28411 | 416-111-1235 |
| 7777 | Maera   | 211 Marlwood St. | 28408 | 416-111-1235 |
+------+---------+------------------+-------+--------------+
7 rows in set (0.00 sec)

mysql> describe employees;
+-------+----------+------+-----+---------+-------+
| Field | Type     | Null | Key | Default | Extra |
+-------+----------+------+-----+---------+-------+
| eno   | int(11)  | NO   | PRI | NULL    |       |
| ename | char(10) | YES  |     | NULL    |       |
| zip   | int(11)  | NO   | MUL | NULL    |       |
| hdate | date     | YES  |     | NULL    |       |
+-------+----------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> select * from employees;
+------+--------+-------+------------+
| eno  | ename  | zip   | hdate      |
+------+--------+-------+------------+
| 1000 | Jones  | 67226 | 1995-12-12 |
| 1001 | Smith  | 60606 | 1992-01-01 |
| 1002 | Brown  | 50302 | 1994-09-01 |
| 1003 | Green  | 28411 | 2002-09-01 |
| 1004 | Purple | 28411 | 2003-01-01 |
+------+--------+-------+------------+
5 rows in set (0.00 sec)

mysql> describe zipcodes;
+-------+----------+------+-----+---------+-------+
| Field | Type     | Null | Key | Default | Extra |
+-------+----------+------+-----+---------+-------+
| zip   | int(11)  | NO   | PRI | NULL    |       |
| city  | char(20) | YES  |     | NULL    |       |
+-------+----------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> select * from zipcodes;
+-------+-------------+
| zip   | city        |
+-------+-------------+
| 28408 | Wilmington  |
| 28411 | Wilmington  |
| 50302 | Kansas City |
| 54444 | Columbia    |
| 60606 | Fort Dodge  |
| 61111 | Fort Hays   |
| 66002 | Liberal     |
| 67226 | Wichita     |
+-------+-------------+
8 rows in set (0.00 sec)

mysql> describe orders;
+----------+---------+------+-----+---------+-------+
| Field    | Type    | Null | Key | Default | Extra |
+----------+---------+------+-----+---------+-------+
| ono      | int(11) | NO   | PRI | NULL    |       |
| cno      | int(11) | NO   | MUL | NULL    |       |
| eno      | int(11) | NO   | MUL | NULL    |       |
| received | date    | YES  |     | NULL    |       |
| shipped  | date    | YES  |     | NULL    |       |
+----------+---------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> select * from orders;
+------+------+------+------------+------------+
| ono  | cno  | eno  | received   | shipped    |
+------+------+------+------------+------------+
| 1020 | 1111 | 1000 | 1994-12-10 | 1994-12-12 |
| 1021 | 1111 | 1000 | 1995-01-12 | 1995-01-15 |
| 1022 | 2222 | 1001 | 1995-02-13 | 1995-02-20 |
| 1023 | 3333 | 1000 | 2003-02-15 | NULL       |
| 1024 | 4444 | 1000 | 2003-02-15 | 2003-02-16 |
| 1025 | 5555 | 1000 | 2003-02-15 | 2003-02-16 |
+------+------+------+------------+------------+
6 rows in set (0.00 sec)

mysql> describe odetails;
+-------+---------+------+-----+---------+-------+
| Field | Type    | Null | Key | Default | Extra |
+-------+---------+------+-----+---------+-------+
| ono   | int(11) | NO   | PRI | NULL    |       |
| pno   | int(11) | NO   | PRI | NULL    |       |
| qty   | int(11) | NO   |     | NULL    |       |
+-------+---------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> select * from odetails;
+------+-------+-----+
| ono  | pno   | qty |
+------+-------+-----+
| 1020 | 10506 |   1 |
| 1020 | 10508 |   2 |
| 1020 | 10509 |   3 |
| 1020 | 10800 |   1 |
| 1021 | 10506 |   7 |
| 1021 | 10601 |   4 |
| 1022 | 10601 |   1 |
| 1022 | 10701 |   1 |
| 1023 | 10506 |   2 |
| 1023 | 10800 |   1 |
| 1023 | 10900 |   1 |
| 1024 | 10506 |  12 |
| 1025 | 10601 |   2 |
+------+-------+-----+
13 rows in set (0.00 sec)

mysql> describe parts;
+-------+----------+------+-----+---------+-------+
| Field | Type     | Null | Key | Default | Extra |
+-------+----------+------+-----+---------+-------+
| pno   | int(11)  | NO   | PRI | NULL    |       |
| pname | char(20) | YES  |     | NULL    |       |
| qoh   | int(11)  | NO   |     | NULL    |       |
| price | float    | YES  |     | NULL    |       |
| level | int(11)  | NO   |     | NULL    |       |
+-------+----------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> select * from parts;
+-------+----------------------+-----+-------+-------+
| pno   | pname                | qoh | price | level |
+-------+----------------------+-----+-------+-------+
| 10506 | Land Before Time I   | 200 | 19.99 |    20 |
| 10507 | Land Before Time II  | 156 | 19.99 |    20 |
| 10508 | Land Before Time III | 190 | 19.99 |    20 |
| 10509 | Land Before Time IV  |  60 | 19.99 |    20 |
| 10601 | Sleeping Beauty      | 300 | 24.99 |    20 |
| 10701 | When Harry Met Sally | 120 | 19.99 |    30 |
| 10800 | Dirty Harry          | 140 | 14.99 |    30 |
| 10900 | Dr. Zhivago          | 100 | 24.99 |    30 |
| 10901 | A Star is Born       | 100 |  4.99 |    30 |
| 10902 | Star Wars            | 500 | 24.99 |    30 |
| 10903 | Lord of the Rings    | 100 | 34.99 |    30 |
+-------+----------------------+-----+-------+-------+
11 rows in set (0.00 sec)

#1. Get pno and pname values for parts that are priced less than 20.00 and for which orders have been placed.

mysql> select pno,pname,price
    -> from parts natural join odetails
    -> where price < 20.00;
+-------+----------------------+-------+
| pno   | pname                | price |
+-------+----------------------+-------+
| 10506 | Land Before Time I   | 19.99 |
| 10506 | Land Before Time I   | 19.99 |
| 10506 | Land Before Time I   | 19.99 |
| 10506 | Land Before Time I   | 19.99 |
| 10508 | Land Before Time III | 19.99 |
| 10509 | Land Before Time IV  | 19.99 |
| 10701 | When Harry Met Sally | 19.99 |
| 10800 | Dirty Harry          | 14.99 |
| 10800 | Dirty Harry          | 14.99 |
+-------+----------------------+-------+
9 rows in set (0.00 sec)

#2. Get all details (all CUSTOMER attributes) of customers whose names have the letter e as the second and third letters.

mysql> select *
    -> from customers
    -> where cname like '_ee%';
+------+-------+------------------+-------+--------------+
| cno  | cname | street           | zip   | phone        |
+------+-------+------------------+-------+--------------+
| 6666 | Keely | 211 Pinewood St. | 28411 | 416-111-1235 |
+------+-------+------------------+-------+--------------+
1 row in set (0.00 sec)

#3. Get cname and ename pairs such that the customer with name cname has placed an order through employee with name ename.

mysql> select distinct cname,ename
    -> from customers natural join orders,employees
    -> where orders.eno = employees.eno;
+---------+-------+
| cname   | ename |
+---------+-------+
| Charles | Jones |
| Bertram | Smith |
| Barbara | Jones |
| Will    | Jones |
| Bill    | Jones |
+---------+-------+
5 rows in set (0.00 sec)

#4. For each odetail row get ono, pno, pname, qty and price values along with the total price for this item.

mysql> select ono,pno,pname,qty,price,round((qty*price),2) as total
    -> from parts natural join odetails;
+------+-------+----------------------+-----+-------+--------+
| ono  | pno   | pname                | qty | price | total  |
+------+-------+----------------------+-----+-------+--------+
| 1020 | 10506 | Land Before Time I   |   1 | 19.99 |  19.99 |
| 1020 | 10508 | Land Before Time III |   2 | 19.99 |  39.98 |
| 1020 | 10509 | Land Before Time IV  |   3 | 19.99 |  59.97 |
| 1020 | 10800 | Dirty Harry          |   1 | 14.99 |  14.99 |
| 1021 | 10506 | Land Before Time I   |   7 | 19.99 | 139.93 |
| 1021 | 10601 | Sleeping Beauty      |   4 | 24.99 |  99.96 |
| 1022 | 10601 | Sleeping Beauty      |   1 | 24.99 |  24.99 |
| 1022 | 10701 | When Harry Met Sally |   1 | 19.99 |  19.99 |
| 1023 | 10506 | Land Before Time I   |   2 | 19.99 |  39.98 |
| 1023 | 10800 | Dirty Harry          |   1 | 14.99 |  14.99 |
| 1023 | 10900 | Dr. Zhivago          |   1 | 24.99 |  24.99 |
| 1024 | 10506 | Land Before Time I   |  12 | 19.99 | 239.88 |
| 1025 | 10601 | Sleeping Beauty      |   2 | 24.99 |  49.98 |
+------+-------+----------------------+-----+-------+--------+
13 rows in set (0.00 sec)

#5. Get all pairs of cno values such that both customers in a pair live in the same zip code.

mysql> select s.cno,t.cno
    -> from customers as s,customers as t
    -> where s.zip = t.zip
    -> and s.cno <> t.cno;
+------+------+
| cno  | cno  |
+------+------+
| 5555 | 7777 |
| 7777 | 5555 |
| 1111 | 2222 |
| 2222 | 1111 |
+------+------+
4 rows in set (0.00 sec)

#6. Get pno and # of orders for parts that have been included in at least two different orders.

mysql> select pno,count(pno) as number
    -> from odetails
    -> group by pno
    -> having number > 1;
+-------+--------+
| pno   | number |
+-------+--------+
| 10506 |      4 |
| 10601 |      3 |
| 10800 |      2 |
+-------+--------+
3 rows in set (0.01 sec)

#7. Get the cno and cname values for customers who have placed an order for Dirty Harry OR Dr. Zhivago.

mysql> select distinct cno,cname
    -> from customers natural join orders natural join odetails natural join parts
    -> where pname = 'Dirty Harry' or pname = 'Dr. Zhivago';
+------+---------+
| cno  | cname   |
+------+---------+
| 1111 | Charles |
| 3333 | Barbara |
+------+---------+
2 rows in set (0.00 sec)

#8. Get cname values for customers who have placed at least one order with employee with eno = 1000.

mysql> select distinct cname
    -> from customers natural join orders
    -> where eno = 1000;
+---------+
| cname   |
+---------+
| Charles |
| Barbara |
| Will    |
| Bill    |
+---------+
4 rows in set (0.00 sec)

#9. Get the total quantity of part 10601 that have been ordered.

mysql> select sum(qty) as total
    -> from odetails
    -> where pno = 10601;
+-------+
| total |
+-------+
|     7 |
+-------+
1 row in set (0.00 sec)

#10. For each order, get the total value in dollars for that order.

mysql> select ono,sum(round((qty*price),2)) as total
    -> from orders natural join parts natural join odetails
    -> group by ono;
+------+--------+
| ono  | total  |
+------+--------+
| 1020 | 134.93 |
| 1021 | 239.89 |
| 1022 |  44.98 |
| 1023 |  79.96 |
| 1024 | 239.88 |
| 1025 |  49.98 |
+------+--------+
6 rows in set (0.00 sec)

#11. List each city and the number of customers living in that city.

mysql> select city, count(*) as number
    -> from(select city
    -> from customers,zipcodes
    -> where customers.zip = zipcodes.zip) as c
    -> group by city;
+------------+--------+
| city       | number |
+------------+--------+
| Columbia   |      1 |
| Fort Dodge |      1 |
| Wichita    |      2 |
| Wilmington |      3 |
+------------+--------+
4 rows in set (0.00 sec)

#12. List the pno and pname of parts that cost more than the average cost of all parts.

mysql> select pno,pname,price
    -> from parts
    -> where price > all(select avg(price) from parts);
+-------+-------------------+-------+
| pno   | pname             | price |
+-------+-------------------+-------+
| 10601 | Sleeping Beauty   | 24.99 |
| 10900 | Dr. Zhivago       | 24.99 |
| 10902 | Star Wars         | 24.99 |
| 10903 | Lord of the Rings | 34.99 |
+-------+-------------------+-------+
4 rows in set (0.00 sec)

#13. For each part that has been sold, get pno and pname values along with total sales in dollars for that part.

mysql> select pno,pname,sum(round((price*qty),2)) as sales
    -> from parts natural join odetails
    -> group by pno;
+-------+----------------------+--------+
| pno   | pname                | sales  |
+-------+----------------------+--------+
| 10506 | Land Before Time I   | 439.78 |
| 10508 | Land Before Time III |  39.98 |
| 10509 | Land Before Time IV  |  59.97 |
| 10601 | Sleeping Beauty      | 174.93 |
| 10701 | When Harry Met Sally |  19.99 |
| 10800 | Dirty Harry          |  29.98 |
| 10900 | Dr. Zhivago          |  24.99 |
+-------+----------------------+--------+
7 rows in set (0.00 sec)

#14. For each part get pno and pname values along with total sales in dollars for that part, but only when the total sales amount exceeds $100.

mysql> select pno,pname,sum(round((price*qty),2)) as sales
    -> from parts natural join odetails
    -> group by pno
    -> having sales > 100.00;
+-------+--------------------+--------+
| pno   | pname              | sales  |
+-------+--------------------+--------+
| 10506 | Land Before Time I | 439.78 |
| 10601 | Sleeping Beauty    | 174.93 |
+-------+--------------------+--------+
2 rows in set (0.00 sec)

#15. Get ono values for orders that were shipped within two days of the receipt of the order.

mysql> select ono
    -> from (select ono, DATEDIFF(shipped,received) as datediff
    -> from orders
    -> having datediff <=2) as diff;
+------+
| ono  |
+------+
| 1020 |
| 1024 |
| 1025 |
+------+
3 rows in set (0.00 sec)

mysql> notee;
