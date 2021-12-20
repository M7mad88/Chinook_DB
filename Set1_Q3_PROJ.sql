/*
Question 3: Who is the best customer?
*/
select c.CustomerId,c.FirstName || ' ' || c.LastName as Name, sum(i.Total) as TotalSpent from Invoice  i join Customer c on
c.CustomerId=i.CustomerId group by 1 ,2 order by 3 desc limit 1; 