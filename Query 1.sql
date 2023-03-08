-- ����� ��� ������ ��� �� ��������� ��� �������� ��� ������� �� ������� �� ���� �������� ���������� 
-- ��� 40.000� ��� ����� ��������� ������ 24/12/2020 ��� 31/12/2020.

select P.ID,Address from Property as P
inner join Region as R on R.ID=P.Id_Region
inner join Estimation as E on  E.Id_Property=P.ID
where R.Average_Income>=40000 
		and Date>='2020-12-24' and Date<='2020-12-31' 

