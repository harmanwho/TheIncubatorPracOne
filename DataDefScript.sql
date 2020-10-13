--
-- Database: `dbName`
--

-- --------------------------------------------------------

--
-- Table structure for table `People`
--
CREATE TABLE People (
    SchoolID INT PRIMARY KEY,
	FullName TEXT NOT NULL,
	IsQuar BOOLEAN,
    GroupID INT NOT NULL
);

--
-- Table structure for table `Students`
--
CREATE TABLE Student (
    SchoolID INT NOT NULL,
    FullName TEXT NOT NULL,
    SpaceRoomID INT NOT NULL,
    ClassYear(col SET(9, 10, 11, 12)),
    CONSTRAINT SchoolID_fk FOREIGN KEY (SchoolID) REFERENCES People(SchoolID),
    CONSTRAINT Fullname_fk FOREIGN KEY (Fullname) REFERENCES People(Fullname),
    CONSTRAINT SpaceRoomID_fk FOREIGN KEY (SpaceRoomID) REFERENCES SpaceRoom(SpaceRoomID)
);

--
-- Table structure for table `Building`
--
CREATE TABLE Building (
    BuildingID INT PRIMARY KEY AUTO_INCREMENT,
    BuildingName TEXT,
    BuildingType [ACADEMIC, RESIDENTIAL, ADMINISTRATIVE, EXTRACURRICULAR]
);


--
-- Table structure for table `SpaceRoom`
--
CREATE TABLE SpaceRoom (
    SpaceRoomID INT NOT NULL AUTO_INCREMENT,
    SpaceName TEXT,
    BuildingID INT,
    CONSTRAINT BuildingID_fk FOREIGN KEY (BuildingID) REFERENCES Building(BuildingID)
);


--
-- Table structure for table `Event`
--
CREATE TABLE Event (
    EventID INT PRIMARY KEY AUTO_INCREMENT,
    SpaceRoomID INT,
    StartTime TIME,
    EndTime TIME,
    EventName TEXT,
    EventDay DATE,
    CONSTRAINT SpaceRoomID_fk FOREIGN KEY (SpaceRoomID) REFERENCES SpaceRoom(SpaceRoomID)
);


--
-- Table structure for table `EventAttendees`
--
CREATE TABLE EventAtendees (
    AttendeeID INT PRIMARY KEY AUTO_INCREMENT,
    SchoolID INT,
    EventID INT,
    CONSTRAINT SchoolID_fk FOREIGN KEY (SchoolID) REFERENCES Person(SchoolID),
    CONSTRAINT EventID_fk FOREIGN KEY (EventID) REFERENCES Event(EventID)
);			


--
-- References: if any
-- Note: if any
--

