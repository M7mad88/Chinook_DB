/*
Question 1: Which countries have the most Invoices?
*/

SELECT BillingCountry,count(InvoiceId) as Invoices from Invoice group by 1 order by 2 DESC;