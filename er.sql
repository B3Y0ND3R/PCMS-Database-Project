-- short details for every consumer
select d.details_id,c.name,m.med_name,d.quantity,d.txn_date from details d join consumer c using(con_id) join medicine m using(med_id);

-- short details for every consumer from a specific outlet
select d.details_id,c.name,m.med_name,d.quantity,d.txn_date from details d join consumer c using(con_id) join medicine m using(med_id) where c.outlet_id = 1;

-- total medicine quantity from each outlet
select o.outlet_name,(select sum(quantity) from details d join consumer c on c.con_id = d.con_id where c.outlet_id =o.outlet_id)as total_qty from outlet o;


-- consumers who bought medicine between specific dates
select c.name, d.txn_date from details d join consumer c using(con_id) where d.txn_date between to_date('07-APR-2024') and to_date('15-APR-2024');

--counting total no. of consumers
select count(*) from consumer;

-- total clerks
select count(name) as no_of_clerks from clerk;

--distinct city count
select count(distinct city) as no_of_cities from outlet;

-- consumers’ average age
select avg(age) from consumer;

-- total sum of quantity of medicines
select sum(quantity) from details;

-- maximum and minimum price of medicines
select max(price) from medicine;
select min(price) from medicine;

--medicine bought by a specific consumer
select med_name from medicine where med_id = (select med_id from details where con_id =(select con_id from consumer where name='Ahsanul Haque Hasib'));

-- a new consumer added with his buyings
insert into consumer (con_id, name, age, gender, outlet_id) values(22, 'Farhan Sadaf', 28, 'Male', 10);
insert into details (details_id, con_id, med_id, quantity, exp_date, txn_date) values(22, 22, 2, 15, '15-AUG-25', '20-MAY-24');



delete from outlet where outlet_id=11;
delete from details where con_id=21;
delete from consumer where outlet_id=11;
delete from clerk where outlet_id=7;
delete from medicine where med_id=9;



update outlet set medicine_sold=180 where outlet_id=1;
update details set quantity=60 where details_id=21;
update consumer set outlet_id=5 where con_id=21;
update clerk set contact='+8801811111111' where clerk_id=1;
update medicine set price=15 where med_id=1;


