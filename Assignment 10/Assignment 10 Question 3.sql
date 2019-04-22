SELECT Titles.title_id, Titles.title, Titles.ytd_sales
FROM Titles INNER JOIN Sales ON Titles.title_id = Sales.title_id
INNER JOIN Stores ON Sales.stor_id = Stores.stor_id
WHERE Stores.state IN ('OR', 'CA')