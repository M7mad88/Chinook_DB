/*
Question 2: Which city has the best customers?
*/
SELECT BillingCity,sum(Total) Total_invoices from Invoice group by 1 order by 2 desc limit 1; 