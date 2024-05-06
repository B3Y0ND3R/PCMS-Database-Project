-- triggers

-- no negative medicine price

create or replace trigger price_validate
before insert or update on medicine
for each row
begin
    if :NEW.price < 0 then
        RAISE_APPLICATION_ERROR(-20001, 'no negative price of medicines');
    end if;
end;
/

update medicine set price=-10 where med_id=10;
--[Error] Execution (15: 8): ORA-20001: no negative price of medicines
--ORA-06512: at "PROJECT.PRICE_VALIDATE", line 3
--ORA-04088: error during execution of trigger 'PROJECT.PRICE_VALIDATE'



SET SERVEROUTPUT ON;
create or replace trigger med_sold_on_insert
after insert on details
for each row
begin
DBMS_OUTPUT.PUT_LINE('Insert Trigger fired for con_id: ' || :NEW.con_id);
    update outlet 
    set medicine_sold = medicine_sold + :NEW.quantity
    where outlet_id = 
        (select outlet_id from consumer where con_id = :NEW.con_id);
end;
/



insert into consumer (con_id, name, age, gender, outlet_id) 
values(21, 'Jannatul Ferdous', 25, 'Female', 11);
insert into details values(21, 21, 1, 20, '05-DEC-25', '01-APR-24');
select * from outlet where outlet_id=5;
select * from consumer where outlet_id=11;


-- Temporarily disable the trigger
ALTER TRIGGER med_sold_on_insert DISABLE;
ALTER TRIGGER med_sold_update DISABLE;


-- Re-enable the trigger
ALTER TRIGGER med_sold_on_insert ENABLE;



-- updating medicine_sold for an outlet after updation in details table

SET SERVEROUTPUT ON;
create or replace trigger med_sold_on_update
before update of quantity on details
for each row
begin
DBMS_OUTPUT.PUT_LINE('update Trigger fired for con_id: ' || :NEW.con_id);
    update outlet set medicine_sold = medicine_sold - :OLD.quantity + :NEW.quantity where outlet_id = (select outlet_id from consumer where con_id = :NEW.con_id);
end;
/


update consumer set outlet_id=5 where con_id=21;
select outlet_id from consumer where con_id=21;

update details set quantity=60 where details_id=21;
select * from outlet where outlet_id=5;


-- updating medicine_sold for an outlet after deletion in details table
SET SERVEROUTPUT ON;
create or replace trigger med_sold_on_delete
after delete on details
for each row
begin
DBMS_OUTPUT.PUT_LINE('delete Trigger fired for con_id: ' || :OLD.con_id);
    update outlet set medicine_sold = medicine_sold - :OLD.quantity where outlet_id = (select outlet_id from consumer where con_id = :OLD.con_id);
end;
/

delete from details where details_id=21;
select * from outlet where outlet_id=5;

--deletion from outlet deletes from other related tables without cascading

set serveroutput on;
create or replace trigger outlet_del
before delete on outlet
for each row
begin
delete from details where con_id in (select con_id from consumer where outlet_id = :OLD.outlet_id);
delete from consumer where outlet_id = :OLD.outlet_id;
delete from clerk where outlet_id = :OLD.outlet_id;    
end;
/

delete from outlet where outlet_id=11;



SELECT * FROM ALL_TRIGGERS WHERE TABLE_NAME = 'DETAILS';























































