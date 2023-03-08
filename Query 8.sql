-- Για κάθε κωδικό περιοχής, δείξε τη μεταβολή της μέσης τιμής εκτίμησης ανά τμ μεταξύ 2020 και 2019

WITH region2019 as
(
select R.Name ,avg(E.Price/P.Size) as avg2019,YEAR(E.Date) as year19 from Region as R
inner join Property as P on r.ID=P.Id_Region
inner join Estimation as E on E.Id_Property=p.ID
group by r.ID,R.Name, YEAR(E.Date)
having YEAR(E.Date)=2019
),

region2020 as
(
select R.Name ,avg(E.Price/P.Size) as avg2020,YEAR(E.Date) as year20 from Region as R
inner join Property as P on r.ID=P.Id_Region
inner join Estimation as E on E.Id_Property=p.ID
group by r.ID,R.Name, YEAR(E.Date)
having YEAR(E.Date)=2020
)

--------------------------------------------- Main Query ---------------------------------------------

select 
	case 
	when r19.Name is null and r20.name is not null		
			then	r20.Name
	when r20.Name is null and r19.name is not null
			then r19.Name
	when r20.Name is not null and r19.name is not null
			then r20.Name
	end as Region
	,
	CASE WHEN r19.avg2019 is not null and r20.avg2020 is not null
		then
		cast(r20.avg2020-r19.avg2019 as varchar)
		WHEN r19.avg2019 IS NULL
		then 'No information 2019'
		When r20.avg2020 IS NULL
		then 'No information 2020'
	end as 'Mesh timh Ektimhshs 2019-2020'
	from region2020 as r20

full outer join region2019 as r19 on r20.Name=r19.name
order by Region
