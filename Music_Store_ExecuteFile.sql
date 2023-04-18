SELECT * FROM Album;

-- Q1. Who is the senior most employee based on joining date?

SELECT * FROM Employee ORDER BY HireDate  LIMIT 1;

-- Q2. Which counties have the most Invoices?

SELECT Count(*) as Invoice_count, BillingCountry FROM Invoice GROUP BY BillingCountry 
ORDER BY Invoice_count DESC;

-- Q3. What are top 3 values of total invoices?

SELECT InvoiceId, total  FROM Invoice ORDER BY total DESC LIMIT 3;

-- Q4. Which city has the best customers? 
--- We would like to throw a promotional Music Festival in the city we made the most money.
--- Write a query that returns one city that has the highest sum of invoice totals. 
--- Return both the city name & sum of all invoice totals.

SELECT SUM(total) as invoice_total, BillingCity FROM invoice GROUP BY BillingCity
ORDER BY invoice_total DESC;

-- Q5. Who is the best customer? 
--- The customer who has spent the most money will be declared the best customer.
--- Write a query that returns the person who has spent the most money.

SELECT c.CustomerId, c.FirstName, c.LastName, SUM(i.total) as Total
FROM Customer c JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId ORDER BY Total DESC LIMIT 1;

-- Q6. Write a query to return the email, first name, last name, & Genre of all Rock Music listeners.
--- Return your list ordered alphabetically by email starting with A.

SELECT DISTINCT c.Email , c.FirstName, c.LastName, g.Name
FROM Customer c
JOIN Invoice i ON i.CustomerId = c.CustomerId
JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId
JOIN Track t ON t.TrackId = il.TrackId
JOIN Genre g ON g.GenreId = t.GenreId
WHERE g.Name LIKE 'Rock'
ORDER BY Email;

-- Q7. Let's invite the artist who have written the most rock music in our dataset.
--- Write a query that returns the Artist name and total track count of the top 10 rock bands.

SELECT a.ArtistId, a.Name, COUNT(a.ArtistId) AS Total_Number_Of_Songs
FROM Track t
JOIN Album al ON al.AlbumId = t.AlbumId
JOIN Artist a ON a.ArtistId = al.ArtistId
JOIN Genre g ON g.GenreId = t.GenreId
WHERE g.Name LIKE 'Rock'
GROUP BY a.ArtistId
ORDER BY Total_Number_Of_Songs DESC
LIMIT 10;

-- Q8. Return all the track names that have a song length longer than the average song length.
--- Return the Name and Milliseconds for each track.
--- Order by the song length with the longest songs listed first.

SELECT Name, Milliseconds FROM Track
WHERE Milliseconds > ( SELECT AVG(Milliseconds) AS Average_Track_Length FROM Track )
ORDER BY Milliseconds DESC;

Thank You :D