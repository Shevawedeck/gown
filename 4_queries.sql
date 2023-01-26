use GownDB
go

-- 1. I need to see all size 6 gowns ever borrowed
select *
from Gown g
where g.Size = 6
-- 2. I need a list of which checks must be deposited
select *
from Gown g
where g.CheckDeposited = 'Deposited'
-- 3. I want to see how many times each gown was borrowed
select NumOfTimesBorrowed = count(*), g.Brand, g.Style, g.Color, g.Size, g.GownNumber
from Gown g
group by g.Brand, g.Style, g.Color, g.Size, g.GownNumber