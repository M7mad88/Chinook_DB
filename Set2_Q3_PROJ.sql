/*
Question 3: 
First, find which artist has earned the most according to the InvoiceLines?
Now use this artist to find which customer spent the most on this artist. 
*/
WITH BestSellingArtist AS
(
SELECT sum(il.UnitPrice * il.Quantity) as AmountSpent, a.Name as Name, a.ArtistId
FROM InvoiceLine il, Track t, Album al, Artist a
WHERE il.TrackId=t.TrackId and
al.AlbumId=t.AlbumId and
a.ArtistId=al.ArtistId
GROUP BY a.ArtistId
ORDER BY AmountSpent desc
LIMIT 1
)

SELECT 	bsa.Name,
		c.CustomerId ,
		c.FirstName,c.LastName ,
		SUM(il.Quantity*il.UnitPrice) AS 'CustomerTotal'
FROM 	Artist a 
		JOIN Album al ON a.ArtistId = al.ArtistId 
		JOIN Track t ON t.AlbumId = al.AlbumId 
		JOIN InvoiceLine il ON t.TrackId = il.Trackid 
		JOIN Invoice i ON il.InvoiceId = i.InvoiceId 
		JOIN Customer c ON c.CustomerId = i.CustomerId 
		JOIN BestSellingArtist bsa ON bsa.ArtistId = a.ArtistId
GROUP BY c.CustomerId 
ORDER BY CustomerTotal DESC
limit 1;