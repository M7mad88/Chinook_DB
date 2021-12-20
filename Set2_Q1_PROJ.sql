/*
Question 1: Return the email, first name, last name, and Genre of all Rock Music listeners.
*/
SELECT  c.Email,c.FirstName,c.LastName,g.Name from Customer c join Invoice i on
c.CustomerId=i.CustomerId join InvoiceLine inv on inv.InvoiceId=i.InvoiceId
join Track t on t.TrackId=inv.TrackId join Genre g on g.GenreId=t.GenreId
 group by 1 order by 1; 