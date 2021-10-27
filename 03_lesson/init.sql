PRAGMA foreign_keys=on;

CREATE TABLE IF NOT EXISTS qualification(
    id INTEGER PRIMARY KEY,
    status TEXT(12) NOT NULL
);

CREATE TABLE IF NOT EXISTS languages(
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS programmers(
    id INTEGER PRIMARY KEY,
    pname TEXT NOT NULL,
    qualification_id INT NOT NULL,
    FOREIGN KEY (qualification_id) REFERENCES qualification(id)
);

CREATE TABLE IF NOT EXISTS lang_knowledge(
    id INTEGER PRIMARY KEY,
    programmers_id INT NOT NULL,
    language_id INT NOT NULL,
    FOREIGN KEY (programmers_id) REFERENCES programmers(id),
    FOREIGN KEY (language_id) REFERENCES languages(id)
);

CREATE TABLE IF NOT EXISTS os(
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS category(
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS products(
    id INTEGER PRIMARY KEY,
    name TEXT(32) NOT NULL,
    category_id INT NOT NULL,
    os_id INT NOT NULL,
    curr_price REAL NOT NULL,
    descr TEXT, 
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (os_id) REFERENCES os(id)
);

CREATE TABLE IF NOT EXISTS purchases(
    id INTEGER PRIMARY KEY,
    date DATETIME NOT NULL,
    product_id INT NOT NULL,
    price REAL NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE IF NOT EXISTS dev_products(
    id INTEGER PRIMARY KEY,
    programmers_id INT NOT NULL,
    product_id INT NOT NULL,
    FOREIGN KEY (programmers_id) REFERENCES programmers(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO qualification (status) VALUES ('Junior');
INSERT INTO qualification (status) VALUES ('Middle');
INSERT INTO qualification (status) VALUES ('Senor');

INSERT INTO category (name) VALUES ('Game');
INSERT INTO category (name) VALUES ('Office');
INSERT INTO category (name) VALUES ('Education');

INSERT INTO languages (name) VALUES ('Python');
INSERT INTO languages (name) VALUES ('C#');
INSERT INTO languages (name) VALUES ('Java');
INSERT INTO languages (name) VALUES ('C++');

INSERT INTO os (name) VALUES ('Android');
INSERT INTO os (name) VALUES ('iPhone');
INSERT INTO os (name) VALUES ('SymphonyOS');

INSERT INTO programmers (pname, qualification_id) VALUES ('Steve Wozniak', 1);
INSERT INTO programmers (pname, qualification_id) VALUES ('Steve Jobs', 2);
INSERT INTO programmers (pname, qualification_id) VALUES ('Bill Gates', 2);
INSERT INTO programmers (pname, qualification_id) VALUES ('Guido van Rossum', 3);
INSERT INTO programmers (pname, qualification_id) VALUES ('Bjarne Stroustrup', 3);

INSERT INTO lang_knowledge (programmers_id, language_id) VALUES (1, 1);
INSERT INTO lang_knowledge (programmers_id, language_id) VALUES (1, 2);
INSERT INTO lang_knowledge (programmers_id, language_id) VALUES (2, 3);
INSERT INTO lang_knowledge (programmers_id, language_id) VALUES (3, 2);
INSERT INTO lang_knowledge (programmers_id, language_id) VALUES (4, 1);
INSERT INTO lang_knowledge (programmers_id, language_id) VALUES (4, 3);
INSERT INTO lang_knowledge (programmers_id, language_id) VALUES (5, 4);

INSERT INTO products (name, descr, category_id, os_id, curr_price) VALUES ('Crossout Mobile','Racing for children 5-7 years old', 1, 1, 5.8);
INSERT INTO products (name, descr, category_id, os_id, curr_price) VALUES ('Tik Fok', 'Social app for teenagers', 1, 2, 12.98);
INSERT INTO products (name, descr, category_id, os_id, curr_price) VALUES ('Mimo', 'A daily planner with a schedule and an alarm clock', 3, 1, 10.00);
INSERT INTO products (name, descr, category_id, os_id, curr_price) VALUES ('Mimo', 'A daily planner with a schedule and an alarm clock', 3, 2, 21.30);
INSERT INTO products (name, descr, category_id, os_id, curr_price) VALUES ('EdX', 'Notes, recipes', 3, 3, 1.0);
INSERT INTO products (name, descr, category_id, os_id, curr_price) VALUES ('Sim Soti', 'A game in which you need to build cities', 1, 1, 0.0);
INSERT INTO products (name, descr, category_id, os_id, curr_price) VALUES ('Pazzle', 'Solving puzzles and puzzles', 1, 2, 0.0);
INSERT INTO products (name, descr, category_id, os_id, curr_price) VALUES ('Funny Office', 'Mobile Office', 2, 1, 9.9);
INSERT INTO products (name, descr, category_id, os_id, curr_price) VALUES ('Funny Office', 'Mobile Office', 2, 2, 34.9);
INSERT INTO products (name, descr, category_id, os_id, curr_price) VALUES ('Clev Calc', 'Calculator with an extended set of functions', 2, 3, 0.0);
INSERT INTO products (name, descr, category_id, os_id, curr_price) VALUES ('Clev Calc', 'Calculator with an extended set of functions', 2, 1, 0.0);

INSERT INTO dev_products (programmers_id, product_id) VALUES (1, 1);
INSERT INTO dev_products (programmers_id, product_id) VALUES (4, 2);
INSERT INTO dev_products (programmers_id, product_id) VALUES (1, 2);
INSERT INTO dev_products (programmers_id, product_id) VALUES (3, 2);
INSERT INTO dev_products (programmers_id, product_id) VALUES (2, 3);
INSERT INTO dev_products (programmers_id, product_id) VALUES (3, 3);
INSERT INTO dev_products (programmers_id, product_id) VALUES (2, 4);
INSERT INTO dev_products (programmers_id, product_id) VALUES (3, 4);
INSERT INTO dev_products (programmers_id, product_id) VALUES (5, 5);
INSERT INTO dev_products (programmers_id, product_id) VALUES (5, 6);
INSERT INTO dev_products (programmers_id, product_id) VALUES (1, 6);
INSERT INTO dev_products (programmers_id, product_id) VALUES (1, 7);
INSERT INTO dev_products (programmers_id, product_id) VALUES (4, 7);
INSERT INTO dev_products (programmers_id, product_id) VALUES (2, 8);
INSERT INTO dev_products (programmers_id, product_id) VALUES (3, 8);
INSERT INTO dev_products (programmers_id, product_id) VALUES (2, 9);
INSERT INTO dev_products (programmers_id, product_id) VALUES (4, 9);
INSERT INTO dev_products (programmers_id, product_id) VALUES (5, 10);
INSERT INTO dev_products (programmers_id, product_id) VALUES (1, 11);