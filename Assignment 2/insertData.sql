delete from customers;
delete from employees;
delete from zipcodes;
delete from orders;
delete from odetails;
delete from parts;

insert into zipcodes values(67226,'Wichita');
insert into zipcodes values(60606,'Fort Dodge');
insert into zipcodes values(50302,'Kansas City');
insert into zipcodes values(54444,'Columbia');
insert into zipcodes values(66002,'Liberal');
insert into zipcodes values(61111,'Fort Hays');
insert into zipcodes values(28411,'Wilmington');
insert into zipcodes values(28408,'Wilmington');

insert into parts values(10506,'Land Before Time I',200,19.99,20);
insert into parts values(10507,'Land Before Time II',156,19.99,20);
insert into parts values(10508,'Land Before Time III',190,19.99,20);
insert into parts values(10509,'Land Before Time IV',60,19.99,20);
insert into parts values(10601,'Sleeping Beauty',300,24.99,20);
insert into parts values(10701,'When Harry Met Sally',120,19.99,30);
insert into parts values(10800,'Dirty Harry',140,14.99,30);
insert into parts values(10900,'Dr. Zhivago',100,24.99,30);
insert into parts values(10901,'A Star is Born',100,4.99,30);
insert into parts values(10902,'Star Wars',500,24.99,30);
insert into parts values(10903,'Lord of the Rings',100,34.99,30);

insert into customers values(1111,'Charles','123 Main St.',67226,'316-636-5555');
insert into customers values(2222,'Bertram','237 Ash Avenue',67226,'316-689-5555');
insert into customers values(3333,'Barbara','111 Inwood St.',60606,'316-111-1234');
insert into customers values(4444,'Will','111 Kenwood St.',54444,'416-111-1234');
insert into customers values(5555,'Bill','211 Marlwood St.',28408,'416-111-1235');
insert into customers values(6666,'Keely','211 Pinewood St.',28411,'416-111-1235');
insert into customers values(7777,'Maera','211 Marlwood St.',28408,'416-111-1235');

insert into employees values(1000,'Jones',67226,DATE '95-12-12');
insert into employees values(1001,'Smith',60606,DATE '92-01-01');
insert into employees values(1002,'Brown',50302,DATE '94-09-01');
insert into employees values(1003,'Green',28411,DATE '02-09-01');
insert into employees values(1004,'Purple',28411,DATE '03-01-01');

insert into orders values(1020,1111,1000,DATE '94-12-10',DATE '94-12-12');
insert into orders values(1021,1111,1000,DATE '95-01-12',DATE '95-01-15');
insert into orders values(1022,2222,1001,DATE '95-02-13',DATE '95-02-20');
insert into orders (ono,cno,eno,received) values(1023,3333,1000,DATE '03-02-15');
insert into orders values(1024,4444,1000,DATE '03-02-15',DATE '03-02-16');
insert into orders values(1025,5555,1000,DATE '03-02-15',DATE '03-02-16');

insert into odetails values(1020,10506,1);
insert into odetails values(1020,10800,1);
insert into odetails values(1020,10508,2);
insert into odetails values(1020,10509,3);
insert into odetails values(1021,10601,4);
insert into odetails values(1021,10506,7);
insert into odetails values(1022,10601,1);
insert into odetails values(1022,10701,1);
insert into odetails values(1023,10800,1);
insert into odetails values(1023,10900,1);
insert into odetails values(1023,10506,2);
insert into odetails values(1024,10506,12);
insert into odetails values(1025,10601,2);


