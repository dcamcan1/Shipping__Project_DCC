SELECT shipName, captain 
FROM ship;

SELECT containerID, shipName 
FROM container;

-- Aggregate query with grouping
SELECT portName, COUNT(shipName) AS number_of_ships 
FROM ship 
GROUP BY portName;

-- Subquery
SELECT shipName 
FROM ship 
WHERE shipName IN 
	(SELECT shipName 
    FROM container 
    WHERE weight = 
		(SELECT MAX(weight) 
        FROM container));
        
-- Calculating volume of containers
SELECT containerID, height * width * length AS volume 
FROM container;

-- Multi-table join 1
SELECT s.shipName, p.city, p.country 
FROM ship s
JOIN port p USING (portName);

-- Multi-table join 2
SELECT c.containerID, s.shipName, s.captain 
FROM container c 
JOIN ship s USING (shipName);

-- Multi-table join 3
SELECT c.containerID, s.portName, p.city, p.country 
FROM container c
JOIN ship s USING (shipName)
JOIN port p USING (portName);

-- Multi-table join 4
SELECT s.shipName, p.city, p.country, COUNT(c.containerID) AS numContainers 
FROM ship s 
JOIN port p USING (portName)
JOIN container c USING (shipName)
GROUP BY s.shipName;

-- Multi-table join 5
SELECT s.captain, p.city 
FROM ship s
JOIN port p USING (portName);