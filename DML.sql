-- DML

-- insert into medicine table

insert into medicine (med_id, med_name, generic_name, price, company) values(1, 'Napa', 'Paracetamol', 10.00, 'Beximco Bangladesh Limited');
insert into medicine (med_id, med_name, generic_name, price, company) values(2, 'Neurobion', 'Vitamin B Complex', 80.00, 'Merck Limited');
insert into medicine (med_id, med_name, generic_name, price, company) values(3, 'Norflox', 'Norfloxacin', 60.00, 'Incepta Pharmaceuticals Ltd');
insert into medicine (med_id, med_name, generic_name, price, company) values(4, 'Metformin', 'Metformin Hydrochloride', 70.00, 'ACI Limited');
insert into medicine (med_id, med_name, generic_name, price, company) values(5, 'Nexium', 'Esomeprazole', 90.00, 'AstraZeneca Ltd');
insert into medicine (med_id, med_name, generic_name, price, company) values(6, 'Ciprofloxacin', 'Ciprofloxacin', 65.00, 'Square Pharmaceuticals Ltd.');
insert into medicine (med_id, med_name, generic_name, price, company) values(7, 'Atorvastatin', 'Atorvastatin Calcium', 75.00, 'Drug International Limited');
insert into medicine (med_id, med_name, generic_name, price, company) values(8, 'Omeprazole', 'Omeprazole', 85.00, 'Eskayef Pharmaceuticals Ltd.');
insert into medicine (med_id, med_name, generic_name, price, company) values(9, 'Amoxicillin', 'Amoxicillin', 55.00, 'Opsonin Pharma Limited');
insert into medicine (med_id, med_name, generic_name, price, company) values(10, 'Diclofenac', 'Diclofenac Sodium', 40.00, 'Renata Limited');


-- insert into outlet table

insert into outlet (outlet_id, outlet_name, city, medicine_sold) values(1, 'Pharma Plus', 'Dhaka', 83);
insert into outlet (outlet_id, outlet_name, city, medicine_sold) values(2, 'MediMart', 'Chittagong', 148);
insert into outlet (outlet_id, outlet_name, city, medicine_sold) values(3, 'HealthCare', 'Dhaka', 31);
insert into outlet (outlet_id, outlet_name, city, medicine_sold) values(4, 'Life Pharmacy', 'Rajshahi', 10);
insert into outlet (outlet_id, outlet_name, city, medicine_sold) values(5, 'Wellness Pharmacy', 'Khulna', 5);
insert into outlet (outlet_id, outlet_name, city, medicine_sold) values(6, 'MediCare', 'Mymensingh', 20);
insert into outlet (outlet_id, outlet_name, city, medicine_sold) values(7, 'MediLife', 'Chittagong', 12);
insert into outlet (outlet_id, outlet_name, city, medicine_sold) values(8, 'Healthy Living', 'Rajshahi', 15);
insert into outlet (outlet_id, outlet_name, city, medicine_sold) values(9, 'PharmaCare', 'Mymensingh', 7);
insert into outlet (outlet_id, outlet_name, city, medicine_sold) values(10, 'MediWorld', 'Dhaka', 8);
insert into outlet (outlet_id, outlet_name, city, medicine_sold) values(11, 'HealthEase', 'Dhaka', 0);


-- insert into consumer table

insert into consumer (con_id, name, age, gender, outlet_id) values(1, 'Ahsanul Haque Hasib', 25, 'Male', 1);
insert into consumer (con_id, name, age, gender, outlet_id) values(2, 'Payel Saha', 30, 'Female', 2);
insert into consumer (con_id, name, age, gender, outlet_id) values(3, 'Shoumik Barman Polok', 40, 'Male', 1);
insert into consumer (con_id, name, age, gender, outlet_id) values(4, 'Aisha Begum', 35, 'Female', 3);
insert into consumer (con_id, name, age, gender, outlet_id) values(5, 'Md. Sakibur Rahman', 28, 'Male', 2);
insert into consumer (con_id, name, age, gender, outlet_id) values(6, 'Sadia Akter', 32, 'Female', 1);
insert into consumer (con_id, name, age, gender, outlet_id) values(7, 'Rahima Khatun', 45, 'Female', 3);
insert into consumer (con_id, name, age, gender, outlet_id) values(8, 'Ashrarul Haque Sifat', 27, 'Male', 2);
insert into consumer (con_id, name, age, gender, outlet_id) values(9, 'Jawaria Binte Khalid', 33, 'Female', 1);
insert into consumer (con_id, name, age, gender, outlet_id) values(10, 'Md. Umar Faruk', 38, 'Male', 3);
insert into consumer (con_id, name, age, gender, outlet_id) values(11, 'Mohammad Rahman', 25, 'Male', 1);
insert into consumer (con_id, name, age, gender, outlet_id) values(12, 'Fatima Khanam', 30, 'Female', 2);
insert into consumer (con_id, name, age, gender, outlet_id) values(13, 'Abdul Haque', 40, 'Male', 4); 
insert into consumer (con_id, name, age, gender, outlet_id) values(14, 'Sadia Yasmin', 35, 'Female', 5); 
insert into consumer (con_id, name, age, gender, outlet_id) values(15, 'Kamal Ahmed', 28, 'Male', 6); 
insert into consumer (con_id, name, age, gender, outlet_id) values(16, 'Ayesha Begum', 32, 'Female', 8); 
insert into consumer (con_id, name, age, gender, outlet_id) values(17, 'Faisal Khan', 45, 'Male', 9); 
insert into consumer (con_id, name, age, gender, outlet_id) values(18, 'Farzana Akhter', 27, 'Female', 10);
insert into consumer (con_id, name, age, gender, outlet_id) values(19, 'Imran Hossain', 33, 'Male', 3); 
insert into consumer (con_id, name, age, gender, outlet_id) values(20, 'Nazia Islam', 38, 'Female', 7);


-- insert into details table

insert into details (details_id, con_id, med_id, quantity, exp_date, txn_date) values(1, 1, 1, 20, '01-MAY-2025', '06-APR-2024');
insert into details (details_id, con_id, med_id, quantity, exp_date, txn_date) values(2, 2, 3, 100, '15-JUN-2025', '06-APR-2024');
insert into details (details_id, con_id, med_id, quantity, exp_date, txn_date) values(3, 3, 5, 3, '20-MAY-2025', '07-APR-2024');
insert into details (details_id, con_id, med_id, quantity, exp_date, txn_date) values(4, 4, 2, 2, '10-MAY-2025', '07-APR-2024');
insert into details (details_id, con_id, med_id, quantity, exp_date, txn_date) values(5, 5, 4, 15, '25-MAY-2025', '08-APR-2024');
insert into details (details_id, con_id, med_id, quantity, exp_date, txn_date) values(6, 6, 6, 26, '01-JUN-2025', '08-APR-2024');
insert into details (details_id, con_id, med_id, quantity, exp_date, txn_date) values(7, 7, 8, 8, '20-JUN-2025', '09-APR-2024');
insert into details (details_id, con_id, med_id, quantity, exp_date, txn_date) values(8, 8, 10, 3, '01-JUL-2025', '09-APR-2024');
insert into details (details_id, con_id, med_id, quantity, exp_date, txn_date) values(9, 9, 7, 9, '15-MAY-2025', '10-APR-2024');
insert into details (details_id, con_id, med_id, quantity, exp_date, txn_date) values(10, 10, 9, 11, '30-MAY-2025', '10-APR-2024');
insert into details (details_id, con_id, med_id, quantity, exp_date, txn_date) values(11, 11, 1, 25, '15-MAY-25', '11-APR-24');
insert into details (details_id, con_id, med_id, quantity, exp_date, txn_date) values(12, 12, 3, 30, '20-JUN-25', '11-APR-24');
insert into details (details_id, con_id, med_id, quantity, exp_date, txn_date) values(13, 13, 5, 10, '25-JUN-25', '12-APR-24');
insert into details (details_id, con_id, med_id, quantity, exp_date, txn_date) values(14, 14, 2, 5, '05-JUL-25', '12-APR-24');
insert into details (details_id, con_id, med_id, quantity, exp_date, txn_date) values(15, 15, 4, 20, '10-JUL-25', '13-APR-24');
insert into details (details_id, con_id, med_id, quantity, exp_date, txn_date) values(16, 16, 6, 15, '15-JUL-25', '13-APR-24');
insert into details (details_id, con_id, med_id, quantity, exp_date, txn_date) values(17, 17, 8, 7, '20-JUL-25', '14-APR-24');
insert into details (details_id, con_id, med_id, quantity, exp_date, txn_date) values(18, 18, 10, 8, '25-JUL-25', '14-APR-24');
insert into details (details_id, con_id, med_id, quantity, exp_date, txn_date) values(19, 19, 7, 12, '30-JUL-25', '15-APR-24');
insert into details (details_id, con_id, med_id, quantity, exp_date, txn_date) values(20, 20, 9, 10, '05-AUG-25', '15-APR-24');


-- insert into clerk table

insert into clerk (clerk_id, name, role, contact, outlet_id) values(1, 'Md. Rahman', 'Distributer', '+8801855555555', 1);
insert into clerk (clerk_id, name, role, contact, outlet_id) values(2, 'Fatima Akter', 'Pharmacy Assistant', '+8801711111111', 2);
insert into clerk (clerk_id, name, role, contact, outlet_id) values(3, 'Kamal Hossain', 'Store Manager', '+8801622222222', 1);
insert into clerk (clerk_id, name, role, contact, outlet_id) values(4, 'Aisha Khan', 'Distributer', '+8801966666666', 3);
insert into clerk (clerk_id, name, role, contact, outlet_id) values(5, 'Nurul Islam', 'Pharmacy Assistant', '+8801811111111', 5);
insert into clerk (clerk_id, name, role, contact, outlet_id) values(6, 'Sadia Akter', 'Store Manager', '+8801799999999', 9);
insert into clerk (clerk_id, name, role, contact, outlet_id) values(7, 'Rahima Khatun', 'Distributer', '+8801677777777', 4);
insert into clerk (clerk_id, name, role, contact, outlet_id) values(8, 'Shahidul Islam', 'Pharmacy Assistant', '+8801944444444', 4);
insert into clerk (clerk_id, name, role, contact, outlet_id) values(9, 'Sumaiya Khan', 'Store Manager', '+8801800000000', 7);
insert into clerk (clerk_id, name, role, contact, outlet_id) values(10, 'Abdul Rahman', 'Distributer', '+8801788888888', 8);


-- select command

select * from medicine;
select * from consumer;
select * from details;
select * from outlet;
select * from clerk;


select name, age, gender from consumer where outlet_id=1;



--update data in the table consumer

update consumer set name='Peyal Saha', gender='female' where con_id=2;

-- Deleting row from table outlet 

insert into outlet values(11,'Tempest','Khulna');
delete from outlet where outlet_id=11;


-- union, intersect, except (minus)

select outlet_name from outlet where city='Dhaka' union select outlet_name from outlet where city='Rajshahi';
select name from consumer where gender='Male' intersect select name from consumer where outlet_id=1;
select con_id, name, age, gender, outlet_id from consumer minus select con_id, name, age, gender, outlet_id from consumer where age > 30;


-- aggregate function

select count(*) from consumer;
select count(name) as no_of_clerks from clerk;
select count(distinct city) as no_of_cities from outlet;
select avg(age) from consumer;
select sum(quantity) from details;
select max(price) from medicine;
select min(price) from medicine;


-- with clause

with max_med_sold(val) as (select max(medicine_sold) from outlet)
select outlet_name,medicine_sold from outlet,max_med_sold where outlet.medicine_sold=max_med_sold.val;

-- group by and having

select gender,avg(age) from consumer group by gender;
select gender, avg(age) as avg_age from consumer group by gender having avg(age) > 32;

-- nested subquery

select med_name from medicine where med_id = (select med_id from details where con_id =(select con_id from consumer where name='Ahsanul Haque Hasib'));



-- set membership(and, or, not)

select name from consumer where gender='Male' and outlet_id=1;
select name from consumer where gender='Male' or outlet_id > 2;
select * from consumer where not (age > 30);

-- string operations

select * from consumer where name like 'Shoumik%';
select * from consumer where name like '%Rahman';
select * from consumer where name like '%Haque%';
select * from consumer where gender like '____';


-- views
create view consumer_details as select c.name as c_name, m.med_name as m_name, d.quantity as qty, o.outlet_name as o_name from consumer c join outlet o 
on c.outlet_id = o.outlet_id join details d on c.con_id = d.con_id join medicine m on d.med_id = m.med_id;

select * from consumer_details;
create view  custom as select * from consumer_details where qty<9;
select * from custom;


-- join operations 

-- natural join

select * from outlet natural join consumer where outlet_id=1;

-- join

select * from outlet join consumer on outlet.outlet_id=consumer.outlet_id;

-- left outer join

select * from outlet left outer join consumer using(outlet_id);

-- right outer join

select * from outlet right outer join consumer using(outlet_id);

-- full outer join

select * from outlet full outer join consumer using(outlet_id);


