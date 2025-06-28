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
    id         INTEGER PRIMARY KEY,
    board_code VARCHAR(5)   NOT NULL REFERENCES boards (code) ON DELETE RESTRICT,
    title      VARCHAR(100) NOT NULL
);

CREATE TABLE posts
(
    id         INTEGER,
    board_code VARCHAR(5) NOT NULL REFERENCES boards (code) ON DELETE RESTRICT,
    thread_id  INTEGER REFERENCES threads (id) ON DELETE CASCADE,
    content    TEXT       NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id, board_code)
);

CREATE INDEX IF NOT EXISTS idx_posts_parent ON posts (id);
CREATE INDEX IF NOT EXISTS idx_posts_thread ON threads (id);