DROP TABLE IF EXISTS zipcodes;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS parts;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS odetails;

CREATE TABLE zipcodes(zip INT NOT NULL,city char(30),PRIMARY KEY(zip)) ENGINE=INNODB;

CREATE TABLE employees(eno INT NOT NULL,ename char(30),zip INT NOT NULL,hdate DATE, 
							PRIMARY KEY(eno),
							FOREIGN KEY(zip) REFERENCES zipcodes(zip)) ENGINE=INNODB;

CREATE TABLE parts(pno INT NOT NULL,pname char(30),qoh INT NOT NULL,price FLOAT(2),
							level INT NOT NULL,
							PRIMARY KEY(pno)) ENGINE=INNODB;

CREATE TABLE customers(cno INT NOT NULL,cname char(30),street char(30),zip INT NOT NULL,
							phone char(30),
							PRIMARY KEY(cno),
							FOREIGN KEY(zip) REFERENCES zipcodes(zip)) ENGINE=INNODB;

CREATE TABLE orders(ono INT NOT NULL,cno INT NOT NULL,eno INT NOT NULL,received DATE,
							shipped DATE,
							PRIMARY KEY(ono),
							FOREIGN KEY(cno) REFERENCES customers(cno),
							FOREIGN KEY(eno) REFERENCES employees(eno)) ENGINE=INNODB;

CREATE TABLE odetails(ono INT NOT NULL,pno INT NOT NULL,qty INT NOT NULL,
							PRIMARY KEY(ono,pno),
							FOREIGN KEY(ono) REFERENCES orders(ono),
							FOREIGN KEY(pno) REFERENCES parts(pno)) ENGINE=INNODB;
