--
-- Database: `dbName`
--

-- --------------------------------------------------------

--
-- Table structure for table `People`
--
CREATE TABLE People (
    SchoolID INT PRIMARY KEY AUTO_INCREMENT,
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
    ClassYear SET(9, 10, 11, 12),
    CONSTRAINT SchoolID_fk FOREIGN KEY (SchoolID) REFERENCES People(SchoolID),
    CONSTRAINT Fullname_fk FOREIGN KEY (Fullname) REFERENCES People(Fullname),
    CONSTRAINT SpaceRoomID_fk FOREIGN KEY (SpaceRoomID) REFERENCES SpaceRoom(SpaceRoomID)
);

--
-- Table structure for table `Faculty`
--
CREATE TABLE Faculty (
    SchoolID INT NOT NULL,
    FullName TEXT NOT NULL,
    SpaceRoomID INT NOT NULL,
    isTeaching BOOLEAN,
    CONSTRAINT SchoolID_fk FOREIGN KEY (SchoolID) REFERENCES People(SchoolID),
    CONSTRAINT Fullname_fk FOREIGN KEY (Fullname) REFERENCES People(Fullname),
    CONSTRAINT SpaceRoomID_fk FOREIGN KEY (SpaceRoomID) REFERENCES SpaceRoom(SpaceRoomID)
);

--
-- Table structure for table `Staff`
--
CREATE TABLE Staff (
    SchoolID INT NOT NULL,
    FullName TEXT NOT NULL,
    SpaceRoomID INT NOT NULL,
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
    BuildingType SET('ACADEMIC', 'RESIDENTIAL', 'ADMINISTRATIVE', 'EXTRACURRICULAR')
);


--
-- Table structure for table `SpaceRoom`
--
CREATE TABLE SpaceRoom (
    SpaceRoomID INT PRIMARY KEY AUTO_INCREMENT,
    SpaceName TEXT,
    BuildingID INT NOT NULL,
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
-- Table structure for table `MedicalData`
--
CREATE TABLE MedicalData (
    SchoolID INT,
    MedicalID INT PRIMARY KEY AUTO_INCREMENT,
    isPositive BOOLEAN,
    height INT,
    weight INT,
    age INT,
    temp FLOAT,
    CONSTRAINT SchoolID_fk FOREIGN KEY (SchoolID) REFERENCES Person(SchoolID)
);


--
-- Table structure for table `CaseData`
--
CREATE TABLE CaseData (
    CaseID INT PRIMARY KEY AUTO_INCREMENT,
    MedicalID INT,
    isHospitalized BOOLEAN,
    treatmentPlanID INT,
    CONSTRAINT MedicalID_fk FOREIGN KEY (MedicalID) REFERENCES MedicalData(MedicalID),
    CONSTRAINT treatmentPlanID_fk FOREIGN KEY (treatmentPlanID) REFERENCES TreatmentPlan(treatmentPlanID)
);


--
-- Table structure for table `TreatmentPlan`
--
CREATE TABLE TreatmentPlan (
    treatmentPlanID INT PRIMARY KEY AUTO_INCREMENT,
    PrescriptionName TEXT
);

--
-- References: if any
-- Note: if any
--

