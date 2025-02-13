/*
Proz Idee. wie ein Windows Batch

der Code wird exakt genaus so (schenll) ausgef�hrt, wie er in der Proc auch geschrieben wurde



*/

set statistics io,time on --off

select city, lastname, sum(unitprice*quantity)
from ku3
where city like 'B%'
group by city , lastname

--bei ersten Ausf�hren Analyse und Komp Zeit vn ca 7 Sek
--beim 2ten Ausf�hren Zeit anszatweise 10ms

-- "Schotterweg": SCAN
-- Schnellweg: SEEK


----Problem der normalen Abfragen:  die Ausf�hrungspl�ne sind im RAM und.. und verschwinden mal
-- SQL Server kann autoparamtetrisieren.. Plan wird wiederverwendbar
-- ab komplexereren (join) keine Autoparam.
select * from orders o inner join customers c on c.CustomerID=o.CustomerID	
where orderid = 11000


--mit Prozeduren ist das Problem zun�chst behoben
--Die Proz legt beim ersten Ausf�hren einen Plan fest, der dann immer  - auch nach Nezstart . ausgef�hrt wird.

--Der Plan der Prozedur kann im Laufe der Zeit auch falsch sein 
--Datenquait�t hat sich ge�ndert


create or alter proc gpName @par1 int, @par2 int, @par3 out
as
--Code

exec procname 23,24


---------------
set statistics io, time on
select * from KU where id  < 2

select * from KU where id  < 900000

--> 2 Pl�ne


create proc gpSuchID @par1 int
as
select * from KU where id  < @par1


exec gpSuchID 2 

--Tabelle hat 48000 Seiten ca

exec gpSuchID 900000

exec gpSuchID 1000000
--, CPU-Zeit = 3344 ms, verstrichene Zeit = 15055 ms.
---11 Mio Seiten

---> 1 Plan f�r alle :-(

select * from KU where id  < 1000000
--= 2188 ms, verstrichene Zeit = 14026 ms.



--Was sollten wir bei Prozeduren unbedingt vermeiden?
--immer einen optimalen zu haben
-- die Parameter d�rfen daher nicht gro�e Abweichungen erzeugen
--evtl in der Prozedur auf weitere optimierte Prozeduren verweisen

dbcc freeproccache

exec gpSuchID 10000000
exec gpSuchID 10

--neuer Plan als Kompromiss

----> QueryStore
--Gro�e Abweicheungen in Dauer oder Lesevorg�ngen

