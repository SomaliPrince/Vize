DROP TABLE IF EXISTS boards CASCADE;
DROP TABLE IF EXISTS threads CASCADE;
DROP TABLE IF EXISTS posts;

CREATE TABLE boards
(
    code VARCHAR(5) PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE posts
(
    id         INTEGER,
    board_code VARCHAR(5) NOT NULL REFERENCES boards (code) ON DELETE RESTRICT,
    comment    TEXT       NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id, board_code)
);

CREATE TABLE threads
(
    post_id    INTEGER,
    board_code VARCHAR(5)   NOT NULL REFERENCES boards (code) ON DELETE RESTRICT,
    name       VARCHAR(100) NOT NULL,
    PRIMARY KEY (post_id, board_code),
    FOREIGN KEY (post_id, board_code) REFERENCES posts (id, board_code) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_posts_id ON posts (id);