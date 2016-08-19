  -- Builds view from three joined tables
  -- The view represents complete set info about a book
CREATE VIEW bookInfo AS
SELECT (a.lname || ',' || a.fname) as author, b.title as book, c.name as publisher FROM Authors a
	JOIN AuthorBooks d ON d.authorId = a.id
	JOIN Books b ON b.id = d.bookId
	JOIN Publishers c ON c.id = b.publisherId;

-- Subquery
-- This subquery produces a complete list of people who have purchesed books
SELECT (fname || ',' || lname) AS Customers_who_bought_things FROM Customers 
	WHERE id in (
			SELECT customerId FROM Purchases 
				WHERE purchDate >= '2016-07-30 16:32:12' AND purchDate <= '2016-07-30 16:32:13'
				);

-- GROUP BY / Order by
-- This query provides the total # of books purchased per customer
SELECT (a.fname || ',' || a.lname) AS Customer,  COUNT(b.purchDate) AS Cnt FROM Customers a
	JOIN Purchases b ON b.customerId = a.id
	GROUP BY Customer ORDER BY Cnt DESC;

CREATE INDEX theindex ON purchases (purchdate);