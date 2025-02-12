select * from customers where customerid = 'ALFKI'

select usecounts, cacheobjtype,[TEXT] from
	sys.dm_exec_cached_plans P
		CROSS APPLY sys.dm_exec_sql_text(plan_handle)
	where cacheobjtype ='Compiled PLan'
		AND [TEXT] not like '%dm_exec_cached_plans%'

dbcc freeproccache

select * from customers where customerid = 'ALFKI'

select * from customers 
		where 
				customerid = 'ALFKI'

select * from customers 
	where CustomerID = 'ALFKI'


select * from orders where orderid = 2


select * from orders where orderid = 10248

select * from orders where orderid = 60000

set 

