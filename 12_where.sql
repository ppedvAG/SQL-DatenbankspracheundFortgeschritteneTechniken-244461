--Wildcard

-- % beliebige Zeichenanzahl
-- _ genau ein Zeichen

-- [wertebereich] ein Zeichen genau

--zB [AGH] .. entweder A oder G oder H

-- [A-E]  -- von A bis E 

SELECT * FROM Kunden WHERE Name LIKE '[A-M]%' -- Name beginnt mit A bis M
SELECT * FROM Kunden WHERE Name LIKE '[0-9]%' -- Name beginnt mit einer Zahl
SELECT * FROM Kunden WHERE Name LIKE '[^A-M]%' -- Name beginnt NICHT mit A bis M
