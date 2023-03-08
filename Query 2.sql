-- Για κάθε εκτιμητή δείξε το πλήθος των εκτιμήσεων που έχει πραγματοποιήσει το 2020.

select A.ID,A.name,A.Last_Name ,count(E.ID) as NumberOfEstimation from Agent as A
inner join Estimation as E on E.Id_Agent=A.ID
where YEAR(E.Date)=2020
group by A.ID,A.name, A.Last_Name
