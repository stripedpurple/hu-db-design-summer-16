-- This query uses Char, Number, and Substitution functions to create 
-- a more friend view of the total number of books written by an author
SELECT REPLACE(CONCAT_WS(' ',fname, lname), 'Ford Ford', 'Ford Squared') as Author, 
	COUNT(REPLACE(CONCAT_WS(' ',fname, lname), 'Ford Ford', 'Ford Squared')) as total_books 
	FROM authors GROUP BY Author ORDER BY total_books DESC;

-- This query uses date and arithmatic functions to determine 
-- the hour of the day when most people purchase books
SELECT EXTRACT(HOUR MINUTE FROM purchdate), COUNT(purchdate) 
	FROM purchases GROUP BY ORDER BY 1 DESC;
