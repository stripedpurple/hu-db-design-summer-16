-- Adds appublication date field to the books table
ALTER TABLE books ADD pubdate DATE;

-- Places a not null constraint on the publisherid feild in the books table
ALTER TABLE books 
	ALTER COLUMN  publisherid SET NOT NULL;