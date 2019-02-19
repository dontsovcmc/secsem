PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS users (
id INTEGER PRIMARY KEY AUTOINCREMENT,
login TEXT NOT NULL,
money_amount REAL NOT NULL,
card_number TEXT,
status INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS auth (
id INTEGER PRIMARY KEY AUTOINCREMENT,
password TEXT NOT NULL,
user_id INTEGER NOT NULL,
FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);


INSERT INTO users (login, money_amount, card_number, status)
VALUES ('admin', 100.0, '5209676196761865', 1);

INSERT INTO auth (user_id, password) VALUES
((SELECT id FROM users WHERE users.login = 'admin'), '12345');


INSERT INTO users (login, money_amount, card_number, status)
VALUES ('Евгений', 100.0, '347388064296313', 1);

INSERT INTO auth (user_id, password) VALUES
((SELECT id FROM users WHERE users.login = 'Евгений'), '123');


INSERT INTO users (login, money_amount, card_number, status)
VALUES ('Данила', 100.0, '4716132567390750', 1);

INSERT INTO auth (user_id, password) VALUES
((SELECT id FROM users WHERE users.login = 'Данила'), '0000');


INSERT INTO users (login, money_amount, card_number, status)
VALUES ('Ольга', 100.0, '4532929481356706', 0);

INSERT INTO auth (user_id, password) VALUES
((SELECT id FROM users WHERE users.login = 'Ольга'), 'd&3L1#ddg');


INSERT INTO users (login, money_amount, card_number, status)
VALUES ('Мария', 100.0, '4929366870474025', 0);

INSERT INTO auth (user_id, password) VALUES
((SELECT id FROM users WHERE users.login = 'Мария'), 'uT5W$4TkSDg');
