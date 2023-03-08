CREATE TABLE Agent
(
ID int NOT NULL primary key,
Name varchar(25),
Last_Name varchar(25),
Gender varchar(15),
Age int,
Address varchar(255)
)

CREATE TABLE Region
(
ID int NOT NULL primary key,
Name varchar(25),
Population int,
Average_Income decimal(18,2)
)

CREATE TABLE Property
(
ID int NOT NULL primary key,
Address varchar(255),
Floor_Property int,
Size int,
Year_of_Construction int,
Id_Region int NOT NULL REFERENCES Region(ID) ON DELETE CASCADE,
Type varchar(255),
AFM int,
Identity_Number varchar(25)

)

CREATE TABLE Estimation
(
ID int NOT NULL primary key,
Date date,
Price  int,
Id_Agent int NOT NULL REFERENCES Agent(ID) ON DELETE CASCADE,
Id_Property int NOT NULL REFERENCES Property(ID) ON DELETE CASCADE
)


