-- ��������������� ����������� ���������,  ����� ��� ������ ��� ���������� ��� ����� ��������������� �� �������� 
-- �� ���� �������� ���������� ��� 25.000�.


select E.id as Estimation_ID from Estimation as E
Inner Join Property as P
On P.ID=E.Id_Property
where P.Id_Region in (select R.id from Region as R where R.Average_Income>25000)
