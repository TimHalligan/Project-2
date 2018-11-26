CREATE DATABASE NewYorkCity_db;
USE NewYorkCity_db;

CREATE TABLE food (
id int,
Address_Id int,
Incident_Date date,
Complaint text,
Final_Street text,
Borough text,
Zip int,
PRIMARY KEY (id)
);

ALTER TABLE food
ADD COLUMN Weekday text;

CREATE TABLE inspection (
Restaurant_ID int,
Address_ID text,
Inspection_Date date, 
Name text,
Cuisine text,
Final_Street text,
Borough text,
Zip int,
Score int,
Violation_Code text
);

ALTER TABLE inspection
ADD COLUMN Violation_Description text;



SELECT  
count(*) 'Number of food poisoning incidents', Cuisine
        FROM food
		JOIN inspection
		ON food.Address_Id = inspection.Address_ID
        group by Cuisine
		order by count(*) desc;


SELECT  
count(*) as 'Number of food poisoning incidents', Cuisine
        food.Borough, 
        inspection.Restaurant_ID,
		inspection.Address_ID,
		inspection.Inspection_Date,
        inspection.Name,
        inspection.Cuisine,
        inspection.Borough,
		inspection.Zip,
		inspection.Score,
		inspection.Violation_Code
FROM food
INNER JOIN inspection
ON food.Address_Id = inspection.Address_ID;


SELECT 
	COUNT(*) as 'Food Poison Count' , Cuisine
 FROM food
 join inspection
		ON food.Address_Id = inspection.Address_ID
 group by Cuisine
 order by count(*) desc;
        
 
SELECT COUNT(*), Weekday 
FROM food
 GROUP BY Weekday
 order by count(*) desc;
 ;
 
SELECT COUNT(*), Borough 
FROM food
 GROUP BY Borough
 order by count(*) desc;
 ;
 
 Select AVG(Score) as Avg_Score
 From inspection
 Group by Cuisine
 order by avg(Score);
 
truncate table food;

truncate table inspection;












