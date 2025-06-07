DROP TABLE IF EXISTS boards CASCADE;
DROP TABLE IF EXISTS threads CASCADE;
DROP TABLE IF EXISTS posts;
-- Boards table
CREATE TABLE boards
(
    code VARCHAR(5) PRIMARY KEY, --pol, biz, mu
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE threads
(
    id         SERIAL PRIMARY KEY,
    board_id   VARCHAR(5) REFERENCES boards (code) ON DELETE RESTRICT DEFERRABLE,
    op_post_id INTEGER,
    title      VARCHAR(100) NOT NULL
);

-- Posts table (both threads and replies)
CREATE TABLE posts
(
    id         SERIAL PRIMARY KEY,
    is_op      BOOLEAN,
    board_id   VARCHAR(5) NOT NULL REFERENCES boards (code) ON DELETE RESTRICT,
    thread_id  INTEGER REFERENCES threads (id) ON DELETE CASCADE, -- NULL for threads, post_id for replies                                       -- Optional, typically used for threads
    content    TEXT       NOT NULL,                               -- Optional image attachment
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Index for faster queries
CREATE INDEX IF NOT EXISTS idx_posts_parent ON posts (id);
CREATE INDEX IF NOT EXISTS idx_posts_thread ON threads (id);