-- ����� �� ������ ��� ���������� ��� 2020 ��� ������� ��� ������� �� �������� �� �������� > 50.000.Select count(E.id) Number_Of_Estimation from Estimation as Einner join Property as P on P.ID=E.Id_Propertyinner join Region as R on R.ID= P.Id_Regionwhere Year(E.Date)=2020 and R.Population>50000