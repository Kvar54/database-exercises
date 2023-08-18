CREATE DATABASE IF NOT EXISTS codeup_test_db;

USE codeup_test_db;

SELECT * FROM albums
WHERE artist = 'pink floyd';

SELECT release_date FROM albums
WHERE artist = 'Sgt. Pepper''s Lonely Hearts Club Band';

SELECT genre FROM albums
WHERE name = ' Nevermind';

SELECT * FROM albums
WHERE release_date BETWEEN '1990' AND '1999';

SELECT * FROM albums
WHERE sales < '20.0';

SELECT * FROM albums
WHERE genre < 'Rock';



