-- Referenced by Purchases
CREATE TABLE Customers (
    id             SERIAL PRIMARY KEY,
    fname          VARCHAR(40),
    lname          VARCHAR(40),
    email          VARCHAR(255)
);

-- Refs Purchase Details
CREATE TABLE Purchases (
    id             SERIAL PRIMARY KEY,
    customerId     INTEGER REFERENCES Customers(id),
    purchDate      DATETIME
);

CREATE TABLE Publishers (
    id            SERIAL PRIMARY KEY,
    name          VARCHAR(255)
);

-- Refs Publishers and Author Books
CREATE TABLE Books (
    id            SERIAL PRIMARY KEY,
    title         VARCHAR(255),
    publisherId   INTEGER REFERENCES Publishers(id)
);

-- Refs Author Books
CREATE TABLE Authors (
    id            SERIAL PRIMARY KEY,
    fname         VARCHAR(45),
    lname         VARCHAR(45)
);

CREATE TABLE AuthorBooks (
    id            SERIAL PRIMARY KEY,
    authorId      INTEGER REFERENCES Authors(id),
    bookId        INTEGER REFERENCES Books(id)
);
CREATE UNIQUE INDEX ux_AuthorBooks ON AuthorBooks(authorId, bookId);

-- Contains details about 
CREATE TABLE PurchaseDetails (
    id            SERIAL PRIMARY KEY,
    purchId       INTEGER REFERENCES Purchases(id),
    bookId        INTEGER REFERENCES Books(id),
    qty           INTEGER,
    price         DOUBLE PRECISION
    
);

