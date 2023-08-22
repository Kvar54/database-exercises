CREATE DATABASE IF NOT EXISTS ent_db_lectures;
USE ent_db_lectures;

CREATE TABLE suppliers
(
    id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name        VARCHAR(100) NOT NULL,
    established INT          NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE coffees
(
    id          INT UNSIGNED  NOT NULL AUTO_INCREMENT,
    name        VARCHAR(100)  NOT NULL,
    roast       VARCHAR(100)  NOT NULL,
    price       DECIMAL(5, 2) NOT NULL,
    supplier_id INT UNSIGNED  NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT coffee_supplier_id_fk FOREIGN KEY (supplier_id) REFERENCES suppliers (id)
);



INSERT INTO suppliers (name, established)
VALUES ('Bean There, Done That Distributors', 1988),
       ('Caffeine Cartel Connections', 2005);

INSERT INTO coffees (name, roast, price, supplier_id)
VALUES ('Hazelnutty Delight', 'medium', 5.99, 2),
       ('Choco-nut Nirvana', 'light', 4.49, 1),
       ('Berry Bonanza Brew', 'dark', 4.99, 1),
       ('Caramel Bliss-presso', 'espresso', 5.99, 1),
       ('Raspberry Rhapsody Roast', 'medium', 5.49, 2),
       ('S\'more Energy Latte', 'light', 4.99, 2)
;

SELECT c.name AS Coffee, s.name As Supplier, s.established AS "Established In"
FROM coffees AS c
         JOIN suppliers AS s
              ON c.supplier_id = s.id
# ORDER BY s.name, c.name
ORDER BY c.roast
;



CREATE TABLE roles (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(100) NOT NULL,
                       PRIMARY KEY (id)
);

CREATE TABLE users (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(100) NOT NULL,
                       email VARCHAR(100) NOT NULL,
                       role_id INT UNSIGNED DEFAULT NULL,
                       PRIMARY KEY (id),
                       FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
                                             ('bob', 'bob@example.com', 1),
                                             ('joe', 'joe@example.com', 2),
                                             ('sally', 'sally@example.com', 3),
                                             ('adam', 'adam@example.com', 3),
                                             ('jane', 'jane@example.com', null),
                                             ('mike', 'mike@example.com', null);

SELECT u.name AS Name, r.name AS Role
FROM users U
        Right JOIN roles r
              ON u.role_id = r.id
;

SELECT u.name AS Name, r.name AS Role
FROM users U
         Left JOIN roles r
                    ON u.role_id = r.id
;

CREATE TABLE shops(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
        name VARCHAR(100) NOT NULL,
        address VARCHAR(100) NOT NULL,
        PRIMARY KEY (id)
);

CREATE TABLE coffees_shops(
   coffee_id INT UNSIGNED NOT NULL,
   shop_id INT UNSIGNED NOT NULL,
   CONSTRAINT coffees_shops_coffee_id_fk FOREIGN KEY(coffee_id) REFERENCES coffees (id),
   CONSTRAINT coffees_shops_coffee_id_fk FOREIGN KEY(shop_id) REFERENCES coffees (id)
);

INSERT INTO coffees_shops (coffee_id, shop_id)
    VALUES (1,1),
            (2,2),
(           3,3)
    ;

SELECT c.name AS Coffee, s.name AS Shop
FROM shops s
JOIN coffees_shops cs
ON s.id = cs.shop_id
JOIN coffees c
    ON cs.coffee_id = c.id;