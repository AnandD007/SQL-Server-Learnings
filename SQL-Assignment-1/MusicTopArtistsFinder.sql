-- 5.  

USE testDb;
CREATE TABLE artists
(
artist_id int primary key,
artist_name varchar(50) not null
)

CREATE TABLE songs
(
song_id int primary key,
artist_id int not null references artists(artist_id)
)

CREATE TABLE songs_charts
(
day int not null,
song_id int not null references songs(song_id),
rank int not null
)

INSERT INTO artists VALUES (101, 'Ed Sharan'), (120, 'Drake')

INSERT INTO songs VALUES (45202, 101), (19960, 120)

INSERT INTO songs_charts VALUES (1, 45202, 5), (3, 45202, 2), (1, 19960, 3),(9, 19960, 15)

-- Solution
SELECT TOP 1 artist_name, RANK() OVER (ORDER BY COUNT(*) DESC) AS song_appearances_rank 
FROM artists
INNER JOIN songs ON artists.artist_id = songs.artist_id
INNER JOIN songs_charts ON songs.song_id = songs_charts.song_id 
WHERE songs_charts.rank <= 10
GROUP BY artists.artist_id, artist_name 
ORDER BY song_appearances_rank


