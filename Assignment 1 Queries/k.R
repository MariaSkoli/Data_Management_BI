install.packages("DBI")
install.packages("odbc")

install.packages("DBI")
install.packages("odbc")


library(dplyr) 
library(dbplyr) 
library(odbc) 
library(DBI) 


DBI_Connection <- dbConnect(odbc(),                        
                            driver = "SQL Server",                       
                            server=Sys.getenv("LAPTOP-M1QCN56U"),                                           
                            database=Sys.getenv("Try") ) 

SomeRecords <- dbFetch(dbSendQuery(DBI_Connection, 
                                   "DROP TABLE IF EXISTS TemporaryTable
CREATE TABLE TemporaryTable
(
ID int,
ValueRegion int,
ValuePop int
)

DECLARE @codeRegion int = 1 , @EstPer int =0, @EstPop int =0

WHILE @codeRegion <= 20
	BEGIN
	IF ( @codeRegion in (SELECT r.id as Region FROM [Try].[dbo].[Region] R  INNER JOIN [Try].[dbo].[Property] P ON P.Id_Region=R.ID INNER JOIN [Try].[dbo].[Estimation] E ON E.Id_Property=P.ID WHERE YEAR(E.Date)= 2020))
		BEGIN
		SET @EstPer =( SELECT COUNT(E.ID) FROM Region R INNER JOIN [Try].[dbo].[Property] P ON P.Id_Region=R.ID INNER JOIN [Try].[dbo].[Estimation]  E ON E.Id_Property=P.ID WHERE R.ID=@codeRegion and YEAR(E.Date)= 2020)
		SET @EstPop=( SELECT sum(r.Population)/count(R.ID) FROM [Try].[dbo].[Region] R INNER JOIN  [Try].[dbo].[Property] P ON P.Id_Region=R.ID INNER JOIN [Try].[dbo].[Estimation] E ON E.Id_Property=P.ID WHERE R.ID=@codeRegion and YEAR(E.Date)= 2020)
		INSERT INTO [Try].[dbo].[TemporaryTable]
		VALUES (@codeRegion, @EstPer,@EstPop);
		END
		
	SET @codeRegion=@codeRegion + 1 
	SET @EstPer=0
	SET @EstPop=0
	END;
	
select  A.ID
		,cast(cast(cast(A.ValueRegion as decimal(7,2))/b.TotalEst as decimal(4,2))*100 as varchar(25)) + '%' as  Percantages_perRegion 
		,cast(cast(cast(A.ValuePop as decimal(7,2))/C.TotalPop as decimal(4,2))*100 as varchar(25)) + '%' as  Percantages_perPopulation 
		FROM (select * from [Try].[dbo].[TemporaryTable] as T) as A , ( select count(E.ID) AS TotalEst from [Try].[dbo].[Estimation] AS E WHERE YEAR(E.Date)=2020) as B , 
			( select SUM( R.Population)  AS TotalPop from [Try].[dbo].[Region] R INNER JOIN [Try].[dbo].[Property] P ON P.Id_Region=R.ID INNER JOIN [Try].[dbo].[Estimation] E ON E.Id_Property=P.Id WHERE YEAR(E.Date)= 2020 ) as C" 
                                   
))

SomeRecords
