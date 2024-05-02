-- create tables and describe

create table medicine(
med_id number(10) not null,
med_name varchar2(30) not null,
generic_name varchar(50),
price number(6,2) not null,
company varchar2(30),
primary key(med_id)
);


create table outlet(
outlet_id number(10) not null,
outlet_name varchar2(30) not null,
city varchar2(30),
medicine_sold NUMBER(10),
primary key(outlet_id)
);


create table consumer(
con_id number(10) not null,
name varchar2(30) not null,
age number(3),
gender varchar2(6),
outlet_id number(10) not null,
primary key(con_id),
foreign key(outlet_id) references outlet(outlet_id)
);

create table clerk(
clerk_id number(10) not null,
name varchar2(30) not null,
role varchar2(30),
contact varchar2(16) not null,
outlet_id number(10) not null,
primary key(clerk_id),
foreign key(outlet_id) references outlet(outlet_id)
);


-- table with constraints and cascading

create table details(
details_id number(10) not null,
con_id number(10) not null,
med_id number(10) not null,
quantity number(10) not null,
exp_date DATE NOT NULL,
txn_date DATE NOT NULL,
primary key (details_id),
foreign key(con_id) references consumer(con_id),
foreign key(med_id) references medicine(med_id) on delete cascade,
constraint check_quantity check (quantity > 0),
constraint check_medicine check (exp_date > txn_date)
);


-- Describe the tables

describe medicine;
describe consumer;
describe details;
describe outlet;
describe clerk;



-- DDL


-- Add column mail in the table consumer
alter table consumer add mail char(30);
desc consumer;

-- Modify column definition of mail from char to varchar in the table consumer
alter table consumer modify mail varchar2(30);
desc consumer;

-- Rename the column name of mail to email
alter table consumer rename column mail to email;
desc consumer;

-- Drop the column email from table consumer
alter table consumer drop column email;
desc consumer;




--insert into details values(22,22,7,17,'21-DEC-2026','17-APR-2024');