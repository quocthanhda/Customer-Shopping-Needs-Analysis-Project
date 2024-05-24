-- Clean data by filling missing data "old column: to_user#occasion_id to new column: occasion"
	select _id
		,  create_info#created
		, to_user#occasion_id
		, case when to_user#occasion_id is null and (day(create_info#created) = 14 and month(create_info#created) = 2) then '623805f970db7465b33fdfb6'
		when to_user#occasion_id is null and (day(create_info#created) = 8 and month(create_info#created) = 3) then '6238064e70db7465b33fdfb9'
		when to_user#occasion_id is null and (day(create_info#created) = 20 and month(create_info#created) = 3) then '623806b15eb0fa6a8e04fd00'
		when to_user#occasion_id is null and (day(create_info#created) = 20 and month(create_info#created) = 10) then '623807474305c8586b23155b'
		when to_user#occasion_id is null and (day(create_info#created) = 20 and month(create_info#created) = 11) then '623807774305c8586b23155e'
		when to_user#occasion_id is null and (day(create_info#created) = 1 and month(create_info#created) = 6) then '623807c5662d9e386d783c05'
		when to_user#occasion_id is null and (day(create_info#created) = 28 and month(create_info#created) = 6) then '6238081270db7465b33fdfc5'
		when to_user#occasion_id is null and (day(create_info#created) = 21 and month(create_info#created) = 6) then '623808527ad13669ea4fe7e6'
		when to_user#occasion_id is null and (day(create_info#created) = 2 and month(create_info#created) = 9) then '62380891dc73863b6b244f60'
		when to_user#occasion_id is null and (day(create_info#created) = 27 and month(create_info#created) = 2) then '623b00def752cc134555ad76'
		when to_user#occasion_id is null and (day(create_info#created) = 13 and month(create_info#created) = 10) then '623b028405bb0b422970bcd4'
		when to_user#occasion_id is null and (day(create_info#created) = 31 and month(create_info#created) = 10) then '623807c5662d9e386d783c05'
		when to_user#occasion_id is null and (day(create_info#created) = 9 and month(create_info#created) = 11) then '623b0314fa38485f9c64d662'
		when to_user#occasion_id is null and (day(create_info#created) in  ('24', '25')  and month(create_info#created) = 12) then '623b03f81afbae42d87cdbe4'
		when to_user#occasion_id is null and ((day(create_info#created) = 16 and month(create_info#created) = 6 and year(create_info#created) = 2019)
												or day(create_info#created) = 21 and month(create_info#created) = 6 and year(create_info#created) = 2019
												or day(create_info#created) = 20 and month(create_info#created) = 6 and year(create_info#created) = 2019
												or day(create_info#created) = 19 and month(create_info#created) = 6 and year(create_info#created) = 2019
												or day(create_info#created) = 18 and month(create_info#created) = 6 and year(create_info#created) = 2019) then '623b045405bb0b422970bcdd'
		when to_user#occasion_id is null and ((day(create_info#created) = 13 and month(create_info#created) = 9 and year(create_info#created) = 2019)
												or day(create_info#created) = 1 and month(create_info#created) = 10 and year(create_info#created) = 2019
												or day(create_info#created) = 21 and month(create_info#created) = 9 and year(create_info#created) = 2019
												or day(create_info#created) = 10 and month(create_info#created) = 9 and year(create_info#created) = 2019
												or day(create_info#created) = 29 and month(create_info#created) = 9 and year(create_info#created) = 2019) then '623b045405bb0b422970bcdd'
		when to_user#occasion_id is null and ((day(create_info#created) = 12 and month(create_info#created) = 5 and year(create_info#created) = 2019)
												or day(create_info#created) = 10 and month(create_info#created) = 5 and year(create_info#created) = 2019
												or day(create_info#created) = 9 and month(create_info#created) = 5 and year(create_info#created) = 2019
												or day(create_info#created) = 8 and month(create_info#created) = 5 and year(create_info#created) = 2019
												or day(create_info#created) = 14 and month(create_info#created) = 5 and year(create_info#created) = 2019) then '623b0485c9423e30ca7bdc07'
		when to_user#occasion_id is null and (day(create_info#created) = 1 and month(create_info#created) = 1) then '62c684d90c57b1bbda0b886b'
		when to_user#occasion_id is null and (((day(create_info#created) between 1 and 4) and month(create_info#created) = 2 and year(create_info#created) = 2019)
												or (day(create_info#created) between 19 and 24) and month(create_info#created) = 1 and year(create_info#created) = 2019
												or (day(create_info#created) between 6 and 11) and month(create_info#created) = 2 and year(create_info#created) = 2019
												or (day(create_info#created) between 25 and 31) and month(create_info#created) = 1 and year(create_info#created) = 2019
												or (day(create_info#created) between 16 and 21) and month(create_info#created) = 1 and year(create_info#created) = 2019) then '62c68514b07961466304098d'
		when to_user#occasion_id is null then '62b44615e7faf931dd003dd6'
		end as occasion
	from fact_bill1



 










