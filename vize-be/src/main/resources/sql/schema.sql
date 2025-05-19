-- Users table
CREATE TABLE IF NOT EXISTS users
(
    user_id       SERIAL PRIMARY KEY,
    username      VARCHAR(50)  NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    email         VARCHAR(255) UNIQUE,
    is_admin      BOOLEAN   DEFAULT FALSE,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Boards table
CREATE TABLE IF NOT EXISTS boards
(
    board_id    SERIAL PRIMARY KEY,
    board_code  VARCHAR(10)  NOT NULL UNIQUE, -- Short code like 'tech', 'art', etc.
    board_name  VARCHAR(100) NOT NULL,
    description TEXT
);

-- Posts table (both threads and replies)
CREATE TABLE IF NOT EXISTS posts
(
    post_id    SERIAL PRIMARY KEY,
    board_id   INTEGER NOT NULL REFERENCES boards (board_id) ON DELETE CASCADE,
    user_id    INTEGER REFERENCES users (user_id) ON DELETE SET NULL, -- NULL for anonymous posts
    parent_id  INTEGER REFERENCES posts (post_id) ON DELETE CASCADE,  -- NULL for threads, post_id for replies
    subject    VARCHAR(255),                                          -- Optional, typically used for threads
    content    TEXT    NOT NULL,
    image_url  VARCHAR(255),                                          -- Optional image attachment
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Index for faster queries
CREATE INDEX IF NOT EXISTS idx_posts_parent ON posts (parent_id);
CREATE INDEX IF NOT EXISTS idx_posts_board ON posts (board_id);