# Analytics of Formula 1 data using SQL Queries
This project is an analysis of Formula 1 data from 1950-2023 using SQL. The analysis includes creating databases and tables, data cleaning and exploration. The aim of the project is to gain insights into the performance of driveers and constructors across the years as well as other general questions being answered.

# Procedure
## Creating a New Database
- A new database was created to prvide a dedicated environment for this project

```
CREATE DATABASE formula1;
USE formula1;
```

## Importing tables into database
- Tables with the relevant data were added to the dataset.
#### circuits ***(Full query available in files)***
- In order to allow mass insertion of the data, '0' was added to fill blank spaces in circuits.alt after which they were updated to NULL.
```
CREATE TABLE circuits(
  circuitiD INT PRIMARY KEY,
  circuitRef VARCHAR (255),
  name VARCHAR (255),
  location VARCHAR (255),
  country VARCHAR (50),
  alt INT DEFAULT NULL
);

INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(1,'albert_park','Albert Park Grand Prix Circuit','Melbourne','Australia',10);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(2,'sepang','Sepang International Circuit','Kuala Lumpur','Malaysia',18);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(3,'bahrain','Bahrain International Circuit','Sakhir','Bahrain',7);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(4,'catalunya','Circuit de Barcelona-Catalunya','Montmelo','Spain',109);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(5,'istanbul','Istanbul Park','Istanbul','Turkey',130);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(6,'monaco','Circuit de Monaco','Monte-Carlo','Monaco',7);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(7,'villeneuve','Circuit Gilles Villeneuve','Montreal','Canada',13);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(8,'magny_cours','Circuit de Nevers Magny-Cours','Magny Cours','France',228);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(9,'silverstone','Silverstone Circuit','Silverstone','UK',153);
...
UPDATE circuits
SET alt = NULL
WHERE alt = 0;
  ```
#### constructors ***(Full query available in files)***
```
CREATE TABLE constructors(
  constructorId INT NOT NULL PRIMARY KEY,
  constructorRef VARCHAR(30),
  name VARCHAR(50),
  nationality VARCHAR(100)
);

INSERT INTO constructors(constructorId, constructorRef, name, nationality) VALUES(1, 'mclaren', 'McLaren', 'British');
INSERT INTO constructors(constructorId, constructorRef, name, nationality) VALUES(2, 'bmw_sauber', 'BMW Sauber', 'German');
INSERT INTO constructors(constructorId, constructorRef, name, nationality) VALUES(3, 'williams', 'Williams', 'British');
INSERT INTO constructors(constructorId, constructorRef, name, nationality) VALUES(4, 'renault', 'Renault', 'French');
INSERT INTO constructors(constructorId, constructorRef, name, nationality) VALUES(5, 'toro_rosso', 'Toro Rosso', 'Italian');
INSERT INTO constructors(constructorId, constructorRef, name, nationality) VALUES(6, 'ferrari', 'Ferrari', 'Italian');
INSERT INTO constructors(constructorId, constructorRef, name, nationality) VALUES(7, 'toyota', 'Toyota', 'Japanese');
INSERT INTO constructors(constructorId, constructorRef, name, nationality) VALUES(8, 'super_aguri', 'Super Aguri', 'Japanese');
INSERT INTO constructors(constructorId, constructorRef, name, nationality) VALUES(9, 'red_bull', 'Red Bull', 'Austrian');
INSERT INTO constructors(constructorId, constructorRef, name, nationality) VALUES(10, 'force_india', 'Force India', 'Indian');
...
```
#### constructor_results ***(Full query available in files)***
```
CREATE TABLE constructor_results(
  constructorResultsId INT PRIMARY KEY,
  raceId INT NOT NULL,
  constructorId INT NOT NULL,
  points INT,
  status VARCHAR(5)
);

INSERT INTO constructor_results (constructorResultsId, raceId, constructorId, points, status) VALUES (1, 18, 1, 14, '\N');
INSERT INTO constructor_results (constructorResultsId, raceId, constructorId, points, status) VALUES (2, 18, 2, 8, '\N');
INSERT INTO constructor_results (constructorResultsId, raceId, constructorId, points, status) VALUES (3, 18, 3, 9, '\N');
INSERT INTO constructor_results (constructorResultsId, raceId, constructorId, points, status) VALUES (4, 18, 4, 5, '\N');
INSERT INTO constructor_results (constructorResultsId, raceId, constructorId, points, status) VALUES (5, 18, 5, 2, '\N');
INSERT INTO constructor_results (constructorResultsId, raceId, constructorId, points, status) VALUES (6, 18, 6, 1, '\N');
INSERT INTO constructor_results (constructorResultsId, raceId, constructorId, points, status) VALUES (7, 18, 7, 0, '\N');
INSERT INTO constructor_results (constructorResultsId, raceId, constructorId, points, status) VALUES (8, 18, 8, 0, '\N');
INSERT INTO constructor_results (constructorResultsId, raceId, constructorId, points, status) VALUES (9, 18, 9, 0, '\N');
INSERT INTO constructor_results (constructorResultsId, raceId, constructorId, points, status) VALUES (10, 18, 10, 0, '\N');
...
```

#### constructor_standings ***(Full query available in files)***
```
CREATE TABLE constructor_standings(
  constructorStandingsId INT NOT NULL PRIMARY KEY,
  raceId INT NOT NULL,
  constructorId INT NOT NULL,
  points INT,
  position INT,
  positionText VARCHAR(2),
  wins INT
);

INSERT INTO constructor_standings (constructorStandingsId, raceId, constructorId, points, position, positionText, wins) VALUES(1, 18, 1, 14, 1, 1, 1);
INSERT INTO constructor_standings (constructorStandingsId, raceId, constructorId, points, position, positionText, wins) VALUES(2, 18, 2, 8, 3, 3, 0);
INSERT INTO constructor_standings (constructorStandingsId, raceId, constructorId, points, position, positionText, wins) VALUES(3, 18, 3, 9, 2, 2, 0);
INSERT INTO constructor_standings (constructorStandingsId, raceId, constructorId, points, position, positionText, wins) VALUES(4, 18, 4, 5, 4, 4, 0);
INSERT INTO constructor_standings (constructorStandingsId, raceId, constructorId, points, position, positionText, wins) VALUES(5, 18, 5, 2, 5, 5, 0);
INSERT INTO constructor_standings (constructorStandingsId, raceId, constructorId, points, position, positionText, wins) VALUES(6, 18, 6, 1, 6, 6, 0);
INSERT INTO constructor_standings (constructorStandingsId, raceId, constructorId, points, position, positionText, wins) VALUES(7, 19, 1, 24, 1, 1, 1);
INSERT INTO constructor_standings (constructorStandingsId, raceId, constructorId, points, position, positionText, wins) VALUES(8, 19, 2, 19, 2, 2, 0);
INSERT INTO constructor_standings (constructorStandingsId, raceId, constructorId, points, position, positionText, wins) VALUES(9, 19, 3, 9, 4, 4, 0);
INSERT INTO constructor_standings (constructorStandingsId, raceId, constructorId, points, position, positionText, wins) VALUES(10, 19, 4, 6, 5, 5, 0);
...
```

#### drivers ***(Full query available in files)***
```
CREATE TABLE drivers(
  driverId INT PRIMARY KEY,
  driverRef VARCHAR(50),
  number INT,
  code CHAR(3),
  forename VARCHAR(50),
  surname VARCHAR(50),
  dob DATE,
  nationality VARCHAR(50)
);

INSERT INTO drivers(driverId, driverRef, number, code, forename, surname, dob, nationality) VALUES(1, 'hamilton', 44, 'HAM', 'Lewis', 'Hamilton', '1985-01-07', 'British');
INSERT INTO drivers(driverId, driverRef, number, code, forename, surname, dob, nationality) VALUES(2, 'heidfeld', 0, 'HEI', 'Nick', 'Heidfeld', '1977-05-10', 'German');
INSERT INTO drivers(driverId, driverRef, number, code, forename, surname, dob, nationality) VALUES(3, 'rosberg', 6, 'ROS', 'Nico', 'Rosberg', '1985-06-27', 'German');
INSERT INTO drivers(driverId, driverRef, number, code, forename, surname, dob, nationality) VALUES(4, 'alonso', 14, 'ALO', 'Fernando', 'Alonso', '1981-07-29', 'Spanish');
INSERT INTO drivers(driverId, driverRef, number, code, forename, surname, dob, nationality) VALUES(5, 'kovalainen', 0, 'KOV', 'Heikki', 'Kovalainen', '1981-10-19', 'Finnish');
INSERT INTO drivers(driverId, driverRef, number, code, forename, surname, dob, nationality) VALUES(6, 'nakajima', 0, 'NAK', 'Kazuki', 'Nakajima', '1985-01-11', 'Japanese');
INSERT INTO drivers(driverId, driverRef, number, code, forename, surname, dob, nationality) VALUES(7, 'bourdais', 0, 'BOU', 'Sebastien', 'Bourdais', '1979-02-28', 'French');
INSERT INTO drivers(driverId, driverRef, number, code, forename, surname, dob, nationality) VALUES(8, 'raikkonen', 7, 'RAI', 'Kimi', 'Raikkonen', '1979-10-17', 'Finnish');
INSERT INTO drivers(driverId, driverRef, number, code, forename, surname, dob, nationality) VALUES(9, 'kubica', 88, 'KUB', 'Robert', 'Kubica', '1984-12-07', 'Polish');
INSERT INTO drivers(driverId, driverRef, number, code, forename, surname, dob, nationality) VALUES(10, 'glock', 0, 'GLO', 'Timo', 'Glock', '1982-03-18', 'German');
...
```

#### driver_standings ***(Full query available in files)***
```
USE formula1;
DROP TABLE IF EXISTS driver_standings;
CREATE TABLE driver_standings(
  driverStandingsId INT PRIMARY KEY,
  raceId INT NOT NULL,
  driverId INT NOT NULL,
  points INT,
  position INT,
  positionText VARCHAR(2),
  wins INT
);

INSERT INTO driver_standings(driverStandingsId, raceId, driverId, points, position, positionText, wins) VALUES (1, 18, 1, 10, 1, '1', 1);
INSERT INTO driver_standings(driverStandingsId, raceId, driverId, points, position, positionText, wins) VALUES (2, 18, 2, 8, 2, '2', 0);
INSERT INTO driver_standings(driverStandingsId, raceId, driverId, points, position, positionText, wins) VALUES (3, 18, 3, 6, 3, '3', 0);
INSERT INTO driver_standings(driverStandingsId, raceId, driverId, points, position, positionText, wins) VALUES (4, 18, 4, 5, 4, '4', 0);
INSERT INTO driver_standings(driverStandingsId, raceId, driverId, points, position, positionText, wins) VALUES (5, 18, 5, 4, 5, '5', 0);
INSERT INTO driver_standings(driverStandingsId, raceId, driverId, points, position, positionText, wins) VALUES (6, 18, 6, 3, 6, '6', 0);
INSERT INTO driver_standings(driverStandingsId, raceId, driverId, points, position, positionText, wins) VALUES (7, 18, 7, 2, 7, '7', 0);
INSERT INTO driver_standings(driverStandingsId, raceId, driverId, points, position, positionText, wins) VALUES (8, 18, 8, 1, 8, '8', 0);
INSERT INTO driver_standings(driverStandingsId, raceId, driverId, points, position, positionText, wins) VALUES (9, 19, 1, 14, 1, '1', 1);
INSERT INTO driver_standings(driverStandingsId, raceId, driverId, points, position, positionText, wins) VALUES (10, 19, 2, 11, 3, '3', 0);
...
```

#### lap_times ***(Full query available in files)***
```
CREATE TABLE lap_times(
  raceId INT NOT NULL,
  driverId INT NOT NULL,
  lap INT NOT NULL,
  position INT,
  time VARCHAR(20),
  milliseconds INT
);

INSERT INTO lap_times (raceId, driverId, lap, position, time, milliseconds) VALUES (841, 20, 1, 1, '01:38.1', 98109);
INSERT INTO lap_times (raceId, driverId, lap, position, time, milliseconds) VALUES (841, 20, 2, 1, '01:33.0', 93006);
INSERT INTO lap_times (raceId, driverId, lap, position, time, milliseconds) VALUES (841, 20, 3, 1, '01:32.7', 92713);
INSERT INTO lap_times (raceId, driverId, lap, position, time, milliseconds) VALUES (841, 20, 4, 1, '01:32.8', 92803);
INSERT INTO lap_times (raceId, driverId, lap, position, time, milliseconds) VALUES (841, 20, 5, 1, '01:32.3', 92342);
INSERT INTO lap_times (raceId, driverId, lap, position, time, milliseconds) VALUES (841, 20, 6, 1, '01:32.6', 92605);
INSERT INTO lap_times (raceId, driverId, lap, position, time, milliseconds) VALUES (841, 20, 7, 1, '01:32.5', 92502);
INSERT INTO lap_times (raceId, driverId, lap, position, time, milliseconds) VALUES (841, 20, 8, 1, '01:32.5', 92537);
INSERT INTO lap_times (raceId, driverId, lap, position, time, milliseconds) VALUES (841, 20, 9, 1, '01:33.2', 93240);
...
```

#### pit_stops ***(Full query available in files)***
```
CREATE TABLE pit_stops(
  raceId INT NOT NULL,
  driverId INT NOT NULL,
  stop INT NOT NULL,
  lap INT NOT NULL,
  time TIME,
  duration VARCHAR(15),
  milliseconds INT
);

INSERT INTO pit_stops (raceId, driverId, stop, lap, time, duration, milliseconds) VALUES (841, 153, 1, 1, '17:05:23', '26.898', 26898);
INSERT INTO pit_stops (raceId, driverId, stop, lap, time, duration, milliseconds) VALUES (841, 30, 1, 1, '17:05:52', '25.021', 25021);
INSERT INTO pit_stops (raceId, driverId, stop, lap, time, duration, milliseconds) VALUES (841, 17, 1, 11, '17:20:48', '23.426', 23426);
INSERT INTO pit_stops (raceId, driverId, stop, lap, time, duration, milliseconds) VALUES (841, 4, 1, 12, '17:22:34', '23.251', 23251);
INSERT INTO pit_stops (raceId, driverId, stop, lap, time, duration, milliseconds) VALUES (841, 13, 1, 13, '17:24:10', '23.842', 23842);
INSERT INTO pit_stops (raceId, driverId, stop, lap, time, duration, milliseconds) VALUES (841, 22, 1, 13, '17:24:29', '23.643', 23643);
INSERT INTO pit_stops (raceId, driverId, stop, lap, time, duration, milliseconds) VALUES (841, 20, 1, 14, '17:25:17', '22.603', 22603);
INSERT INTO pit_stops (raceId, driverId, stop, lap, time, duration, milliseconds) VALUES (841, 814, 1, 14, '17:26:03', '24.863', 24863);
INSERT INTO pit_stops (raceId, driverId, stop, lap, time, duration, milliseconds) VALUES (841, 816, 1, 14, '17:26:50', '25.259', 25259);
INSERT INTO pit_stops (raceId, driverId, stop, lap, time, duration, milliseconds) VALUES (841, 67, 1, 15, '17:27:34', '25.342', 25342);
...
```

#### qualifying ***(Full query available in files)***
```
CREATE TABLE qualifying(
  qualifyid INT PRIMARY KEY,
  raceId INT NOT NULL,
  driverId INT NOT NULL,
  constructorId INT NOT NULL,
  number INT,
  position INT NOT NULL,
  q1 VARCHAR(10),
  q2 VARCHAR(10),
  q3 VARCHAR(10)
);

INSERT INTO qualifying (qualifyid, raceId, driverId, constructorId, number, position, q1, q2, q3) VALUES(1, 18, 1, 1, 22, 1, '01:26.6', '01:25.2', '01:26.7');
INSERT INTO qualifying (qualifyid, raceId, driverId, constructorId, number, position, q1, q2, q3) VALUES(2, 18, 9, 2, 4, 2, '01:26.1', '01:25.3', '01:26.9');
INSERT INTO qualifying (qualifyid, raceId, driverId, constructorId, number, position, q1, q2, q3) VALUES(3, 18, 5, 1, 23, 3, '01:25.7', '01:25.5', '01:27.1');
INSERT INTO qualifying (qualifyid, raceId, driverId, constructorId, number, position, q1, q2, q3) VALUES(4, 18, 13, 6, 2, 4, '01:26.0', '01:25.7', '01:27.2');
INSERT INTO qualifying (qualifyid, raceId, driverId, constructorId, number, position, q1, q2, q3) VALUES(5, 18, 2, 2, 3, 5, '01:26.0', '01:25.5', '01:27.2');
INSERT INTO qualifying (qualifyid, raceId, driverId, constructorId, number, position, q1, q2, q3) VALUES(6, 18, 15, 7, 11, 6, '01:26.4', '01:26.1', '01:28.5');
INSERT INTO qualifying (qualifyid, raceId, driverId, constructorId, number, position, q1, q2, q3) VALUES(7, 18, 3, 3, 7, 7, '01:26.3', '01:26.1', '01:28.7');
INSERT INTO qualifying (qualifyid, raceId, driverId, constructorId, number, position, q1, q2, q3) VALUES(8, 18, 14, 9, 9, 8, '01:26.4', '01:26.1', '01:29.0');
INSERT INTO qualifying (qualifyid, raceId, driverId, constructorId, number, position, q1, q2, q3) VALUES(9, 18, 10, 7, 12, 9, '01:26.9', '01:26.2', '01:29.6');
INSERT INTO qualifying (qualifyid, raceId, driverId, constructorId, number, position, q1, q2, q3) VALUES(10, 18, 20, 5, 15, 10, '01:26.7', '01:25.8', '\N');
...
```

#### races ***(Full query available in files)***
```
CREATE TABLE races(
  raceid INT PRIMARY KEY,
  year YEAR,
  round INT,
  circuitid INT,
  name VARCHAR (255)
);

INSERT INTO races(raceid, year, round, circuitid, name)  VALUES(1, 2009, 1, 1, 'Australian Grand Prix');
INSERT INTO races(raceid, year, round, circuitid, name)  VALUES(2, 2009, 2, 2, 'Malaysian Grand Prix');
INSERT INTO races(raceid, year, round, circuitid, name)  VALUES(3, 2009, 3, 17, 'Chinese Grand Prix');
INSERT INTO races(raceid, year, round, circuitid, name)  VALUES(4, 2009, 4, 3, 'Bahrain Grand Prix');
INSERT INTO races(raceid, year, round, circuitid, name)  VALUES(5, 2009, 5, 4, 'Spanish Grand Prix');
INSERT INTO races(raceid, year, round, circuitid, name)  VALUES(6, 2009, 6, 6, 'Monaco Grand Prix');
INSERT INTO races(raceid, year, round, circuitid, name)  VALUES(7, 2009, 7, 5, 'Turkish Grand Prix');
INSERT INTO races(raceid, year, round, circuitid, name)  VALUES(8, 2009, 8, 9, 'British Grand Prix');
INSERT INTO races(raceid, year, round, circuitid, name)  VALUES(9, 2009, 9, 20, 'German Grand Prix');
INSERT INTO races(raceid, year, round, circuitid, name)  VALUES(10, 2009, 10, 11, 'Hungarian Grand Prix');
...
```

#### results ***(Full query available in files)***
```
CREATE TABLE results(
  resultId INT PRIMARY KEY,
  raceId INT,
  driverId INT,
  constructorId INT,
  number INT,
  grid INT,
  position INT,
  positionText VARCHAR(2),
  positionOrder INT,
  points INT,
  laps INT,
  fastestLapTime VARCHAR(10),
  fastestLapSpeed FLOAT,
  statusId INT
);

INSERT INTO results (resultId, raceId, driverId, constructorId, number, grid, position, positionText, positionOrder, points, laps, fastestLapTime, fastestLapSpeed, statusId) VALUES(1, 18, 1, 1, 22, 1, 1, '1', 1, 10, 58, '01:27.5', 218.3, 1);
INSERT INTO results (resultId, raceId, driverId, constructorId, number, grid, position, positionText, positionOrder, points, laps, fastestLapTime, fastestLapSpeed, statusId) VALUES(2, 18, 2, 2, 3, 5, 2, '2', 2, 8, 58, '01:27.7', 217.586, 1);
INSERT INTO results (resultId, raceId, driverId, constructorId, number, grid, position, positionText, positionOrder, points, laps, fastestLapTime, fastestLapSpeed, statusId) VALUES(3, 18, 3, 3, 7, 7, 3, '3', 3, 6, 58, '01:28.1', 216.719, 1);
INSERT INTO results (resultId, raceId, driverId, constructorId, number, grid, position, positionText, positionOrder, points, laps, fastestLapTime, fastestLapSpeed, statusId) VALUES(4, 18, 4, 4, 5, 11, 4, '4', 4, 5, 58, '01:28.6', 215.464, 1);
INSERT INTO results (resultId, raceId, driverId, constructorId, number, grid, position, positionText, positionOrder, points, laps, fastestLapTime, fastestLapSpeed, statusId) VALUES(5, 18, 5, 1, 23, 3, 5, '5', 5, 4, 58, '01:27.4', 218.385, 1);
INSERT INTO results (resultId, raceId, driverId, constructorId, number, grid, position, positionText, positionOrder, points, laps, fastestLapTime, fastestLapSpeed, statusId) VALUES(6, 18, 6, 3, 8, 13, 6, '6', 6, 3, 57, '01:29.6', 212.974, 11);
INSERT INTO results (resultId, raceId, driverId, constructorId, number, grid, position, positionText, positionOrder, points, laps, fastestLapTime, fastestLapSpeed, statusId) VALUES(7, 18, 7, 5, 14, 17, 7, '7', 7, 2, 55, '01:29.5', 213.224, 5);
INSERT INTO results (resultId, raceId, driverId, constructorId, number, grid, position, positionText, positionOrder, points, laps, fastestLapTime, fastestLapSpeed, statusId) VALUES(8, 18, 8, 6, 1, 15, 8, '8', 8, 1, 53, '01:27.9', 217.18, 5);
INSERT INTO results (resultId, raceId, driverId, constructorId, number, grid, position, positionText, positionOrder, points, laps, fastestLapTime, fastestLapSpeed, statusId) VALUES(9, 18, 9, 2, 4, 2, 0, 'R', 9, 0, 47, '01:28.8', 215.1, 4);
INSERT INTO results (resultId, raceId, driverId, constructorId, number, grid, position, positionText, positionOrder, points, laps, fastestLapTime, fastestLapSpeed, statusId) VALUES(10, 18, 10, 7, 12, 18, 0, 'R', 10, 0, 43, '01:29.6', 213.166, 3);
...
```

#### sprint_results ***(Full query available in files)***
```
CREATE TABLE sprint_results(
  resultId INT PRIMARY KEY,
  raceId INT NOT NULL,
  driverId INT NOT NULL,
  constructorId INT NOT NULL,
  number INT,
  grid INT,
  position VARCHAR(2),
  positionText VARCHAR(2),
  positionOrder INT,
  points INT,
  laps INT,
  milliseconds INT,
  fastestLapTime VARCHAR(10),
  statusId INT NOT NULL
);

INSERT INTO sprint_results (resultId, raceId, driverId, constructorId, number, grid, position, positionText, positionOrder, points, laps, milliseconds, fastestLapTime, statusId) VALUES(1, 1061, 830, 9, 33, 2, '1', '1', 1, 3, 17, '1538426', '01:30.0', 1);
INSERT INTO sprint_results (resultId, raceId, driverId, constructorId, number, grid, position, positionText, positionOrder, points, laps, milliseconds, fastestLapTime, statusId) VALUES(2, 1061, 1, 131, 44, 1, '2', '2', 2, 2, 17, '1539856', '01:29.9', 1);
INSERT INTO sprint_results (resultId, raceId, driverId, constructorId, number, grid, position, positionText, positionOrder, points, laps, milliseconds, fastestLapTime, statusId) VALUES(3, 1061, 822, 131, 77, 3, '3', '3', 3, 1, 17, '1545928', '01:30.0', 1);
INSERT INTO sprint_results (resultId, raceId, driverId, constructorId, number, grid, position, positionText, positionOrder, points, laps, milliseconds, fastestLapTime, statusId) VALUES(4, 1061, 844, 6, 16, 4, '4', '4', 4, 0, 17, '1549704', '01:30.2', 1);
INSERT INTO sprint_results (resultId, raceId, driverId, constructorId, number, grid, position, positionText, positionOrder, points, laps, milliseconds, fastestLapTime, statusId) VALUES(5, 1061, 846, 1, 4, 6, '5', '5', 5, 0, 17, '1562537', '01:30.6', 1);
INSERT INTO sprint_results (resultId, raceId, driverId, constructorId, number, grid, position, positionText, positionOrder, points, laps, milliseconds, fastestLapTime, statusId) VALUES(6, 1061, 817, 1, 3, 7, '6', '6', 6, 0, 17, '1569385', '01:30.6', 1);
INSERT INTO sprint_results (resultId, raceId, driverId, constructorId, number, grid, position, positionText, positionOrder, points, laps, milliseconds, fastestLapTime, statusId) VALUES(7, 1061, 4, 214, 14, 11, '7', '7', 7, 0, 17, '1581953', '01:31.8', 1);
INSERT INTO sprint_results (resultId, raceId, driverId, constructorId, number, grid, position, positionText, positionOrder, points, laps, milliseconds, fastestLapTime, statusId) VALUES(8, 1061, 20, 117, 5, 10, '8', '8', 8, 0, 17, '1582865', '01:31.7', 1);
INSERT INTO sprint_results (resultId, raceId, driverId, constructorId, number, grid, position, positionText, positionOrder, points, laps, milliseconds, fastestLapTime, statusId) VALUES(9, 1061, 847, 3, 63, 8, '9', '9', 9, 0, 17, '1585078', '01:32.2', 1);
...
```

#### status ***(Full query available in files)***
```
CREATE TABLE status(
  statusId INT PRIMARY KEY,
  status VARCHAR(30)
);

INSERT INTO status (statusId, status) VALUES(1, 'Finished');
INSERT INTO status (statusId, status) VALUES(2, 'Disqualified');
INSERT INTO status (statusId, status) VALUES(3, 'Accident');
INSERT INTO status (statusId, status) VALUES(4, 'Collision');
INSERT INTO status (statusId, status) VALUES(5, 'Engine');
INSERT INTO status (statusId, status) VALUES(6, 'Gearbox');
INSERT INTO status (statusId, status) VALUES(7, 'Transmission');
INSERT INTO status (statusId, status) VALUES(8, 'Clutch');
INSERT INTO status (statusId, status) VALUES(9, 'Hydraulics');
INSERT INTO status (statusId, status) VALUES(10, 'Electrical');
...
```

## Confirming the start and end date of the dataset
- An SQL query was used to confirm the dataset covers the time span of modern Formula 1
```
SELECT MIN(year),MAX(year)
FROM races;
```

## Querying circuits
- SQL queries were executed to determine how many circuits have hosted F1 races
```
SELECT COUNT(*) AS num_of_circuits
FROM circuits;
```
- SQL queries were executed to know how many countries have hosted a race and the number of tracks in each country
```
SELECT COUNT(DISTINCT COUNTRY) AS num_of_countries
FROM circuits;
```
```
SELECT country, COUNT(*) AS num_of_tracks
FROM circuits
GROUP BY 1
ORDER BY 2 DESC;
```
- Using JOIN and TEMPORARY TABLES, the fastest lap at each circuit was determined as well as the driver who set the lap
```
-- Data is limited so fastest lap for only 40 tracks available
# Adding drivers' name to laptimes table
DROP TABLE IF EXISTS drivers_laps;
CREATE TEMPORARY TABLE drivers_laps AS
    SELECT lap_times.raceId, lap_times.driverId, drivers.surname AS driver, time
    FROM lap_times
        JOIN drivers ON lap_times.driverId = drivers.driverid;

# Table with fastest lap at each circuit
DROP TABLE IF EXISTS fastest_lap;
CREATE TEMPORARY TABLE fastest_lap AS 
    SELECT circuits.name, MIN(time)
    FROM races
        JOIN lap_times ON lap_times.raceId = races.raceId
        JOIN circuits ON races.circuitId = circuits.circuitId
    GROUP BY 1;
    
# Matching the 2 tables to get the fastest lap at each circuit
SELECT circuits.name, drivers_laps.driverid, driver, time
FROM races
	JOIN drivers_laps ON drivers_laps.raceId = races.raceId
	JOIN circuits ON races.circuitId = circuits.circuitId
WHERE (circuits.name, time) IN (SELECT * from fastest_lap);
```

## Querying constructors
- The total number of constructors that have been in the sport was determined
```
SELECT COUNT(DISTINCT name) AS constructors
FROM constructors;
```
- USING JOIN, the success of each constructor was evaluated based on points accumulated and wins
```
-- How many points has each constructor scored
SELECT constructors.name, SUM(points) AS total_points
FROM constructor_results
JOIN constructors ON constructor_results.constructorId = constructors.constructorId
GROUP BY 1
ORDER BY 2 DESC;
```
```
-- Which constructor has the most wins
SELECT constructors.name, COUNT(position) AS num_of_wins
FROM constructor_standings
JOIN constructors ON constructor_standings.constructorId = constructors.constructorId
WHERE position = 1
GROUP BY 1
ORDER BY 2 DESC;
```
- One important accomplishment for a constructor is finishing a race with both cars in the lead (1-2 finish). The constructor with the most 1-2 finishes was determined
```
-- Which constructor has the most 1st and 2nd finishes in a single race
DROP VIEW IF EXISTS first_place;
CREATE VIEW first_place AS 
SELECT raceId, constructors.name, position AS first
FROM results
JOIN constructors ON results.constructorId = constructors.constructorId
WHERE position = 1;

DROP VIEW IF exists second_place;
CREATE VIEW second_place AS
SELECT raceId, constructors.name, position AS second
FROM results
JOIN constructors ON results.constructorId = constructors.constructorId
WHERE position = 2;

SELECT first_place.name, COUNT(first_place.first) as num_of_1_2_finishes
FROM first_place
JOIN second_place ON first_place.raceId = second_place.raceId
WHERE first_place.raceId = second_place.raceId
AND first_place.name = second_place.name
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;
```
- In order to succeed in Formula 1, the car and driver have to be reliable. The most unreliable constructor was determined by calculating the percentage of races they were eligible for but did not start or complete
```
-- Which constructor is most unreliable (DNFs as a percentage of number of races)
DROP VIEW IF EXISTS status_mod;
CREATE VIEW status_mod AS
SELECT *,
CASE
    WHEN status LIKE '%lap%' THEN 'Finished'
    WHEN status = 'Finished' THEN 'Finished'
    ELSE 'DNF'
    END AS status_class
FROM status;

# Total races for each team (Each team fields at most 2 cars)
DROP VIEW IF EXISTS total_races;
CREATE VIEW total_races AS
SELECT results.constructorId, count(resultId) AS total_races
FROM results
JOIN constructors ON results.constructorid = constructors.constructorid
GROUP BY results.constructorId, constructors.name
ORDER BY 2 DESC;

# Total DNFs for each team
DROP VIEW IF EXISTS total_dnf;
CREATE VIEW total_dnf AS
SELECT results.constructorId, COUNT(status_mod.status_class) AS total_dnf
FROM results
LEFT JOIN constructors ON results.constructorid = constructors.constructorid
LEFT JOIN status_mod ON results.statusid = status_mod.statusid
WHERE status_class = 'DNF'
GROUP BY results.constructorId, constructors.name
ORDER BY 2 DESC;

# Finding percentage of DNFs
SELECT constructors.name, ROUND((total_dnf / total_races) * 100, 2) AS DNF_Percentage
FROM total_races
JOIN dnfs ON dnfs.constructorId = total_races.constructorId
JOIN constructors ON constructors.constructorId = total_races.constructorId
WHERE dnfs.constructorId = total_races.constructorId
ORDER BY 2;
```

## Querying drivers
- SQL queries were executed to determine the number of drivers, the different nationalities as well as the number of drivers produced from each country
```
-- How many drivers have raced in Formula 1
SELECT COUNT(DISTINCT driverid) num_of_drivers
FROM drivers;
```
```
-- How many different driver nationalities have raced in F1
SELECT COUNT(DISTINCT nationality) AS num_of_nationalities
FROM drivers;
```
```
-- How many drivers come from each country
SELECT nationality, COUNT(driverId) AS num_of_drivers
FROM drivers
GROUP BY 1
ORDER BY 2 DESC;
```
- Each constructor fields a maximum of 2 cars and teammate pairings determine how well a constructor will do. The teammate pairings for each constructor in each season were extracted from the data
```
WITH driver1 AS
(SELECT * FROM (
	SELECT races.raceid, races.year, constructors.name AS constructor, drivers.surname AS first_driver,
	ROW_NUMBER() OVER(PARTITION BY races.raceId, races.year, constructors.name ORDER BY results.driverid) AS driver_num
	FROM results
	JOIN constructors ON results.constructorId = constructors.constructorID
	JOIN races ON results.raceId = races.raceid
	JOIN drivers ON results.driverId = drivers.driverId
    ) AS teammates
WHERE driver_num = 1),

driver2 AS
(SELECT * FROM(
	select races.raceid, races.year, constructors.name AS constructor, drivers.surname AS second_driver,
		ROW_NUMBER() OVER(PARTITION BY races.raceId, races.year, constructors.name) AS driver_num
	FROM results
	JOIN constructors ON results.constructorId = constructors.constructorID
	JOIN races ON results.raceId = races.raceid
	JOIN drivers ON results.driverId = drivers.driverId
    ) AS teammates
WHERE driver_num = 2)

SELECT year, constructor, first_driver, second_driver
FROM(
	SELECT driver1.year, driver1.constructor, driver1.first_driver, driver2.second_driver,
		ROW_NUMBER() OVER(PARTITION BY driver1.year, driver1.constructor, driver1.first_driver, driver2.second_driver) as row_num
	FROM driver1
	JOIN driver2 ON driver1.raceId = driver2.raceId
		AND driver1.year = driver2.year
		AND driver1.constructor = driver2.constructor) AS alias
WHERE row_num = 1
	AND first_driver != second_driver;
```
- Longevity is an admired quality in sports. The 5 drivers with the most races was determined
```
-- Which 5 drivers have the most races
SELECT CONCAT(forename, ' ',  surname) AS name, COUNT(results.driverid) AS num_of_races
FROM drivers
JOIN results ON drivers.driverId = results.driverId
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;
```
- The goal for drivers in Formuula 1 is to win races and if not, get on the podium
```
-- Which 5 drivers have the most wins
SELECT CONCAT(forename, ' ',  surname) AS name, COUNT(results.position) AS num_of_wins
FROM drivers
JOIN results ON drivers.driverId = results.driverId
WHERE results.position = 1
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;
```
```
-- Which 5 drivers have the most podium finishes
SELECT CONCAT(forename, ' ',  surname) AS name, COUNT(results.position) AS num_of_podiums
FROM drivers
JOIN results ON drivers.driverId = results.driverId
WHERE results.position IN (1, 2, 3)
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;
```
```
-- Driver win percentage
WITH num_races AS(
SELECT drivers.driverId, surname AS name, COUNT(results.driverid) AS num_of_races
FROM drivers
	JOIN results ON drivers.driverId = results.driverId
GROUP BY 1
ORDER BY 2 DESC),

num_wins AS(
SELECT drivers.driverId, surname AS name, COUNT(results.position) AS num_of_wins
FROM drivers
	JOIN results ON drivers.driverId = results.driverId
WHERE results.position = 1
GROUP BY 1
ORDER BY 2 DESC)

SELECT num_wins.name, num_of_races, ROUND((num_wins.num_of_wins/num_races.num_of_races) * 100, 2) AS win_percentage
FROM num_races
	JOIN num_wins on num_races.driverId = num_wins.driverId
ORDER BY 3 DESC;
```
```
-- Which drivers have never finised on the podium
SELECT CONCAT(forename, ' ',  surname) AS nonpodium_finishers
FROM drivers
WHERE (SELECT CONCAT(forename, ' ',  surname)) NOT IN 
	(SELECT CONCAT(forename, ' ',  surname)
FROM drivers
JOIN results ON drivers.driverId = results.driverId
WHERE results.position IN (1, 2, 3));
```
```
-- How many drivers have never finished on the podium
SELECT COUNT(forename) AS num_of_nonpodium_finishers
FROM drivers
WHERE (SELECT drivers.driverid) NOT IN 
	(SELECT drivers.driverid
FROM drivers
JOIN results ON drivers.driverId = results.driverId
WHERE results.position IN (1, 2, 3));
```

## Querying pit_stops
- An important aspect of a Formula 1 race is the pit stop. The duration of a pitstop can be the make it or break it point in a race. This is a factor of both the driver's ability and team mechanics. The average pit stop duration for each driver was determined
```
SELECT pit_stops.driverId, drivers.surname, ROUND(AVG(duration),2) AS AVG_pitstop_duration
FROM pit_stops
JOIN drivers ON pit_stops.driverid = drivers.driverid
GROUP BY 1,2
ORDER BY 3;
```

## Querying qualifying
- Qualifying is the chance for drivers to determine where they line up for the coming race and show their raw pace in the car. Drivers are compared to their teammates in similar machinery to determine how fast they are. Placing first in qualifying (pole postion) usually bodes well for the coming race
```
-- Which 5 drivers have the most pole positions
SELECT drivers.surname AS driver, COUNT(qualifying.position) AS num_of_poles
FROM qualifying
JOIN drivers on qualifying.driverid = drivers.driverid
WHERE position = 1
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;
```
```
-- Which constructor has the most Q3 entries
SELECT constructors.name, COUNT(position) AS num_of_Q3
FROM qualifying
JOIN constructors ON qualifying.constructorId = constructors.constructorId
WHERE q3 != '\N'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;
```
- Finding the head-to-head record between teammates for each season and for the duration of the pairing with the help of Common Table Expressions (CTE)
```
-- Qualifying head-to-head between teammates (Grouped into seasons)
WITH driver1 AS
(SELECT * FROM (select races.raceid, races.year, constructors.name AS constructor, drivers.surname AS first_driver, qualifying.position AS 1_quali_position,
		ROW_NUMBER() OVER(PARTITION BY races.raceId, races.year, constructors.name ORDER BY drivers.surname) AS driver_num
	FROM results
	JOIN constructors ON results.constructorId = constructors.constructorID
	JOIN races ON results.raceId = races.raceid
	JOIN drivers ON results.driverId = drivers.driverId
    JOIN qualifying ON results.raceId = qualifying.raceId AND results.driverId = qualifying.driverId) as teammates
WHERE driver_num=1),

driver2 AS
(SELECT * FROM (select races.raceid, races.year, constructors.name AS constructor, drivers.surname AS second_driver, qualifying.position AS 2_quali_position,
		ROW_NUMBER() OVER(PARTITION BY races.raceId, races.year, constructors.name ORDER BY drivers.surname) AS driver_num
	FROM results
	JOIN constructors ON results.constructorId = constructors.constructorID
	JOIN races ON results.raceId = races.raceid
	JOIN drivers ON results.driverId = drivers.driverId
    JOIN qualifying ON results.raceId = qualifying.raceId AND results.driverId = qualifying.driverId) as teammates
WHERE driver_num=2)

SELECT year, constructor, pairing,
CASE
    WHEN H2H NOT LIKE '%-%' THEN CONCAT(H2H, '-', 0)
    ELSE H2H
END AS H2H
FROM(select year, constructor, pairing, GROUP_CONCAT(H2H SEPARATOR '-') AS H2H
FROM(SELECT year, constructor, CONCAT(first_driver, ' - ', second_driver) AS pairing, quali_winner, COUNT(quali_winner) AS H2H
    FROM (
        SELECT driver1.year, driver1.constructor, driver1.first_driver, driver1.1_quali_position, driver2.second_driver, driver2.2_quali_position,
            CASE
            WHEN driver1.1_quali_position > driver2.2_quali_position THEN second_driver
            ELSE first_driver
        END AS quali_winner
        FROM driver1
        JOIN driver2 ON driver1.raceId = driver2.raceId
		    AND driver1.year = driver2.year
		    AND driver1.constructor = driver2.constructor
    ORDER BY 1, 2) AS table1
GROUP BY 1,2,3,4
ORDER BY 1,2,3,4) AS table2 
GROUP BY 1,2,3) AS table3;
```
```
-- Qualifying head-to-head between teammates (Without season grouping)
WITH driver1 AS
(SELECT * 
FROM (
	SELECT races.raceid, races.year, constructors.name AS constructor, drivers.surname AS first_driver, qualifying.position AS 1_quali_position,
			ROW_NUMBER() OVER(PARTITION BY races.raceId, races.year, constructors.name ORDER BY drivers.surname) AS driver_num
	FROM results
		JOIN constructors ON results.constructorId = constructors.constructorID
		JOIN races ON results.raceId = races.raceid
		JOIN drivers ON results.driverId = drivers.driverId
		JOIN qualifying ON results.raceId = qualifying.raceId AND results.driverId = qualifying.driverId) as teammates
WHERE driver_num=1),

driver2 AS
(SELECT *
FROM (
	SELECT races.raceid, races.year, constructors.name AS constructor, drivers.surname AS second_driver, qualifying.position AS 2_quali_position,
			ROW_NUMBER() OVER(PARTITION BY races.raceId, races.year, constructors.name ORDER BY drivers.surname) AS driver_num
	FROM results
		JOIN constructors ON results.constructorId = constructors.constructorID
		JOIN races ON results.raceId = races.raceid
		JOIN drivers ON results.driverId = drivers.driverId
		JOIN qualifying ON results.raceId = qualifying.raceId AND results.driverId = qualifying.driverId) as teammates
WHERE driver_num=2)


SELECT constructor, pairing,
CASE
    WHEN H2H NOT LIKE '%-%' THEN CONCAT(H2H, '-', 0)
    ELSE H2H
END AS H2H
FROM (
	SELECT constructor, pairing, GROUP_CONCAT(H2H SEPARATOR '-') AS H2H
	FROM (
		SELECT constructor, CONCAT(first_driver, ' - ', second_driver) AS pairing, quali_winner, COUNT(quali_winner) AS H2H
		FROM (
			SELECT driver1.year, driver1.constructor, driver1.first_driver, driver1.1_quali_position, driver2.second_driver, driver2.2_quali_position,
				CASE
					WHEN driver1.1_quali_position > driver2.2_quali_position THEN second_driver
					ELSE first_driver
				END AS quali_winner
			FROM driver1
				JOIN driver2 ON driver1.raceId = driver2.raceId
					AND driver1.year = driver2.year
					AND driver1.constructor = driver2.constructor
			ORDER BY 1, 2) AS table1
		GROUP BY 1,2,3
		ORDER BY 1,2,3) AS table2
	GROUP BY 1,2) AS table3;
```
