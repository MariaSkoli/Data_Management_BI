-- Για κάθε εκτιμητή και για το 2020, δείξε τον κωδικό του εκτιμητή, το πλήθος των εκτιμήσεων κατοικιών
-- που έχει πραγματοποιήσει, και το πλήθος των εκτιμήσεων γραφείων που έχει πραγματοποιήσει (3 στήλες)

SELECT A.ID,
	sum(CASE 
		when p.Type='Apartments' 
			then 1
		else 	
			0
		end)  as 'Apartments' ,

	sum(CASE 
		when p.Type='Office' 
			then 1
		else 0
		end )  as 'Office'
from Agent as A
inner join Estimation as E on E.Id_Agent=A.ID
inner join Property as P on e.Id_Property=p.ID
where year(E.Date)=2020 
group by A.ID
