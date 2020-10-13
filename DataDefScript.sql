--
-- Database: `dbName`
--

-- --------------------------------------------------------

--
-- Table structure for table `People`
--
CREATE TABLE People(SchoolID INT PRIMARY KEY,
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
-- Table structure for table `Building`
--
CREATE TABLE Building(buildingID INT AUTO INCREMENT PRIMARY KEY,
                      buildingName TEXT,
                      buildingType [ACADEMIC, RESIDENTIAL,
                                    ADMINISTRATIVE, EXTRACURRICULAR]);


--
-- Table structure for table `TableName`
--


--
-- Reference: if any
-- Note: if any
--

