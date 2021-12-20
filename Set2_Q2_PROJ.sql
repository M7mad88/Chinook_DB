/*
Question 2: Who is writing the rock music?
*/
SELECT a.name, count(g.name) as Songs  from Artist a join Album al on a.ArtistId=al.ArtistId 
join  Track t on t.AlbumId=al.AlbumId 
 join Genre g on g.GenreId=t.GenreId 
where g.Name='Rock' group by 1
order by Songs desc limit 10;