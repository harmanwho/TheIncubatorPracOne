/** Query 1 */

SELECT People.FullName, MedicalData.isPositive, Event.EventName, Event.Day FROM ((People 
INNER JOIN People ON People.SchoolID = MedicalData.SchoolID) 
INNER JOIN Event on Event.EventID == EventAttendees.EventID AND EventAttendees.SchoolID = People.SchoolID);