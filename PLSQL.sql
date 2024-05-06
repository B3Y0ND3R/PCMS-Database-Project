-- PL/SQL


-- variable declaration, select, print
-- display outlet info for id=7
set serveroutput on
declare
  o_name outlet.outlet_name%type;
  city outlet.city%type;
begin
  select outlet_name, city into o_name,city from outlet where outlet_id = 7;
  dbms_output.put_line('Outlet Name: ' || o_name || ' City: ' || city);
end;
/


-- Insertion

set serveroutput on
declare
  outlet_id outlet.outlet_id%type := 11;
  outlet_name outlet.outlet_name%type := 'HealthEase';
  city outlet.city%type := 'Dhaka';
begin
  insert into outlet values(outlet_id, outlet_name, city);
end;
/

-- Row Type

set serveroutput on
declare
  r outlet%rowtype;
begin
  select outlet_name, city into r.outlet_name, r.city from outlet where outlet_id = 11;
  dbms_output.put_line('outlet Name: ' || r.outlet_name || ' City: ' || r.city);
end;
/

-- cursor
set serveroutput on
declare
  cursor csr is select * from medicine;
  csr_row medicine%rowtype;
begin
  open csr;
  fetch csr into csr_row.med_id, csr_row.med_name, csr_row.generic_name, csr_row.price,csr_row.company;
  while csr%found loop
    dbms_output.put_line('Medicine ID: ' || csr_row.med_id || 'Medicine Name: ' || csr_row.med_name || ' Generic Name: ' 
    || csr_row.generic_name || 'Price: '||csr_row.price||'Company: '|| csr_row.company);
    dbms_output.put_line('Row Count: ' || csr%rowcount);
    fetch csr into csr_row.med_id, csr_row.med_name, csr_row.generic_name, csr_row.price,csr_row.company;
  end loop;
  close csr;
end;
/

-- For loop with extend() function

set serveroutput on
declare
  counter number;
  con_name consumer.name%type;
  TYPE ARR IS VARRAY(20) OF consumer.name%type;
  M_NAME ARR := ARR();
begin
  counter := 1;
  for x in 1..20 loop
    select name into con_name from consumer where con_id = x;
    M_NAME.EXTEND();
    M_NAME(counter) := con_name;
    counter := counter + 1;
  end loop;
  counter := 1;
  WHILE counter <= M_NAME.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE(M_NAME(counter));
    counter := counter + 1;
  END LOOP;
end;
/

-- without extend()

set serveroutput on
declare
  counter number := 1;
  con_name consumer.name%type;
  TYPE ARR IS VARRAY(10) OF consumer.name%type;
  M_NAME ARR := ARR('Consumer A', 'Consumer B', 'Consumer C', 'Consumer D', 'Consumer E', 'Consumer F', 'Consumer G', 
  'Consumer H', 'Consumer I', 'Consumer J');
begin
  counter := 1;
  for x in 1..10 loop
    select name into con_name from consumer where con_id = x;
    M_NAME(counter) := con_name;
    counter := counter + 1;
  end loop;
  counter := 1;
  WHILE counter <= M_NAME.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE(M_NAME(counter));
    counter := counter + 1;
 End loop;
end;
/

--if-else ladder


set serveroutput on
declare
 counter Number:=1;
 con_name consumer.name%type;
 id consumer.con_id%type;
begin
 counter:=1;
 for x in 1..10
 loop
	select name,con_id into con_name,id from consumer where con_id = x;
	if con_name = 'Ahsanul Haque Hasib'
	  then
	  dbms_output.put_line(con_name||' s ID is: '||id);
	else
        dbms_output.put_line('not the consumer');
        end if;
  end loop;
end;
/

-- medicine details for a consumer using procedure


create or replace procedure proc(
  var1 IN number
) as
med_name MEDICINE.med_name%type;
price MEDICINE.PRICE%type;
company medicine.company%type;
outlet_name OUTLET.OUTLET_NAME%type;
qty DETAILS.QUANTITY%type;
exp_dt DETAILS.EXP_DATE%type;
txn_dt DETAILS.TXN_DATE%type;
begin
  SELECT m.MED_NAME AS Medicine_Name,m.PRICE AS Price,m.COMPANY AS Company,o.OUTLET_NAME AS Outlet_Name,d.QUANTITY AS Quantity,d.EXP_DATE AS Expiration_Date,d.TXN_DATE AS Transaction_Date into med_name,price, company, outlet_name, qty, exp_dt, txn_dt FROM consumer c JOIN details d ON c.CON_ID = d.CON_ID JOIN medicine m ON d.MED_ID = m.MED_ID JOIN outlet o ON c.OUTLET_ID = o.OUTLET_ID WHERE c.CON_ID = var1;
  dbms_output.put_line('medicine: ' || med_name || ' Price: ' || price|| ' Company: ' || company|| ' Outlet: ' || outlet_name|| ' Quantity: ' || qty|| ' exp_date: ' || exp_dt|| ' Txn_date: ' || txn_dt);
end;
/


set serveroutput on;
declare
  p_id consumer.con_id%type := 1;
begin
  proc(p_id);
end;
/


-- medicine details for a consumer using function

create or replace function func(
  var1 IN number)return varchar2
as
med_name MEDICINE.med_name%type;
price MEDICINE.PRICE%type;
company medicine.company%type;
outlet_name OUTLET.OUTLET_NAME%type;
qty DETAILS.QUANTITY%type;
exp_dt DETAILS.EXP_DATE%type;
txn_dt DETAILS.TXN_DATE%type;
result varchar2(4000);
begin
  select m.MED_NAME as Medicine_Name,m.PRICE as Price,m.COMPANY as Company,o.OUTLET_NAME as Outlet_Name,d.QUANTITY as 
  Quantity,d.EXP_DATE as Expiration_Date,d.TXN_DATE as Transaction_Date into med_name,price, company, outlet_name, qty, 
  exp_dt, txn_dt from consumer c join details d on c.CON_ID = d.CON_ID join medicine m on d.MED_ID = m.MED_ID join outlet o
   on c.OUTLET_ID = o.OUTLET_ID where c.CON_ID = var1;
  result := 'Medicine: ' || med_name || ' Price: ' || price || ' Company: ' || company || ' Outlet: ' || outlet_name || 
  ' Quantity: ' || qty || ' Exp_date: ' || exp_dt || ' Txn_date: ' || txn_dt;
  return result;
end;
/

set serveroutput on;
declare
  p_id consumer.con_id%type := 1;
  result varchar2(4000);
begin
  result:=func(p_id);
  dbms_output.put_line(result);
end;
/


--deletion from outlet deletes from other related tables without cascading
create or replace procedure dele(
  var1 in number
)
as

begin
    delete from details where con_id in (select con_id from consumer where outlet_id = var1);
    delete from consumer where outlet_id = var1;
    delete from clerk where outlet_id = var1;
    delete from outlet where outlet_id=var1;
end;
/



set serveroutput on;
declare
  p_id outlet.outlet_id%type := 12;
begin
  dele(p_id);
end;
/

-- shorlist of a consumer using procedure
create or replace procedure consumer_shortlist(
 n in consumer.name%type,
 c_name out CONSUMER.NAME%type,
 m_name out MEDICINE.MED_NAME%type,
 qty out details.quantity%type,
 o_name out outlet.outlet_name%type
) as
begin
    select c.name, m.med_name, d.quantity, o.outlet_name into c_name, m_name, qty, o_name from consumer c join outlet o on c.outlet_id = o.outlet_id join details d on c.con_id = d.con_id join medicine m on d.med_id = m.med_id where c.name = n;
end;
/
set serveroutput on;
declare
 nam CONSUMER.NAME%type := 'Ahsanul Haque Hasib';
 c_name CONSUMER.NAME%type;
 m_name MEDICINE.MED_NAME%type;
 qty details.quantity%type;
 o_name outlet.outlet_name%type;
begin
 consumer_shortlist(nam, c_name, m_name, qty, o_name);
 DBMS_OUTPUT.PUT_LINE('Consumer Name: ' || c_name||' Medicine Name: ' || m_name||' Quantity: ' || qty|| ' Outlet Name: ' || o_name);
end;
/

--shortlist of all the consumers using PL/SQL block
set serveroutput on;
declare
    c_name consumer.name%TYPE;
    m_name medicine.med_name%TYPE;
    qty details.quantity%TYPE;
    o_name outlet.outlet_name%TYPE;
    cursor c is SELECT c.name as c_name, m.med_name as m_name, d.quantity as qty, o.outlet_name as o_name from consumer c join outlet o on c.outlet_id = o.outlet_id join details d on c.con_id = d.con_id join medicine m on d.med_id = m.med_id;
    r c%rowtype;
begin

    open c;
    fetch c into r.c_name,r.m_name,r.qty,r.o_name;
    while c%found loop
    DBMS_OUTPUT.PUT_LINE('Consumer Name: ' || r.c_name||' Medicine Name: ' || r.m_name||' Quantity: ' || r.qty|| ' Outlet Name: ' || r.o_name);
    fetch c into r.c_name,r.m_name,r.qty,r.o_name;
    end loop;
    close c;
end;
/


--shortlist of all the consumers using procedure
create or replace procedure consumers_shortlist as
    cursor c is select c.name as c_name, m.med_name as m_name, d.quantity as qty, o.outlet_name as o_name from consumer c join outlet o 
    on c.outlet_id = o.outlet_id join details d on c.con_id = d.con_id join medicine m on d.med_id = m.med_id;
    r c%rowtype;
begin
    open c;
    fetch c into r.c_name,r.m_name,r.qty,r.o_name;
    while c%found loop
    DBMS_OUTPUT.PUT_LINE('Consumer Name: ' || r.c_name||' Medicine Name: ' || r.m_name||' Quantity: ' || r.qty|| ' Outlet Name: ' || r.o_name);
    fetch c into r.c_name,r.m_name,r.qty,r.o_name;
    end loop;
    close c;
end;
/

set serveroutput on;
begin
 consumers_shortlist();
end;
/

-- consumers names who bought a specific medicine using procedure

create or replace procedure get_customer(
  me in MEDICINE.MED_NAME%TYPE
) as
  cursor c is
select c.name
from consumer c
join details d on c.con_id = d.con_id
join medicine m on d.med_id = m.med_id
where m.med_name = me;

  r c%ROWTYPE;
begin
  OPEN c;
  loop
    fetch c into r;
    exit when c%notfound;
    DBMS_OUTPUT.PUT_LINE('Customer name: ' || r.name);
end loop;
close c;

end;
/

set serveroutput on;
declare
 med MEDICINE.MED_NAME%TYPE := 'Napa';
begin
 get_customer(med);
end;
/


