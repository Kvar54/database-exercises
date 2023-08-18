USE codeup_test_db;

# SELECT * FROM albums
# WHERE release_date > '1991';

DELETE FROM albums
WHERE release_date > '1991';

# SELECT * FROM albums
# WHERE genre ='disco';

DELETE FROM albums
WHERE genre ='disco';

# SELECT * FROM albums
# WHERE name = 'Brothers in Arms';

DELETE FROM albums
WHERE name = 'Brothers in Arms';