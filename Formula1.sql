-- What year does our dataset begin and end
SELECT MIN(year),MAX(year)
FROM races;

-- How many circuits have been on the race calendar
SELECT COUNT(*) AS num_of_circuits
FROM circuits;

-- How many countries have been on the race calendar
SELECT COUNT(DISTINCT COUNTRY) AS num_of_countries
FROM circuits;

-- What are these countries and how many tracks do they have each?
SELECT country, COUNT(*) AS num_of_tracks
FROM circuits
GROUP BY 1
ORDER BY 2 DESC;

-- How many constructors have been in the sport since 1950
SELECT COUNT(DISTINCT name) AS constructors
FROM constructors;

-- Which country has produced the most constructors
SELECT nationality, COUNT(*) as num_of_constructors
FROM constructors
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- How many points has each constructor scored
SELECT constructors.name, SUM(points) AS total_points
FROM constructor_results
JOIN constructors ON constructor_results.constructorId = constructors.constructorId
GROUP BY 1
ORDER BY 2 DESC;

-- Which constructor has the most wins
SELECT constructors.name, COUNT(position) AS num_of_wins
FROM constructor_standings
JOIN constructors ON constructor_standings.constructorId = constructors.constructorId
WHERE position = 1
GROUP BY 1
ORDER BY 2 DESC;

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

-- How many drivers have raced in Formula 1
SELECT COUNT(DISTINCT driverid) num_of_drivers
FROM drivers;

-- How many different driver nationalities have raced in F1
SELECT COUNT(DISTINCT nationality) AS num_of_nationalities
FROM drivers;

-- How many drivers come from each country
SELECT nationality, COUNT(driverId) AS num_of_drivers
FROM drivers
GROUP BY 1
ORDER BY 2 DESC;

-- Which 5 drivers have the most races
SELECT CONCAT(forename, ' ',  surname) AS name, COUNT(results.driverid) AS num_of_races
FROM drivers
JOIN results ON drivers.driverId = results.driverId
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- Which 5 drivers have the most wins
SELECT CONCAT(forename, ' ',  surname) AS name, COUNT(results.position) AS num_of_wins
FROM drivers
JOIN results ON drivers.driverId = results.driverId
WHERE results.position = 1
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

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

-- Which 5 drivers have the most podium finishes
SELECT CONCAT(forename, ' ',  surname) AS name, COUNT(results.position) AS num_of_podiums
FROM drivers
JOIN results ON drivers.driverId = results.driverId
WHERE results.position IN (1, 2, 3)
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- Which drivers have never finised on the podium
SELECT CONCAT(forename, ' ',  surname) AS nonpodium_finishers
FROM drivers
WHERE (SELECT CONCAT(forename, ' ',  surname)) NOT IN 
	(SELECT CONCAT(forename, ' ',  surname)
FROM drivers
JOIN results ON drivers.driverId = results.driverId
WHERE results.position IN (1, 2, 3));

-- How many drivers have never finished on the podium
SELECT COUNT(forename) AS num_of_nonpodium_finishers
FROM drivers
WHERE (SELECT drivers.driverid) NOT IN 
	(SELECT drivers.driverid
FROM drivers
JOIN results ON drivers.driverId = results.driverId
WHERE results.position IN (1, 2, 3));

-- What is the average pitstop duration for each driver
SELECT pit_stops.driverId, drivers.surname, ROUND(AVG(duration),2) AS AVG_pitstop_duration
FROM pit_stops
JOIN drivers ON pit_stops.driverid = drivers.driverid
GROUP BY 1,2
ORDER BY 3;

-- Which 5 drivers have the most pole positions
SELECT drivers.surname AS driver, COUNT(qualifying.position) AS num_of_poles
FROM qualifying
JOIN drivers on qualifying.driverid = drivers.driverid
WHERE position = 1
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- Which constructor has the most Q3 entries
SELECT constructors.name, COUNT(position) AS num_of_Q3
FROM qualifying
JOIN constructors ON qualifying.constructorId = constructors.constructorId
WHERE q3 != '\N'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- Pairs of teammates in the history of formula 1
WITH driver1 AS
(SELECT * FROM (
	select races.raceid, races.year, constructors.name AS constructor, drivers.surname AS first_driver,
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
    
-- Qualifying head-to-head between teammates (Grouped into years)
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

-- Qualifying head-to-head between teammates (Without year grouping)
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

-- Fastest race lap at each circuit (data is limited so only 40 tracks available)
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









