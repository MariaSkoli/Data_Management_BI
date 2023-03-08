
-- Για κάθε κωδικό περιοχής και για το 2020, δείξε το πλήθος των εκτιμήσεων της περιοχής σαν ποσοστό του 
-- συνολικού πλήθος εκτιμήσεων του 2020 (μία στήλη), και τον πληθυσμό της περιοχής σαν ποσοστό του 
-- συνολικού πληθυσμού όλων των περιοχών.

with percentages as (

select distinct r.ID,count(e.ID) over() as total_es, 
count(e.ID) over(partition by r.id) as region_es
	from  Estimation as e
	inner join Property as p on E.Id_Property=p.ID
	inner join Region as R on R.ID=p.Id_Region
	where YEAR(E.Date)=2020
	)
,
 totpop as (
 select r.ID,r.Population as pop_per_region, sum(R.population) over() as total_population
 from Region as R
 )

Select  per.id,cast(cast(cast(per.region_es as decimal(7,2))/per.total_es as decimal(4,2))*100 as varchar(25)) + '%' as Percantages_Estimations,
cast(cast(cast(totpop.pop_per_region as decimal(10,2))/totpop.total_population as decimal(10,2))*100 as varchar(25)) + '%' as Percantages_Population
from percentages as per
inner join totpop on totpop.id = per.ID

