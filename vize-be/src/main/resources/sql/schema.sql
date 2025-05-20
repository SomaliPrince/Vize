DROP TABLE boards CASCADE;
DROP TABLE threads CASCADE;
DROP TABLE posts;
-- Boards table
CREATE TABLE boards
(
    id          SERIAL PRIMARY KEY,
    board_code  VARCHAR(5)   NOT NULL UNIQUE, -- Short code like 'tech', 'art', etc.
    board_name  VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE threads
(
    id         SERIAL PRIMARY KEY,
    board_id   INTEGER REFERENCES boards (id) ON DELETE CASCADE,
    op_post_id INTEGER,
    title      VARCHAR(100) NOT NULL
);

-- Posts table (both threads and replies)
CREATE TABLE posts
(
    id         SERIAL PRIMARY KEY,
    is_op      BOOLEAN,
    board_id   INTEGER NOT NULL REFERENCES boards (id) ON DELETE CASCADE,
    thread_id  INTEGER REFERENCES threads (id) ON DELETE CASCADE, -- NULL for threads, post_id for replies                                       -- Optional, typically used for threads
    content    TEXT    NOT NULL,                                  -- Optional image attachment
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE threads
    ADD CONSTRAINT fk_threads_posts
        FOREIGN KEY (op_post_id)
            REFERENCES posts (id)
            ON DELETE CASCADE;

-- Index for faster queries
CREATE INDEX IF NOT EXISTS idx_posts_parent ON posts (id);
CREATE INDEX IF NOT EXISTS idx_posts_thread ON threads (id);