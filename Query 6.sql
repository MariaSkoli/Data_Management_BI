-- Για κάθε κωδικό περιοχής, δείξε τον κωδικό της περιοχής και τη μέση τιμή εκτίμησης ανά τμ της περιοχής, 
-- σε αύξουσα σειρά της μέσης τιμής εκτίμησης.

select R.ID ,R.Name,cast(avg(E.Price/P.Size) as decimal(18,2)) as Average_Price_per_square_meter from Estimation as E
inner join Property as P on E.Id_Property=P.ID
inner join Region as R on R.ID=P.Id_Region
group by R.ID,R.Name
order by Average_Price_per_square_meter
