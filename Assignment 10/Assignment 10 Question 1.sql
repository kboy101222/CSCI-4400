SELECT Stores.stor_name, Stores.stor_address, Stores.city, Stores.[state], Stores.zip, SUM(sales.qty) AS 'total sold'
FROM Stores INNER JOIN Sales ON Stores.stor_id = Sales.stor_id
GROUP BY Stores.stor_name, Stores.stor_address, Stores.city, Stores.[state], Stores.zip
ORDER BY SUM(Sales.qty) DESC