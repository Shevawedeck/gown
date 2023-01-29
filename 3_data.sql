use GownDB
go
delete dbo.Gown
go
insert dbo.Gown(CustomerFirstName,CustomerLastName,Brand,Style,Color,Size,GownNumber,DateBorrowed,DateReturned,ConditionBorrowedInt,ConditionReturnedInt)
select 'Sharon', 'Weiss', 'Pullini', 'puffy', 'lavendar', 6, 2, '9/17/21', '9/25/21',4,4
union select 'Sharon', 'Weiss','Pullini', 'puffy', 'lavendar', 6, 1, '9/17/21', '9/25/21', 3,2
union select 'Chayala', 'Halpert', 'Shar', 'tulle', 'pale pink', 8, 2, '8/10/21', '8/27/21', 3,3
union select 'Chayala', 'Halpert', 'Shar', 'tulle', 'pale pink', 6, 1, '8/10/21', '8/27/21', 3,2
union select 'Chayala', 'Halpert', 'Pullini', 'puffy', 'pale pink', 4, 3, '8/10/21', '8/27/21', 2,2
union select 'Chayala', 'Halpert', 'Pullini', 'puffy', 'pale pink', 2, 2, '8/10/21', '8/27/21',2,1