SELECT Titles.title_id, Titles.title, COUNT(Titleauthor.au_id) AS 'total authors'
FROM Titles INNER JOIN Titleauthor ON Titles.title_id = Titleauthor.title_id
INNER JOIN Authors ON Titleauthor.au_id = Authors.au_id
GROUP BY Titles.title_id, Titles.title
HAVING COUNT(Titleauthor.au_id) > 1