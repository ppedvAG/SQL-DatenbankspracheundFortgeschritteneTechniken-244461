


--Transactionen
select * into Kunden from customers
--alles ist eine TX auch jeder einz INS UP DEL


begin tran--innerhalb der TX werden Schritt für Schritt Sperren gesetzt
			-- die erst mit Rollback oder commit aufgelöst werden
select @@TRANCOUNT

update kunden set city = 'XYZ'  where customerid = 'ALFKI'

UPDATE Orders

DELETE customers

select * from kunden

rollback



---Momentaufnahmenisolation behebt das Problem:
--Lesen hindert Schreiben und Schreiben hindert Lesen
--zu Laste der Tempdb # Zeilenversionierung
USE [master]
GO
ALTER DATABASE [Northwind] SET READ_COMMITTED_SNAPSHOT ON WITH NO_WAIT
GO

GO
ALTER DATABASE [Northwind] SET ALLOW_SNAPSHOT_ISOLATION ON
GO


--Snapshot Isolation 
--erzeugt Zeilenversionen (in temodb) dann aber hindert ein Schreiben das Lesen nicht 


--Fall in TX LESEN (daten sollen unverändert bleiben
--REPEATABLEREAD--> kein update und kein delete
--SERIALZABLE  auch kein INSERT mehr


