SELECT Titles.title_id, Titles.title, Titles.pub_id, Publishers.pub_name
FROM Sales, Titles INNER JOIN Publishers ON Titles.pub_id = Publishers.pub_id
WHERE NOT EXISTS (
	SELECT *
	FROM Sales
	WHERE Titles.title_id = Sales.title_id
)