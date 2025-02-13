--Ausf�hrugspl�ne sollten wiederverwedenbar sein
-- SQL Server versucht zu Autoparametrisieren
--allerdings gelingt dies nur selten
--Bereits ein Join kann dies verhindern
--Dieses Problem kennt eine Prozedur gruds�tzlich nicht...


--Situationen, in denen man nicht glaubt, dass
--neue Pl�ne erstellt werden
--verschiedene Schreibstile der Autoren k�nnen verschiedene
--Pl�ne erzeugen

--Gro� und Kleinschreibung-- Zeilenumbruch etc..

----------------------------------------------------
--Versuch
--alles von Zeile 20 bis Zeile 38 ausf�hren
--letzte Ergebnistabelle kontrollieren
----------------------------------------------------

dbcc freeproccache;
GO

select * from orders where customerID='HANAR'
go

select * from Orders where CustomerID='HANAR'
go
select * from Orders 
	where   CustomerID='HANAR'
go



select usecounts, cacheobjtype,[TEXT] from
	sys.dm_exec_cached_plans P
		CROSS APPLY sys.dm_exec_sql_text(plan_handle)
	where cacheobjtype ='Compiled PLan'
		AND [TEXT] not like '%dm_exec_cached_plans%'

---- ENDE


--3 Pl�ne...
----------------------------------------------------------
--hier ein anderer Versuche 
--lles von Zeile 47 bis 54 ausf�hren
-----------------------------------------------------------

dbcc freeproccache;
GO


select * from	 orders where orderid = 10

select	* from orders where orderid = 300

select * from orders where orderid = 30000

select * from orders where orderid = 300000


select usecounts, cacheobjtype,[TEXT] from
	sys.dm_exec_cached_plans P
		CROSS APPLY sys.dm_exec_sql_text(plan_handle)
	where cacheobjtype ='Compiled PLan'
		AND [TEXT] not like '%dm_exec_cached_plans%'


---ENDE
