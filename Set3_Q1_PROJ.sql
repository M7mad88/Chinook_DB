WITH CountryGenPopularityList AS
(SELECT count(*) as Popularity, gen.Name as GenreName, i.BillingCountry as Country
FROM 	InvoiceLine il
		JOIN Track trk ON trk.TrackId=il.TrackId
		JOIN Genre gen ON gen.GenreId=trk.GenreId
		JOIN Invoice i ON il.InvoiceId=i.InvoiceId
GROUP BY Country, gen.GenreId)

SELECT cgpl.Country, cgpl.GenreName, cgpl.Popularity 
FROM CountryGenPopularityList cgpl
WHERE 	cgpl.Popularity = (SELECT 	max(Popularity) FROM CountryGenPopularityList 
									WHERE cgpl.Country=Country
									GROUP BY Country
									)
ORDER BY Country