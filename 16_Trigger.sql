drop table if exists o1
drop table if exists t1

select * into o1 from orders;
Go

create table t1 (id int)
GO

create or alter trigger trgdemo on o1
for  insert, update, delete
as
select * from o1 where orderid = 10248
select * from inserted
select * from deleted
select '---------'
select * from inserted
select * from deleted
insert into t1 
select orderid from inserted
Go


select * from o1

begin tran
update o1 set freight = 200 where orderid = 10248 

--rollback

select * from t1


alter table orders add RngSumme money

select * from [Order Details]

create trigger trgRsumme on [order details]
for update
as
declare @Rsumme as money
--select distinct orderid from inserted

select @Rsumme= sum(unitprice*quantity) from [order details]
where orderid = (select distinct orderid from inserted)

update orders set RngSumme = @Rsumme 
	where orderid = (select distinct orderid from inserted);
GO

begin tran
update [Order Details] set quantity = 20 
		where productid = 42 and 
			  orderid=10248

rollback
select * from orders 
---alles wieder auf Original.. auch die vom Trigger ausgfesten Dinge

--DDL

create or alter Trigger ddltrigger ON database
for  ddl_database_level_events
as
select eventdata()


alter view vdemo
as
select * from orders
