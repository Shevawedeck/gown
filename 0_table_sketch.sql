/*Gown
	GownId int pk
	CustomerLastName varchar(25) not null not blank
	CustomerFirstName varchar(25) not null not blank
	Brand varchar(20) not null not blank
	Style varchar(20) not null not blank
	Color varchar(20) not null not blank
	Size int not null > 0
	GownNumber int not null 1-15
	DateBorrowed date not null > 1997/04/16
	DateReturned date <= getdate()
	ConditionBorrowedInt int not null between 1 and 4
	ConditionReturnedInt int between 1 and 4
	CheckDeposited as 
			when datediff(week,DateBorrowed,isnull(DateReturned,getdate())) >= 3 
			or ConditionReturnedInt < ConditionBorrowedInt 
				then 'Deposited' 
			else 'Not Deposited'
	ConditionBorrowed as 
		case ConditionBorrowedInt 
			when 1 then 'Bad' 
			when 2 then 'Fine' 
			when 3 then 'Good' 
			else 'Excellent' 
		end persisted,
	ConditionReturned as 
		case ConditionReturnedInt 
			when 1 then 'Bad' 
			when 2 then 'Fine' 
			when 3 then 'Good' 
			when 4 then 'Excellent' 
		end persisted,
	constraint ConditionReturnedInt <= ConditionBorrowedInt
	constraint DateReturned >= DateBorrowed
	constraint (DateReturned is null and ConditionReturned is null) or (DateReturned is not null and ConditionReturned is not null)
)
*/