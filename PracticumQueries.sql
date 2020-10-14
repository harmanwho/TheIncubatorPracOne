/** Query 1 : Find out the events for which the attendees must be contacted because of 
potential exposure. Contains subquery and inner join of at least 3 tables */

SELECT People.FullName, MedicalData.isPositive, Event.EventName, Event.Day FROM ((People 
INNER JOIN People ON People.SchoolID = MedicalData.SchoolID) 
INNER JOIN Event on Event.EventID == EventAttendees.EventID AND EventAttendees.SchoolID = People.SchoolID);

/** Query 2: Select all people at school and group by those who have a temp over 100. 
 Contains Group by with a having clause */ 

SELECT People.FullName, People.SchoolID, MedicalData.MedicalID, MedicalData.Temp
FROM People, MedicalData
WHERE People.SchoolID = MedicalData.SchoolID
GROUP BY MedicalData.Temp
HAVING (MedicalData.Temp) > 99;
