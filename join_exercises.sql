CREATE DATABASE IF NOT EXISTS join_test_db;

CREATE TABLE roles
(
    id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE users
(
    id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name    VARCHAR(100) NOT NULL,
    email   VARCHAR(100) NOT NULL,
    role_id INT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name)
VALUES ('admin');
INSERT INTO roles (name)
VALUES ('author');

INSERT INTO roles (name)
VALUES ('reviewer');
INSERT INTO roles (name)
VALUES ('commenter');

INSERT INTO users (name, email, role_id)
VALUES ('bob', 'bob@example.com', 1),
       ('joe', 'joe@example.com', 2),
       ('sally', 'sally@example.com', 3),
       ('adam', 'adam@example.com', 3),
       ('jane', 'jane@example.com', null),
       ('Jenny', 'jenny@example.com', 2),
       ('kenny', 'OMGUKiLLEdKENNY@aol,com', 2),
       ('krissy', 'krisy@example.com', 2),
       ('Raul', 'raul@example.com', null),
       ('mike', 'mike@example.com', null);



SELECT users.name, users.email, users.role_id AS role
FROM users
         INNER JOIN roles ON users.role_id = users.role_id;


SELECT users.name, users.email, users.role_id AS role
FROM users
         Right JOIN roles ON users.role_id;


SELECT users.name, users.email, users.role_id AS role
FROM users
         LEFT JOIN roles ON users.role_id;


SELECT roles.name AS role, COUNT(users.id) AS user_count
FROM roles
         LEFT JOIN users ON roles.id = users.role_id
GROUP BY roles.name;


USE employees;



SELECT CONCAT(e.first_name, ' ', e.last_name) AS dept_manager, d.dept_name
FROM employees AS e
         JOIN dept_manager AS dm ON dm.emp_no = e.emp_no
         JOIN departments AS d ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'
ORDER BY d.dept_name ASC;



SELECT CONCAT(e.first_name, ' ', e.last_name) AS dept_manager, d.dept_name
FROM employees AS e
         JOIN dept_manager AS dm ON dm.emp_no = e.emp_no
         JOIN departments AS d ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'
  AND e.gender = 'F'
ORDER BY d.dept_name ASC;


SELECT ti.title AS titles, COUNT(d.dept_name) AS total
FROM employees AS e
         JOIN titles AS ti ON ti.emp_no = e.emp_no
         JOIN dept_emp on ti.emp_no = dept_emp.emp_no
         JOIN departments AS d ON d.dept_no = dept_emp.dept_no
WHERE ti.to_date = '9999-01-01'
  AND dept_emp.to_date = '9999-01-01'
  AND d.dept_name = 'customer service'
GROUP BY ti.title;

SELECT CONCAT(e.first_name, ' ', e.last_name) AS dept_manager, d.dept_name, s.salary
FROM employees AS e
         JOIN dept_manager AS dm ON dm.emp_no = e.emp_no
         JOIN departments AS d ON d.dept_no = dm.dept_no
        JOIN salaries AS s on e.emp_no = s.emp_no
WHERE dm.to_date = '9999-01-01'
AND s.to_date = '9999-01-01'
ORDER BY d.dept_name ASC;

DESCRIBE employees;
DESCRIBE departments;