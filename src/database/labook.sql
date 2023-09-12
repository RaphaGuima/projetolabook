-- Active: 1694132155951@@127.0.0.1@3306
CREATE TABLE users (  
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    role TEXT NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL
);

CREATE TABLE posts (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    creator_id TEXT NOT NULL,
    content TEXT NOT NULL,
    likes  INTEGER DEFAULT(0) NOT NULL,
    dislikes INTEGER DEFAULT(0) NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL,
    updated_at TEXT DEFAULT (DATETIME()) NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES users(id)
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

CREATE TABLE likes_dislikes(
    user_id TEXT NOT NULL,
    post_id TEXT NOT NULL,
    like INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    FOREIGN KEY (post_id) REFERENCES posts(id)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

SELECT * FROM users;
SELECT * FROM posts;
SELECT * FROM likes_dislikes;

DROP TABLE users;
DROP TABLE posts;
DROP TABLE likes_dislikes;

INSERT INTO users (id, name, email, password, role)
VALUES ('u001', 'Gleicielli Braga', 'gleici4@email.com', 'sd85s5#', 'NORMAL'),
       ('u002', 'Larisa Silva', 'larisil@email.com', '54dsa32l1*', 'ADMIN'),
       ('u003', 'Bruno Guimarães', 'guibruno@email.com', 'ldasd4%', 'NORMAL'),
       ('u004', 'Soraia Lima', 'sosoh22@email.com', 'sdpawkd34', 'ADMIN'),
       ('u005', 'Douglas Victor', 'dgzin7@email.com', 'da89s5d', 'NORMAL'),
       ('u006', 'Laura Souza', 'laurinhaso@email.com', 'asdgq94', 'NORMAL');

INSERT INTO posts (id, creator_id, content)
VALUES ('p001', 'u001', 'A vida é feita de escolhas, e cada escolha que fazemos define quem somos.'),
       ('p002', 'u002', 'Somos a média das cinco pessoas que convivemos.'),
       ('p003', 'u003', 'Não espere pelo momento perfeito, o momento perfeito é o agora'),
       ('p004', 'u003', 'A persistência é o caminho do êxito.');     

   
INSERT INTO likes_dislikes (user_id, post_id, like)
VALUES ('u001', 'p001', 0),
       ('u002', 'p002', 0),
       ('u003', 'p003', 0);

SELECT 
    posts.id,
    posts.creator_id,
    posts.content,
    posts.likes,
    posts.dislikes,
    posts.created_at,
    posts.updated_at,
    users.name 
FROM posts
JOIN users
ON posts.creator_id = users.id;