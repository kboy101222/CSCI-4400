SELECT Titles.type, COUNT(Titles.type) AS 'total titles'
FROM Titles
GROUP BY Titles.type
HAVING COUNT(Titles.type) > 1