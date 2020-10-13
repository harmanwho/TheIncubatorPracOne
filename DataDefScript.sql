--
-- Database: `dbName`
--

-- --------------------------------------------------------

--
-- Table structure for table `People`
--
CREATE TABLE People(SchoolID INT PRIMARY KEY auto_increment,
		    fullname TEXT,
		    isQuar BOOLEAN,
                    groupID INT);

--
-- Table structure for table `Students`
--
CREATE TABLE Student(SchoolID INT,
                     fullname TEXT,
                     SpaceRoomID INT,
                     classYear [9, 10, 11, 12],
                     CONSTRAINT SchoolID_fk FOREIGN KEY (SchoolID) REFERENCES People(SchoolID),
                     CONSTRAINT fullname_fk FOREIGN KEY (fullname) REFERENCES People(fullname),
                     CONSTRAINT SpaceRoomID_fk FOREIGN KEY (SpaceRoomID) REFERENCES SpaceRoom(SpaceRoomID));
											      
--
-- Table structure for table `Faculty`
--
CREATE TABLE Faculty(SchoolID INT,
                     fullname TEXT,
                     SpaceRoomID INT,
                     isTeaching BOOLEAN,
                     CONSTRAINT SchoolID_fk FOREIGN KEY (SchoolID) REFERENCES People(SchoolID),
                     CONSTRAINT fullname_fk FOREIGN KEY (fullname) REFERENCES People(fullname),
                     CONSTRAINT SpaceRoomID_fk FOREIGN KEY (SpaceRoomID) REFERENCES SpaceRoom(SpaceRoomID));
											      
--
-- Table structure for table `Staff`
--
CREATE TABLE Staff(SchoolID INT,
                     fullname TEXT,
                     SpaceRoomID INT,
                     CONSTRAINT SchoolID_fk FOREIGN KEY (SchoolID) REFERENCES People(SchoolID),
                     CONSTRAINT fullname_fk FOREIGN KEY (fullname) REFERENCES People(fullname),
                     CONSTRAINT SpaceRoomID_fk FOREIGN KEY (SpaceRoomID) REFERENCES SpaceRoom(SpaceRoomID));
											      
--
-- Table structure for table `Building`
--
CREATE TABLE Building(buildingID INT AUTO INCREMENT PRIMARY KEY,
                      buildingName TEXT,
                      buildingType [ACADEMIC, RESIDENTIAL,
                                    ADMINISTRATIVE, EXTRACURRICULAR]);


--
-- Table structure for table `SpaceRoom`
--
CREATE TABLE SpaceRoom(SpaceRoomID INT AUTO INCREMENT PRIMARY KEY,
                       SpaceName TEXT,
                       buildingID INT,
                       CONSTRAINT buildingID_fk FOREIGN KEY (buildingID) REFERENCES Building(buildingID));
											     
--
-- Table structure for table `Event`
--
CREATE TABLE Event(EventID INT AUTO INCREMENT PRIMARY KEY,
                   SpaceRoomID INT,
                   startTime TIME,
                   endTime TIME,
                   EventName TEXT,
                   day DATE,
                   CONSTRAINT SpaceRoomID_fk FOREIGN KEY (SpaceRoomID) REFERENCES SpaceRoom(SpaceRoomID));
											    
--
-- Table structure for table `EventAttendees`
--
CREATE TABLE EventAtendees(SchoolID INT,
                           AtendeeID INT AUTO INCREMENT PRIMARY KEY,
                           EventID INT,
                           CONSTRAINT SchoolID_fk FOREIGN KEY (SchoolID) REFERENCES Person(SchoolID),
                           CONSTRAINT EventID_fk FOREIGN KEY (EventID) REFERENCES Event(EventID));
											
--
-- Reference: if any
-- Note: if any
--

