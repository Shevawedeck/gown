use GownDB
go
drop table if exists dbo.Gown
go
create table dbo.Gown(
	GownId int not null identity primary key,
	CustomerLastName varchar(25) not null constraint ck_Gown_customer_last_name_cannot_be_blank check(CustomerLastName > ''),
	CustomerFirstName varchar(25) not null constraint ck_Gown_customer_first_name_cannot_be_blank check(CustomerFirstName > ''),
	Brand varchar(20) not null constraint ck_Gown_brand_cannot_be_blank check(Brand > ''),
	Style varchar(20) not null constraint ck_Gown_style_cannot_be_blank check(Style > ''),
	Color varchar(20) not null constraint ck_Gown_color_cannot_be_blank check(Color > ''),
	Size int not null constraint ck_Gown_size_cannot_be_blank check(Size > 0),
	GownNumber int not null constraint ck_Gown_number_must_be_greater_then_0_and_less_then_15 check(GownNumber between 1 and 15),
	DateBorrowed date not null constraint ck_Gown_date_borrowed_after_April_16_1997 check(DateBorrowed >= '19970416'),
	DateReturned date constraint ck_Gown_date_returned_before_today check(DateReturned <= getdate()),
	ConditionBorrowedInt int not null constraint ck_Gown_Condition_Borrowed_in_1_2_3_4 check(ConditionBorrowedInt between 1 and 4),
	ConditionReturnedInt int constraint ck_Gown_Condition_Returned_in_1_2_3_4 check(ConditionReturnedInt between 1 and 4),
	CheckDeposited as 
		case 
			when datediff(ww,DateBorrowed,isnull(DateReturned,getdate())) >= 3 
			or ConditionReturnedInt < ConditionBorrowedInt 
				then 'Deposited' 
			else 'Not Deposited'
		end,
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
	constraint ck_Condition_returned_must_be_less_or_equal_to_borrowed check(ConditionReturnedInt <= ConditionBorrowedInt),
	constraint ck_Date_returned_must_be_after_date_borrowed check(DateReturned >= DateBorrowed),
	constraint ck_DateReturned_and_ConditionReturned_must_either_both_have_value_or_both_null 
		check((DateReturned is null and ConditionReturned is null) or (DateReturned is not null and ConditionReturned is not null)),
-- SM Not really the best unique constraint, but this is the most I can think of in single table
	constraint u_Brand_Color_Size_GownNumber_DateBorrowed unique(Brand,Color,Size,GownNumber,DateBorrowed)
)