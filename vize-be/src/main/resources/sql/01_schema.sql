DROP TABLE IF EXISTS boards CASCADE;
DROP TABLE IF EXISTS threads CASCADE;
DROP TABLE IF EXISTS posts;

CREATE TABLE boards
(
    code VARCHAR(5) PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE threads
(
    id         INTEGER,
    board_code VARCHAR(5)   NOT NULL REFERENCES boards (code) ON DELETE RESTRICT,
    name       VARCHAR(100) NOT NULL,
    PRIMARY KEY (id, board_code)
);

CREATE TABLE posts
(
    id         INTEGER,
    thread_id  INTEGER,
    is_op      BOOLEAN GENERATED ALWAYS AS (id = thread_id) STORED,
    board_code VARCHAR(5) NOT NULL REFERENCES boards (code) ON DELETE RESTRICT,
    comment    TEXT       NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    guest_id   UUID,
    PRIMARY KEY (id, board_code),
    FOREIGN KEY (thread_id, board_code) REFERENCES posts (id, board_code) ON DELETE RESTRICT
);

CREATE INDEX IF NOT EXISTS idx_posts_id ON posts (id);