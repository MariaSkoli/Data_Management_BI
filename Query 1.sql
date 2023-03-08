-- Δείξε τον κωδικό και τη διεύθυνση των ακινήτων που ανήκουν σε περιοχή με μέσο εισόδημα μεγαλύτερο 
-- των 40.000€ και έχουν εκτιμηθεί μεταξύ 24/12/2020 και 31/12/2020.

select P.ID,Address from Property as P
inner join Region as R on R.ID=P.Id_Region
inner join Estimation as E on  E.Id_Property=P.ID
where R.Average_Income>=40000 
		and Date>='2020-12-24' and Date<='2020-12-31' 

