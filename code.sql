show databases;
create database assignment;
use assignment;
create table salespeople(snum int,sname varchar(30) UNIQUE,city varchar(20),comm int,PRIMARY KEY(snum));
    insert into salespeople values
    -> (1001,"Peel","London",12),
    -> (1002,"Serres","Sanjose",13),
    -> (1004,"Motika","London",11),
    -> (1007,"Rifkin","Barcelona",15),
    -> (1003,"Axelrod","Newyork",10);
select * from salespeople;
    create table customers(
    -> cnum int,
    -> cname varchar(30),
    -> city varchar(20) NOT NULL,
    -> snum int,
    -> PRIMARY KEY (cnum),
    -> FOREIGN KEY (snum) REFERENCES salespeople(snum));
    insert into customers values
    -> (2001,"Hoffman","London",1001),
    -> (2002,"Giovanni","Rome",1003),
    -> (2003,"Liu","Sanjose",1002),
    -> (2004,"Grass","Berlin",1002),
    -> (2006,"Clemens","London",1001),
    -> (2008,"Cisneros","Sanjose",1007),
    -> (2007,"Pereira","Rome",1004);
select * from customers;
    create table orders(
    -> onum int,
    -> amt float,
    -> odate date,
    -> cnum int,
    -> snum int,
    -> PRIMARY KEY (onum),
    -> FOREIGN KEY (cnum) REFERENCES customers(cnum),
    -> FOREIGN KEY (snum) REFERENCES salespeople(snum));
    insert into orders values
    -> (3001,18.69,"1990-10-3",2008,1007),
    -> (3003,767.19,"1990-10-3",2001,1001),
    -> (3002,1900.10,"1990-10-3",2007,1004),
    -> (3005,5160.45,"1990-10-3",2003,1002),

    -> (3006,1098.16,"1990-10-3",2008,1007),
    -> (3009,1713.233,"1990-10-4",2002,1003),
    -> (3007,75.75,"1990-10-4",2004,1002),
    -> (3008,4273.00,"1990-10-5",2006,1001),
    -> (3010,1309.95,"1990-10-6",2004,1002),
    -> (3011,9891.88,"1990-10-6",2006,1001);
Question 1:Count the number of Salesperson whose name begin with ‘a’/’A’.
    select * from salespeople where sname LIKE "a%";
    select * from salespeople where sname LIKE "A%";
    select count(sname) from salespeople where sname LIKE "A%";
    select count(sname) from salespeople where sname LIKE "a%";
Question 2:Display all the Salesperson whose all orders worth is more than Rs. 2000.
    select salespeople.sname,orders.amt from salespeople
    -> inner join orders on salespeople.snum=orders.snum
    -> where amt>2000;
Question 3:Count the number of Salesperson belonging to Newyork
    select * from salespeople where city="Newyork";
    select count(city) from salespeople where city="Newyork";
Question 4:Display the number of Salespeople belonging to London and belonging to Paris.
    select * from salespeople where city in ("London","Paris");
Question 5:Display the number of orders taken by each Salesperson and their date of orders.
    select salespeople.sname,count(orders.onum),orders.odate from salespeople
    -> inner join orders on salespeople.snum=orders.snum group by salespeople.sname;
     select salespeople.sname,orders.onum,orders.odate from salespeople inner join orders on salespeople.snum=orders.snum;
    